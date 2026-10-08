#include "shino/device_protocol.h"
#include "shino/qemu_transport.h"
#include "shino/register_bank.h"
#include <atomic>
#include <cerrno>
#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <iostream>
#include <string>
#include <sys/mman.h>
#include <thread>
#include <unistd.h>

namespace {
using shino::QemuOperation; using shino::QemuSharedTransport; using shino::QemuSlotState;
struct Map { int fd; void* p; std::size_t n; };
Map map_existing(const char* name, std::size_t n) {
  int fd = shm_open(name, O_RDWR, 0600); if (fd < 0) return {-1, MAP_FAILED, n};
  return {fd, mmap(nullptr, n, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0), n};
}
Map map_transport(const char* name) {
  int fd = shm_open(name, O_RDWR | O_CREAT, 0600); const auto n = sizeof(QemuSharedTransport);
  if (fd < 0 || ftruncate(fd, n)) return {-1, MAP_FAILED, n};
  return {fd, mmap(nullptr, n, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0), n};
}
std::uint64_t env(const char* key, std::uint64_t fallback) {
  const char* v = std::getenv(key); return v ? std::strtoull(v, nullptr, 0) : fallback;
}
struct Target {
  std::uint64_t base, size; shino::RegisterSlot* slots;
  std::uint64_t read_ns, write_ns, service_ns; std::uint32_t launch, commit;
  const char* trace; bool pending = false; std::uint64_t seq = 0, deadline = 0, index = 0;
};
void slot_access(Target& t, std::uint32_t off, bool write, std::uint32_t* value) {
  auto& s = t.slots[off / 4]; while (__atomic_load_n(&s.request, __ATOMIC_ACQUIRE)) std::this_thread::yield();
  if (write) s.value = *value;
  s.operation = write ? 1 : 0; s.response = 0;
  __atomic_store_n(&s.request, 1u, __ATOMIC_RELEASE);
  while (!__atomic_load_n(&s.response, __ATOMIC_ACQUIRE)) std::this_thread::yield();
  *value = s.value; __atomic_store_n(&s.response, 0u, __ATOMIC_RELEASE);
}
void publish(Target& t, QemuSharedTransport* wire, std::uint64_t trigger) {
  std::uint32_t seq = static_cast<std::uint32_t>(t.seq); slot_access(t, t.commit, true, &seq);
  t.pending = false; __atomic_store_n(&wire->completion_ack, 1u, __ATOMIC_RELEASE);
  __atomic_store_n(&wire->completion_pending, 0u, __ATOMIC_RELEASE);
  if (env("SHINO_TRACE", 1)) std::cerr << "TRACE " << t.trace << "_commit seq=" << t.seq << " deadline_ns=" << t.deadline
            << " trigger_ns=" << trigger << " lateness_ns=" << (trigger > t.deadline ? trigger - t.deadline : 0) << '\n';
}
int relay(Target& t, QemuSharedTransport* transport) {
  auto& m = transport->message;
  if (m.address < t.base || m.address + m.width > t.base + t.size || m.width != 4 || (m.address & 3)) return -EINVAL;
  const auto off = static_cast<std::uint32_t>(m.address - t.base);
  std::uint32_t value = static_cast<std::uint32_t>(m.value);
  slot_access(t, off, m.operation == QemuOperation::kWrite, &value); m.value = value;
  const auto latency = m.operation == QemuOperation::kRead ? t.read_ns : t.write_ns;
  m.visible_virtual_ns = m.issued_virtual_ns + latency;
  if (m.operation == QemuOperation::kWrite && off == shino::kConvIndex) t.index = value;
  const bool launch = m.operation == QemuOperation::kWrite && off == t.launch &&
                      (t.base != shino::kConvBase || (t.index == 4 && value));
  if (launch) {
    if (t.pending || __atomic_load_n(&transport->completion_pending, __ATOMIC_ACQUIRE)) return -EBUSY;
    const auto service = t.base == shino::kCdmaBase ? (t.service_ns * value + 4095) / 4096 : t.service_ns;
    t.pending = true; t.seq = m.sequence; t.deadline = m.visible_virtual_ns + service;
    transport->completion_sequence = t.seq; transport->completion_virtual_ns = t.deadline;
    transport->completion_trigger_virtual_ns = 0; transport->completion_ack = 0;
    __atomic_store_n(&transport->completion_pending, 1u, __ATOMIC_RELEASE);
    if (env("SHINO_TRACE", 1)) std::cerr << "TRACE " << t.trace << "_start seq=" << t.seq << " issue_ns=" << m.issued_virtual_ns
              << " response_ns=" << m.visible_virtual_ns << " completion_ns=" << t.deadline << '\n';
  }
  return 0;
}
}
int main() {
  auto tm = map_transport(shino::kTransport);
  auto cm = map_existing(shino::kCdmaRegisters, shino::kCdmaSize / 4 * sizeof(shino::RegisterSlot));
  auto vm = map_existing(shino::kConvRegisters, shino::kConvSize / 4 * sizeof(shino::RegisterSlot));
  if (tm.p == MAP_FAILED || cm.p == MAP_FAILED || vm.p == MAP_FAILED) return 1;
  auto* tr = static_cast<QemuSharedTransport*>(tm.p); std::memset(tr, 0, sizeof(*tr));
  tr->magic = shino::kQemuTransportMagic; tr->version = shino::kQemuTransportVersion; tr->epoch = 1; tr->bridge_ready = 1;
  Target cdma{shino::kCdmaBase, shino::kCdmaSize, static_cast<shino::RegisterSlot*>(cm.p), env("SHINO_CDMA_READ_NS",302),env("SHINO_CDMA_WRITE_NS",62),env("SHINO_CDMA_SERVICE_NS",7967),shino::kCdmaLength,shino::kCdmaCommit,"dma"};
  Target conv{shino::kConvBase, shino::kConvSize, static_cast<shino::RegisterSlot*>(vm.p), env("SHINO_CONV_READ_NS",287),env("SHINO_CONV_WRITE_NS",50),env("SHINO_CONV_SERVICE_NS",45500),shino::kConvData,shino::kConvCommit,"conv"};
  std::cerr << "SHINO_BRIDGE_READY\n";
  for (;;) {
    if (__atomic_load_n(&tr->completion_pending, __ATOMIC_ACQUIRE) == 2) {
      auto trigger = __atomic_load_n(&tr->completion_trigger_virtual_ns, __ATOMIC_ACQUIRE);
      if (cdma.pending) publish(cdma,tr,trigger); else if (conv.pending) publish(conv,tr,trigger);
    }
    auto state = __atomic_load_n(&tr->state, __ATOMIC_ACQUIRE); if (state == QemuSlotState::kShutdown) break;
    if (state != QemuSlotState::kRequest) { std::this_thread::yield(); continue; }
    auto a = tr->message.address; tr->message.status = a >= cdma.base && a < cdma.base+cdma.size ? relay(cdma,tr) : a >= conv.base && a < conv.base+conv.size ? relay(conv,tr) : -EINVAL;
    __atomic_store_n(&tr->state, tr->message.status ? QemuSlotState::kError : QemuSlotState::kResponse, __ATOMIC_RELEASE);
  }
  return 0;
}
