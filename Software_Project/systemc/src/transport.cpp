#include "shino/transport.h"

namespace shino {

WireRequest to_wire(const MmioRequest& request) {
  WireRequest wire;
  wire.sequence = request.sequence;
  wire.address = request.address;
  wire.value = request.value;
  wire.accepted_at_ns = request.accepted_at_ns;
  wire.width = request.width;
  wire.operation = request.kind == AccessKind::kRead ? WireOperation::kRead
                                                      : WireOperation::kWrite;
  return wire;
}

MmioRequest from_wire(const WireRequest& request) {
  return {request.sequence, static_cast<std::uintptr_t>(request.address),
          request.width,
          request.operation == WireOperation::kRead ? AccessKind::kRead
                                                     : AccessKind::kWrite,
          request.value, request.accepted_at_ns};
}

WireResponse to_wire(const MmioResponse& response) {
  WireResponse wire;
  wire.sequence = response.sequence;
  wire.value = response.value;
  wire.visible_at_ns = response.visible_at_ns;
  wire.ok = response.ok ? 1 : 0;
  return wire;
}

MmioResponse from_wire(const WireResponse& response) {
  return {response.sequence, response.value, response.visible_at_ns,
          response.ok != 0};
}

}  // namespace shino
