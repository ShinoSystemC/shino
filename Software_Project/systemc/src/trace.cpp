#include "shino/trace.h"

#include <iomanip>

namespace shino {
namespace {

void json_string(std::ostream& out, const std::string& value) {
  out << '"';
  for (unsigned char c : value) {
    switch (c) {
      case '\\': out << "\\\\"; break;
      case '"': out << "\\\""; break;
      case '\n': out << "\\n"; break;
      case '\r': out << "\\r"; break;
      case '\t': out << "\\t"; break;
      default:
        if (c < 0x20)
          out << "\\u" << std::hex << std::setw(4) << std::setfill('0')
              << static_cast<int>(c) << std::dec;
        else
          out << c;
    }
  }
  out << '"';
}

}  // namespace

TraceWriter::~TraceWriter() {
  if (stream_) stream_.flush();
}

bool TraceWriter::open(const std::string& path) {
  std::lock_guard<std::mutex> lock(mutex_);
  stream_.open(path, std::ios::out | std::ios::trunc);
  return static_cast<bool>(stream_);
}

void TraceWriter::record(TraceEvent event) {
  std::lock_guard<std::mutex> lock(mutex_);
  if (!stream_) return;
  event.sequence = next_sequence_++;
  stream_ << "{\"sequence\":" << event.sequence << ",\"time_ns\":"
          << event.time_ns << ",\"type\":";
  json_string(stream_, event.type);
  stream_ << ",\"process\":";
  json_string(stream_, event.process);
  stream_ << ",\"module\":";
  json_string(stream_, event.module);
  stream_ << ",\"register\":";
  json_string(stream_, event.reg);
  stream_ << ",\"address\":" << event.address << ",\"value\":"
          << event.value << "}\n";
}

}  // namespace shino
