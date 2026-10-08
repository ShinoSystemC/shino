#ifndef SHINO_TRANSPORT_H
#define SHINO_TRANSPORT_H

#include <array>
#include <atomic>
#include <cstddef>
#include <cstdint>
#include <type_traits>

#include "shino/mmio.h"

namespace shino {

constexpr std::uint32_t kTransportVersion = 1;
constexpr std::size_t kTransportCapacity = 256;

enum class WireOperation : std::uint8_t { kRead = 0, kWrite = 1 };

struct WireRequest {
  std::uint64_t sequence = 0;
  std::uint64_t address = 0;
  std::uint64_t value = 0;
  std::uint64_t accepted_at_ns = 0;
  std::uint32_t width = 4;
  WireOperation operation = WireOperation::kRead;
  std::uint8_t reserved[3] = {};
};

struct WireResponse {
  std::uint64_t sequence = 0;
  std::uint64_t value = 0;
  std::uint64_t visible_at_ns = 0;
  std::uint8_t ok = 1;
  std::uint8_t reserved[7] = {};
};

template <typename T, std::size_t Capacity>
class SpscRing {
  static_assert(Capacity > 1, "ring capacity must exceed one");
  static_assert(std::is_trivially_copyable<T>::value,
                "shared-memory records must be trivially copyable");

 public:
  bool try_push(const T& value) {
    const auto head = head_.load(std::memory_order_relaxed);
    const auto next = increment(head);
    if (next == tail_.load(std::memory_order_acquire)) return false;
    entries_[head] = value;
    head_.store(next, std::memory_order_release);
    return true;
  }

  bool try_pop(T& value) {
    const auto tail = tail_.load(std::memory_order_relaxed);
    if (tail == head_.load(std::memory_order_acquire)) return false;
    value = entries_[tail];
    tail_.store(increment(tail), std::memory_order_release);
    return true;
  }

  bool empty() const {
    return head_.load(std::memory_order_acquire) ==
           tail_.load(std::memory_order_acquire);
  }

  std::size_t size() const {
    const auto head = head_.load(std::memory_order_acquire);
    const auto tail = tail_.load(std::memory_order_acquire);
    return head >= tail ? head - tail : Capacity - tail + head;
  }

 private:
  static constexpr std::uint32_t increment(std::uint32_t value) {
    return static_cast<std::uint32_t>((value + 1) % Capacity);
  }

  alignas(64) std::atomic<std::uint32_t> head_{0};
  alignas(64) std::atomic<std::uint32_t> tail_{0};
  std::array<T, Capacity> entries_{};
};

struct SharedTransport {
  std::uint32_t version = kTransportVersion;
  std::atomic<std::uint32_t> wrapper_ready{0};
  std::atomic<std::uint32_t> systemc_ready{0};
  std::atomic<std::uint64_t> wrapper_heartbeat{0};
  std::atomic<std::uint64_t> systemc_heartbeat{0};
  SpscRing<WireRequest, kTransportCapacity> requests;
  SpscRing<WireResponse, kTransportCapacity> responses;
};

WireRequest to_wire(const MmioRequest& request);
MmioRequest from_wire(const WireRequest& request);
WireResponse to_wire(const MmioResponse& response);
MmioResponse from_wire(const WireResponse& response);

}  // namespace shino

#endif  // SHINO_TRANSPORT_H
