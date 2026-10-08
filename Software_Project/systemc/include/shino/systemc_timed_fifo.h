#pragma once
#include <systemc>
#include <cstdint>
#include <deque>
#include <string>
#include "shino/causal_graph.h"

namespace shino {
struct TimedToken { std::uint32_t value; sc_core::sc_time eligible; };

class TimedFifo {
 public:
  TimedFifo(std::string module, std::string name, std::uintptr_t address,
            CausalGraph& graph) : module_(std::move(module)), name_(std::move(name)),
            address_(address), graph_(graph) {}
  void write(std::uint32_t value, bool observe = true) {
    if (observe) graph_.observe(sc_core::sc_get_current_process_handle().name(), module_, name_,
                   address_, AccessKind::kWrite, true);
    tokens_.push_back({value, sc_core::sc_time_stamp()}); event_.notify(sc_core::SC_ZERO_TIME);
  }
  std::uint32_t read(bool observe = true) {
    if (observe) graph_.observe(sc_core::sc_get_current_process_handle().name(), module_, name_,
                   address_, AccessKind::kRead, true);
    while (tokens_.empty()) sc_core::wait(event_);
    auto token=tokens_.front(); tokens_.pop_front();
    if (sc_core::sc_time_stamp()<token.eligible) sc_core::wait(token.eligible-sc_core::sc_time_stamp());
    return token.value;
  }
 private:
  std::string module_,name_; std::uintptr_t address_; CausalGraph& graph_;
  std::deque<TimedToken> tokens_; sc_core::sc_event event_;
};
}
