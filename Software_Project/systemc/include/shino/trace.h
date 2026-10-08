#ifndef SHINO_TRACE_H
#define SHINO_TRACE_H

#include <cstdint>
#include <fstream>
#include <mutex>
#include <string>

namespace shino {

struct TraceEvent {
  std::uint64_t sequence = 0;
  std::uint64_t time_ns = 0;
  std::string type;
  std::string process;
  std::string module;
  std::string reg;
  std::uintptr_t address = 0;
  std::uint64_t value = 0;
};

class TraceWriter {
 public:
  TraceWriter() = default;
  ~TraceWriter();
  bool open(const std::string& path);
  void record(TraceEvent event);

 private:
  std::mutex mutex_;
  std::ofstream stream_;
  std::uint64_t next_sequence_ = 1;
};

}  // namespace shino

#endif  // SHINO_TRACE_H
