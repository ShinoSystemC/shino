#include <cerrno>
#include <chrono>
#include <csignal>
#include <cstring>
#include <fcntl.h>
#include <iostream>
#include <new>
#include <sys/mman.h>
#include <sys/stat.h>
#include <thread>
#include <unistd.h>

#include "shino/config.h"
#include "shino/latency_engine.h"
#include "shino/mmio.h"
#include "shino/transport.h"

namespace {
volatile std::sig_atomic_t running = 1;
void stop(int) { running = 0; }
}

int main(int argc, char** argv) {
  const char* name = argc > 1 ? argv[1] : "/shino_mmio_transport";
  const int fd = shm_open(name, O_CREAT | O_RDWR, 0666);
  if (fd < 0) {
    std::cerr << "shm_open: " << std::strerror(errno) << '\n';
    return 1;
  }
  if (ftruncate(fd, sizeof(shino::SharedTransport)) != 0) {
    std::cerr << "ftruncate: " << std::strerror(errno) << '\n';
    close(fd);
    return 1;
  }
  void* mapping = mmap(nullptr, sizeof(shino::SharedTransport),
                       PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
  close(fd);
  if (mapping == MAP_FAILED) {
    std::cerr << "mmap: " << std::strerror(errno) << '\n';
    return 1;
  }
  auto* transport = new (mapping) shino::SharedTransport();
  const auto config = shino::Config::from_environment();
  shino::LatencyEngine engine;
  shino::Wrapper wrapper(&engine);

  std::signal(SIGINT, stop);
  std::signal(SIGTERM, stop);
  transport->wrapper_ready.store(1, std::memory_order_release);
  while (running) {
    transport->wrapper_heartbeat.fetch_add(1, std::memory_order_relaxed);
    shino::WireRequest request;
    if (!transport->requests.try_pop(request)) {
      std::this_thread::sleep_for(std::chrono::milliseconds(1));
      continue;
    }
    // This worker is deliberately transport-only: a SystemC gateway returns
    // functional results on the response ring; online policy can then be moved
    // here without changing the firmware or model-facing ABI.
    const auto host_request = shino::from_wire(request);
    const auto response = wrapper.schedule(host_request, host_request.value);
    while (running && !transport->responses.try_push(shino::to_wire(response)))
      std::this_thread::yield();
  }
  transport->wrapper_ready.store(0, std::memory_order_release);
  munmap(mapping, sizeof(shino::SharedTransport));
  return 0;
}
