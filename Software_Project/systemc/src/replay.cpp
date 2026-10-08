#include "shino/replay.h"

#include <limits>
#include <stdexcept>

namespace shino {
namespace {

std::uint64_t number_field(const std::string& line, const std::string& key) {
  const std::string marker = "\"" + key + "\":";
  auto position = line.find(marker);
  if (position == std::string::npos)
    throw std::runtime_error("missing trace field: " + key);
  position += marker.size();
  auto end = position;
  while (end < line.size() && line[end] >= '0' && line[end] <= '9') ++end;
  if (end == position) throw std::runtime_error("invalid trace field: " + key);
  std::size_t consumed = 0;
  auto value = std::stoull(line.substr(position, end - position), &consumed);
  if (consumed != end - position)
    throw std::runtime_error("invalid trace integer: " + key);
  return value;
}

std::string string_field(const std::string& line, const std::string& key) {
  const std::string marker = "\"" + key + "\":\"";
  auto position = line.find(marker);
  if (position == std::string::npos)
    throw std::runtime_error("missing trace field: " + key);
  position += marker.size();
  std::string value;
  bool escaped = false;
  for (; position < line.size(); ++position) {
    const char c = line[position];
    if (!escaped && c == '"') return value;
    if (!escaped && c == '\\') {
      escaped = true;
      continue;
    }
    if (escaped) {
      switch (c) {
        case '"': value.push_back('"'); break;
        case '\\': value.push_back('\\'); break;
        case 'n': value.push_back('\n'); break;
        case 'r': value.push_back('\r'); break;
        case 't': value.push_back('\t'); break;
        default: throw std::runtime_error("unsupported trace escape");
      }
      escaped = false;
    } else {
      value.push_back(c);
    }
  }
  throw std::runtime_error("unterminated trace string: " + key);
}

}  // namespace

ReplaySummary replay_trace(std::istream& input) {
  ReplaySummary summary;
  std::uint64_t expected_sequence = 1;
  std::string line;
  while (std::getline(input, line)) {
    if (line.empty()) continue;
    const auto sequence = number_field(line, "sequence");
    if (sequence != expected_sequence++)
      throw std::runtime_error("non-monotonic trace sequence");
    const auto time = number_field(line, "time_ns");
    if (summary.events != 0 && time < summary.last_time_ns)
      throw std::runtime_error("non-monotonic trace time");
    const auto type = string_field(line, "type");
    if (type == "register_read") ++summary.reads;
    else if (type == "register_write") ++summary.writes;
    else if (type != "register_clear")
      throw std::runtime_error("unknown trace event: " + type);
    if (summary.events == 0) summary.first_time_ns = time;
    summary.last_time_ns = time;
    ++summary.events;
  }
  return summary;
}

}  // namespace shino
