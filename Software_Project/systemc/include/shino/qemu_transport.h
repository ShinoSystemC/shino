#ifndef SHINO_QEMU_TRANSPORT_H
#define SHINO_QEMU_TRANSPORT_H

#include <cstdint>

namespace shino {

constexpr std::uint32_t kQemuTransportMagic = 0x53484e4f;  // SHNO
constexpr std::uint32_t kQemuTransportVersion = 3;

enum class QemuOperation : std::uint32_t { kRead = 0, kWrite = 1 };
enum class QemuSlotState : std::uint32_t {
  kIdle = 0,
  kRequest = 1,
  kResponse = 2,
  kShutdown = 3,
  kError = 4,
};

struct QemuMmioMessage {
  std::uint64_t sequence;
  std::uint64_t address;
  std::uint64_t value;
  std::uint64_t issued_virtual_ns;
  std::uint64_t visible_virtual_ns;
  std::uint32_t width;
  QemuOperation operation;
  std::int32_t status;
  std::uint32_t reserved;
};

struct QemuSharedTransport {
  std::uint32_t magic;
  std::uint32_t version;
  std::uint64_t epoch;
  std::uint32_t qemu_ready;
  std::uint32_t bridge_ready;
  std::uint64_t qemu_heartbeat;
  std::uint64_t bridge_heartbeat;
  std::uint64_t completion_sequence;
  std::uint64_t completion_virtual_ns;
  std::uint64_t completion_trigger_virtual_ns;
  std::uint32_t completion_pending;
  std::uint32_t completion_ack;
  QemuSlotState state;
  std::uint32_t reserved;
  QemuMmioMessage message;
};

static_assert(sizeof(QemuOperation) == 4, "wire enum must be 32-bit");
static_assert(sizeof(QemuSlotState) == 4, "wire state must be 32-bit");

}  // namespace shino

#endif
