#ifndef SHINO_CONFIG_H
#define SHINO_CONFIG_H

#include <cstdint>
#include <string>
#include <unordered_map>

#include "shino/latency_engine.h"

namespace shino {

enum class Mode { kBypass, kObserve, kTimed };

struct Config {
  Mode mode = Mode::kBypass;
  TimeNs default_read_latency_ns = 0;
  TimeNs default_write_latency_ns = 0;
  TimeNs default_service_time_ns = 0;
  std::uint32_t placeholder = 0xffffffffu;
  std::string graph_path;
  std::string trace_path;
  std::unordered_map<std::string, RegisterTiming> register_overrides;
  std::unordered_map<std::string, TimeNs> process_service_time_ns;

  TimeNs service_time_for(const std::string& process) const;
  static Config from_environment();
  static Config load(const std::string& path);
};

const char* mode_name(Mode mode);

}  // namespace shino

#endif  // SHINO_CONFIG_H
