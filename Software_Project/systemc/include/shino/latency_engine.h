#ifndef SHINO_LATENCY_ENGINE_H
#define SHINO_LATENCY_ENGINE_H

#include <cstdint>
#include <deque>
#include <string>
#include <unordered_map>

namespace shino {

using TimeNs = std::uint64_t;

struct RegisterTiming {
  TimeNs read_latency_ns = 0;
  TimeNs write_latency_ns = 0;
  std::uint32_t depth = 1;
  bool queue_backed = false;
};

struct QueueSnapshot {
  std::uint32_t occupancy = 0;
  std::uint32_t depth = 0;
  TimeNs next_visible_ns = 0;
};

// A deterministic, host-time-independent queue timing model.  Functional data
// deliberately remains outside this class and is owned by SystemC.
class LatencyEngine {
 public:
  void register_target(std::uintptr_t address, const RegisterTiming& timing);
  void set_timing(std::uintptr_t address, const RegisterTiming& timing);

  TimeNs read_latency(std::uintptr_t address) const;
  TimeNs write_latency(std::uintptr_t address) const;

  bool can_accept(std::uintptr_t address) const;
  bool reserve_write(std::uintptr_t address);
  void cancel_write(std::uintptr_t address);
  bool has_visible_token(std::uintptr_t address, TimeNs now_ns) const;
  TimeNs next_visible_time(std::uintptr_t address) const;
  bool tracks(std::uintptr_t address) const;
  void produce(std::uintptr_t address, TimeNs visible_at_ns,
               std::uint32_t count = 1);
  bool consume(std::uintptr_t address, TimeNs now_ns);
  void clear(std::uintptr_t address);
  QueueSnapshot snapshot(std::uintptr_t address) const;

 private:
  struct QueueState {
    RegisterTiming timing;
    std::deque<TimeNs> visible_at;
    std::uint32_t write_reservations = 0;
  };
  std::unordered_map<std::uintptr_t, QueueState> queues_;
};

}  // namespace shino

#endif  // SHINO_LATENCY_ENGINE_H
