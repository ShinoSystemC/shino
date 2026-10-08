#include <cassert>
#include <chrono>
#include <csignal>
#include <cstdint>
#include <cstdlib>
#include <fcntl.h>
#include <iostream>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <thread>
#include <unistd.h>

#include "shino/transport.h"

int main() {
  const std::string name = "/shino_transport_test_" + std::to_string(getpid());
  shm_unlink(name.c_str());
  const pid_t child = fork();
  assert(child >= 0);
  if (child == 0) {
    execl("./shino-wrapper", "shino-wrapper", name.c_str(),
          static_cast<char*>(nullptr));
    _exit(127);
  }

  int fd = -1;
  for (int i = 0; i < 200 && fd < 0; ++i) {
    fd = shm_open(name.c_str(), O_RDWR, 0666);
    if (fd < 0) std::this_thread::sleep_for(std::chrono::milliseconds(5));
  }
  assert(fd >= 0);
  void* mapping = mmap(nullptr, sizeof(shino::SharedTransport),
                       PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
  close(fd);
  assert(mapping != MAP_FAILED);
  auto* transport = static_cast<shino::SharedTransport*>(mapping);
  for (int i = 0; i < 200 &&
                  transport->wrapper_ready.load(std::memory_order_acquire) == 0;
       ++i)
    std::this_thread::sleep_for(std::chrono::milliseconds(5));
  assert(transport->version == shino::kTransportVersion);
  assert(transport->wrapper_ready.load(std::memory_order_acquire) == 1);

  /* Queue several requests before collecting responses. The SPSC ABI must
   * preserve order and associate each response by sequence. */
  constexpr std::uint64_t kCount = 64;
  for (std::uint64_t i = 0; i < kCount; ++i) {
    shino::MmioRequest request{99 + i, 0x1234 + 4 * i, 4,
                               shino::AccessKind::kWrite,
                               0xdeadbeef + i, 1000 + 7 * i};
    assert(transport->requests.try_push(shino::to_wire(request)));
  }
  for (std::uint64_t i = 0; i < kCount; ++i) {
    shino::WireResponse wire_response;
    bool received = false;
    for (int retry = 0; retry < 1000 && !received; ++retry) {
      received = transport->responses.try_pop(wire_response);
      if (!received) std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }
    assert(received);
    const auto response = shino::from_wire(wire_response);
    assert(response.sequence == 99 + i);
    assert(response.value == 0xdeadbeef + i);
    assert(response.visible_at_ns == 1000 + 7 * i);
    assert(response.ok);
  }
  assert(transport->requests.empty());
  assert(transport->responses.empty());

  kill(child, SIGTERM);
  int status = 0;
  waitpid(child, &status, 0);
  assert(WIFEXITED(status));
  munmap(mapping, sizeof(shino::SharedTransport));
  shm_unlink(name.c_str());
  return 0;
}
