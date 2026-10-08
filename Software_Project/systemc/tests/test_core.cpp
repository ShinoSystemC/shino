#include <cassert>
#include <fstream>
#include <sstream>
#include <string>

#include "shino/causal_graph.h"
#include "shino/config.h"
#include "shino/latency_engine.h"
#include "shino/mmio.h"
#include "shino/replay.h"
#include "shino/trace.h"
#include "shino/transport.h"

int main() {
  const std::string config_path = "/tmp/shino-core.conf";
  {
    std::ofstream config_output(config_path);
    config_output << "mode=timed\n"
                  << "default_read_latency_ns=3\n"
                  << "default_service_time_ns=13\n"
                  << "process.sim_top.echo.worker.service_time_ns=29\n"
                  << "register.echo.CQ.read_latency_ns=7\n"
                  << "register.echo.CQ.depth=2\n";
  }
  const auto config = shino::Config::load(config_path);
  assert(config.mode == shino::Mode::kTimed);
  assert(config.default_read_latency_ns == 3);
  assert(config.service_time_for("sim_top.echo.worker") == 29);
  assert(config.service_time_for("sim_top.echo.other") == 13);
  assert(config.register_overrides.at("echo.CQ").read_latency_ns == 7);
  assert(config.register_overrides.at("echo.CQ").depth == 2);

  shino::LatencyEngine engine;
  shino::RegisterTiming timing;
  timing.queue_backed = true;
  timing.depth = 1;
  timing.read_latency_ns = 7;
  timing.write_latency_ns = 11;
  engine.register_target(0x1000, timing);

  assert(engine.read_latency(0x1000) == 7);
  assert(engine.write_latency(0x1000) == 11);
  assert(engine.reserve_write(0x1000));
  assert(!engine.reserve_write(0x1000));
  engine.produce(0x1000, 50);
  assert(!engine.has_visible_token(0x1000, 49));
  assert(engine.has_visible_token(0x1000, 50));
  assert(engine.consume(0x1000, 50));
  assert(engine.reserve_write(0x1000));
  engine.cancel_write(0x1000);
  assert(engine.can_accept(0x1000));
  engine.produce(0x1000, 80);
  assert(engine.snapshot(0x1000).occupancy == 1);
  assert(engine.snapshot(0x1000).depth == 1);
  assert(engine.snapshot(0x1000).next_visible_ns == 80);
  engine.clear(0x1000);
  assert(engine.snapshot(0x1000).occupancy == 0);

  shino::MmioGateway gateway;
  assert(gateway.add({"echo", "CQ", 0x1000, true, 1}));
  assert(!gateway.add({"echo", "duplicate", 0x1000, true, 2}));
  assert(gateway.find(0x1002) != nullptr);
  assert(gateway.find(0x1002)->reg == "CQ");
  shino::Wrapper wrapper(&engine);
  shino::MmioRequest request{7, 0x1000, 4, shino::AccessKind::kRead, 0, 100};
  auto response = wrapper.schedule(request, 0x55);
  assert(response.sequence == 7);
  assert(response.value == 0x55);
  assert(response.visible_at_ns == 107);

  shino::SpscRing<shino::WireRequest, 4> ring;
  const auto wire_request = shino::to_wire(request);
  assert(ring.try_push(wire_request));
  assert(ring.size() == 1);
  shino::WireRequest popped;
  assert(ring.try_pop(popped));
  const auto decoded = shino::from_wire(popped);
  assert(decoded.sequence == request.sequence);
  assert(decoded.address == request.address);
  assert(decoded.kind == request.kind);
  assert(ring.empty());
  assert(!ring.try_pop(popped));

  shino::CausalGraph graph;
  graph.observe("sim_top.echo.worker", "echo", "SQ", 0x1000,
                shino::AccessKind::kRead, true);
  graph.observe("sim_top.echo.worker", "echo", "CQ", 0x1004,
                shino::AccessKind::kWrite, true);
  auto json = graph.to_json();
  assert(json.find("queue:echo.SQ") != std::string::npos);
  assert(json.find("process:sim_top.echo.worker") != std::string::npos);
  assert(graph.edges().size() == 2);
  assert(!graph.observe("sim_top.echo.worker", "echo", "SQ", 0x1000,
                        shino::AccessKind::kRead, true));
  assert(!graph.observe("sim_top.echo.worker", "echo", "STATUS", 0x1008,
                        shino::AccessKind::kRead, false));
  graph.observe("sim_top.echo.consumer", "echo", "CQ", 0x1004,
                shino::AccessKind::kRead, true);
  assert(graph.edges().size() == 3);
  assert(graph.add_edge("process:manual.stage", "queue:echo.EXTRA"));
  assert(graph.suppress_edge("process:sim_top.echo.worker", "queue:echo.CQ"));
  assert(graph.observed_edges().size() == 3);
  assert(graph.edges().size() == 3);
  auto effective_json = graph.to_json();
  assert(effective_json.find("manual.stage") != std::string::npos);
  assert(effective_json.find("provenance") != std::string::npos);
  assert(!graph.add_edge("bad", "queue:echo.BAD"));
  graph.freeze();
  graph.observe("other", "echo", "CQ", 0x1004,
                shino::AccessKind::kRead, true);
  assert(graph.edges().size() == 3);

  /* Two-stage visibility composes through the actual producer/consumer order:
   * stage 1 publishes at 129 ns, and stage 2 starts from that timestamp. */
  shino::LatencyEngine pipeline;
  shino::RegisterTiming stage_timing;
  stage_timing.queue_backed = true;
  stage_timing.depth = 2;
  stage_timing.read_latency_ns = 7;
  pipeline.register_target(0x2000, stage_timing);
  pipeline.register_target(0x2004, stage_timing);
  const shino::TimeNs launch_ns = 100;
  const shino::TimeNs stage1_visible =
      launch_ns + config.service_time_for("sim_top.echo.worker");
  pipeline.produce(0x2000, stage1_visible);
  assert(!pipeline.has_visible_token(0x2000, stage1_visible - 1));
  assert(pipeline.has_visible_token(0x2000, stage1_visible));
  assert(pipeline.consume(0x2000, stage1_visible));
  const shino::TimeNs stage2_visible =
      stage1_visible + config.service_time_for("sim_top.echo.other");
  pipeline.produce(0x2004, stage2_visible);
  assert(stage1_visible == 129);
  assert(stage2_visible == 142);
  assert(!pipeline.has_visible_token(0x2004, 141));
  assert(pipeline.has_visible_token(0x2004, 142));

  const std::string path = "/tmp/shino-core-trace.jsonl";
  {
    shino::TraceWriter writer;
    assert(writer.open(path));
    writer.record({0, 12, "register_read", "p\"1", "echo", "CQ",
                   0x1004, 42});
  }
  std::ifstream input(path);
  std::stringstream contents;
  contents << input.rdbuf();
  assert(contents.str().find("\\\"") != std::string::npos);
  assert(contents.str().find("\"sequence\":1") != std::string::npos);
  std::istringstream replay_input(contents.str());
  const auto summary = shino::replay_trace(replay_input);
  assert(summary.events == 1);
  assert(summary.reads == 1);
  assert(summary.writes == 0);
  return 0;
}
