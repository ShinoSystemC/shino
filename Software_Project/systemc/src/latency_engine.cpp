#include "shino/latency_engine.h"

#include <algorithm>

namespace shino {

void LatencyEngine::register_target(std::uintptr_t address,
                                    const RegisterTiming& timing) {
  queues_.emplace(address, QueueState{timing, {}, 0});
}

void LatencyEngine::set_timing(std::uintptr_t address,
                               const RegisterTiming& timing) {
  queues_[address].timing = timing;
}

TimeNs LatencyEngine::read_latency(std::uintptr_t address) const {
  auto it = queues_.find(address);
  return it == queues_.end() ? 0 : it->second.timing.read_latency_ns;
}

TimeNs LatencyEngine::write_latency(std::uintptr_t address) const {
  auto it = queues_.find(address);
  return it == queues_.end() ? 0 : it->second.timing.write_latency_ns;
}

bool LatencyEngine::can_accept(std::uintptr_t address) const {
  auto it = queues_.find(address);
  if (it == queues_.end() || !it->second.timing.queue_backed) return true;
  return it->second.visible_at.size() + it->second.write_reservations <
         it->second.timing.depth;
}

bool LatencyEngine::reserve_write(std::uintptr_t address) {
  auto it = queues_.find(address);
  if (it == queues_.end() || !it->second.timing.queue_backed) return true;
  if (!can_accept(address)) return false;
  ++it->second.write_reservations;
  return true;
}

void LatencyEngine::cancel_write(std::uintptr_t address) {
  auto it = queues_.find(address);
  if (it != queues_.end() && it->second.write_reservations > 0)
    --it->second.write_reservations;
}

bool LatencyEngine::has_visible_token(std::uintptr_t address,
                                      TimeNs now_ns) const {
  auto it = queues_.find(address);
  if (it == queues_.end() || it->second.visible_at.empty()) return false;
  return it->second.visible_at.front() <= now_ns;
}

TimeNs LatencyEngine::next_visible_time(std::uintptr_t address) const {
  auto it = queues_.find(address);
  if (it == queues_.end() || it->second.visible_at.empty()) return 0;
  return it->second.visible_at.front();
}

bool LatencyEngine::tracks(std::uintptr_t address) const {
  auto it = queues_.find(address);
  return it != queues_.end() && it->second.timing.queue_backed;
}

void LatencyEngine::produce(std::uintptr_t address, TimeNs visible_at_ns,
                            std::uint32_t count) {
  auto it = queues_.find(address);
  if (it == queues_.end() || !it->second.timing.queue_backed) return;
  while (count-- > 0 && it->second.visible_at.size() < it->second.timing.depth) {
    if (it->second.write_reservations > 0) --it->second.write_reservations;
    if (!it->second.visible_at.empty())
      visible_at_ns = std::max(visible_at_ns, it->second.visible_at.back());
    it->second.visible_at.push_back(visible_at_ns);
  }
}

bool LatencyEngine::consume(std::uintptr_t address, TimeNs now_ns) {
  auto it = queues_.find(address);
  if (it == queues_.end() || it->second.visible_at.empty() ||
      it->second.visible_at.front() > now_ns) {
    return false;
  }
  it->second.visible_at.pop_front();
  return true;
}

void LatencyEngine::clear(std::uintptr_t address) {
  auto it = queues_.find(address);
  if (it != queues_.end()) {
    it->second.visible_at.clear();
    it->second.write_reservations = 0;
  }
}

QueueSnapshot LatencyEngine::snapshot(std::uintptr_t address) const {
  auto it = queues_.find(address);
  if (it == queues_.end()) return {};
  return {static_cast<std::uint32_t>(it->second.visible_at.size()),
          it->second.timing.depth,
          it->second.visible_at.empty() ? 0 : it->second.visible_at.front()};
}

}  // namespace shino
