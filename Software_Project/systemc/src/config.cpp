#include "shino/config.h"

#include <algorithm>
#include <cctype>
#include <cstdlib>
#include <fstream>
#include <sstream>
#include <stdexcept>

namespace shino {
namespace {

std::string trim(std::string value) {
  auto not_space = [](unsigned char c) { return !std::isspace(c); };
  value.erase(value.begin(), std::find_if(value.begin(), value.end(), not_space));
  value.erase(std::find_if(value.rbegin(), value.rend(), not_space).base(),
              value.end());
  return value;
}

Mode parse_mode(const std::string& value) {
  if (value == "bypass") return Mode::kBypass;
  if (value == "observe") return Mode::kObserve;
  if (value == "timed") return Mode::kTimed;
  throw std::runtime_error("unknown Shino mode: " + value);
}

std::uint64_t parse_u64(const std::string& value, const std::string& key) {
  std::size_t consumed = 0;
  auto parsed = std::stoull(value, &consumed, 0);
  if (consumed != value.size()) throw std::runtime_error("invalid " + key);
  return parsed;
}

}  // namespace

Config Config::from_environment() {
  const char* path = std::getenv("SHINO_CONFIG");
  Config config = path && *path ? load(path) : Config{};
  if (const char* mode = std::getenv("SHINO_MODE")) config.mode = parse_mode(mode);
  if (const char* graph = std::getenv("SHINO_GRAPH")) config.graph_path = graph;
  if (const char* trace = std::getenv("SHINO_TRACE")) config.trace_path = trace;
  return config;
}

// Dependency-free line format:
//   mode=observe
//   default_read_latency_ns=100
//   register.echo.ECHO_TEST_CQ.read_latency_ns=500
// Unknown keys are rejected to keep experiments reproducible.
Config Config::load(const std::string& path) {
  std::ifstream input(path);
  if (!input) throw std::runtime_error("cannot open Shino config: " + path);
  Config config;
  std::string line;
  std::size_t line_no = 0;
  while (std::getline(input, line)) {
    ++line_no;
    auto comment = line.find('#');
    if (comment != std::string::npos) line.erase(comment);
    line = trim(line);
    if (line.empty()) continue;
    auto equal = line.find('=');
    if (equal == std::string::npos)
      throw std::runtime_error("invalid Shino config line " +
                               std::to_string(line_no));
    std::string key = trim(line.substr(0, equal));
    std::string value = trim(line.substr(equal + 1));
    if (key == "mode") config.mode = parse_mode(value);
    else if (key == "default_read_latency_ns")
      config.default_read_latency_ns = parse_u64(value, key);
    else if (key == "default_write_latency_ns")
      config.default_write_latency_ns = parse_u64(value, key);
    else if (key == "default_service_time_ns")
      config.default_service_time_ns = parse_u64(value, key);
    else if (key == "placeholder")
      config.placeholder = static_cast<std::uint32_t>(parse_u64(value, key));
    else if (key == "graph_path") config.graph_path = value;
    else if (key == "trace_path") config.trace_path = value;
    else if (key.rfind("process.", 0) == 0 &&
             key.size() > sizeof("process..service_time_ns") - 1 &&
             key.compare(key.size() - sizeof(".service_time_ns") + 1,
                         sizeof(".service_time_ns") - 1,
                         ".service_time_ns") == 0) {
      const auto begin = sizeof("process.") - 1;
      const auto length = key.size() - begin - (sizeof(".service_time_ns") - 1);
      const std::string process = key.substr(begin, length);
      if (process.empty()) throw std::runtime_error("invalid process key: " + key);
      config.process_service_time_ns[process] = parse_u64(value, key);
    }
    else if (key.rfind("register.", 0) == 0) {
      auto suffix = key.rfind('.');
      if (suffix <= 9) throw std::runtime_error("invalid register key: " + key);
      const std::string target = key.substr(9, suffix - 9);
      const std::string field = key.substr(suffix + 1);
      auto& timing = config.register_overrides[target];
      if (field == "read_latency_ns") timing.read_latency_ns = parse_u64(value, key);
      else if (field == "write_latency_ns") timing.write_latency_ns = parse_u64(value, key);
      else if (field == "depth") timing.depth = static_cast<std::uint32_t>(parse_u64(value, key));
      else throw std::runtime_error("unknown Shino config key: " + key);
    } else {
      throw std::runtime_error("unknown Shino config key: " + key);
    }
  }
  return config;
}

TimeNs Config::service_time_for(const std::string& process) const {
  auto it = process_service_time_ns.find(process);
  return it == process_service_time_ns.end() ? default_service_time_ns
                                              : it->second;
}

const char* mode_name(Mode mode) {
  switch (mode) {
    case Mode::kBypass: return "bypass";
    case Mode::kObserve: return "observe";
    case Mode::kTimed: return "timed";
  }
  return "unknown";
}

}  // namespace shino
