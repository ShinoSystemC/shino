#include "shino/mmio.h"

#include <algorithm>

namespace shino {

bool MmioGateway::add(TargetDescriptor target) {
  target.depth = std::max(1u, target.depth);
  return targets_.emplace(target.address, std::move(target)).second;
}

const TargetDescriptor* MmioGateway::find(std::uintptr_t address) const {
  auto it = targets_.find(address & ~static_cast<std::uintptr_t>(3));
  return it == targets_.end() ? nullptr : &it->second;
}

std::vector<TargetDescriptor> MmioGateway::targets() const {
  std::vector<TargetDescriptor> result;
  result.reserve(targets_.size());
  for (const auto& entry : targets_) result.push_back(entry.second);
  std::sort(result.begin(), result.end(),
            [](const TargetDescriptor& lhs, const TargetDescriptor& rhs) {
              return lhs.address < rhs.address;
            });
  return result;
}

MmioResponse Wrapper::schedule(const MmioRequest& request,
                               std::uint64_t functional_value,
                               bool functional_ok) const {
  TimeNs latency = 0;
  if (latency_ != nullptr) {
    latency = request.kind == AccessKind::kRead
                  ? latency_->read_latency(request.address)
                  : latency_->write_latency(request.address);
  }
  return {request.sequence, functional_value,
          request.accepted_at_ns + latency, functional_ok};
}

}  // namespace shino
