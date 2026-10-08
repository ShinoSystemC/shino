#ifndef SHINO_MMIO_H
#define SHINO_MMIO_H

#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>

#include "shino/causal_graph.h"
#include "shino/latency_engine.h"

namespace shino {

struct MmioRequest {
  std::uint64_t sequence = 0;
  std::uintptr_t address = 0;
  std::uint32_t width = 4;
  AccessKind kind = AccessKind::kRead;
  std::uint64_t value = 0;
  TimeNs accepted_at_ns = 0;
};

struct MmioResponse {
  std::uint64_t sequence = 0;
  std::uint64_t value = 0;
  TimeNs visible_at_ns = 0;
  bool ok = true;
};

struct TargetDescriptor {
  std::string module;
  std::string reg;
  std::uintptr_t address = 0;
  bool queue_backed = false;
  std::uint32_t depth = 1;
};

// Address decoder shared by the direct path and a future out-of-process
// transport. It contains metadata only and never owns register payloads.
class MmioGateway {
 public:
  bool add(TargetDescriptor target);
  const TargetDescriptor* find(std::uintptr_t address) const;
  std::vector<TargetDescriptor> targets() const;

 private:
  std::unordered_map<std::uintptr_t, TargetDescriptor> targets_;
};

// Wrapper-side response scheduler. Functional execution is supplied by the
// caller; this class decides only when its result becomes firmware-visible.
class Wrapper {
 public:
  explicit Wrapper(const LatencyEngine* latency) : latency_(latency) {}
  MmioResponse schedule(const MmioRequest& request,
                        std::uint64_t functional_value,
                        bool functional_ok = true) const;

 private:
  const LatencyEngine* latency_;
};

}  // namespace shino

#endif  // SHINO_MMIO_H
