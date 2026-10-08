#define SC_INCLUDE_DYNAMIC_PROCESSES
#include <systemc>
#include <algorithm>
#include <cstdint>
#include <fstream>
#include <iomanip>
#include <memory>
#include <random>
#include <set>
#include <vector>
#include "shino/causal_graph.h"
#include "shino/systemc_timed_fifo.h"
using shino::GraphEdge;
struct Arc{int u,v;std::unique_ptr<shino::TimedFifo>q;};
static std::string proc(int i){return "process:node_"+std::to_string(i);}static std::string queue(int u,int v){return "queue:dag.q_"+std::to_string(u)+"_"+std::to_string(v);}static size_t inter(const std::vector<GraphEdge>&a,const std::set<GraphEdge>&b){size_t n=0;for(auto&e:a)n+=b.count(e);return n;}
int sc_main(int argc,char**argv){
 std::string prefix=argc>1?argv[1]:"graph-eval",annotation=argc>2?argv[2]:"experiments/graph-overrides.conf";int N=argc>3?std::stoi(argv[3]):24;std::uint64_t seed=argc>4?std::stoull(argv[4]):0x5EED5EEDULL;int target=argc>5?std::stoi(argv[5]):N/3;std::uint64_t delta=argc>6?std::stoull(argv[6]):0;
 std::mt19937_64 rng(seed);std::vector<std::pair<int,int>>es;for(int i=0;i<N-1;++i)es.push_back({i,i+1});for(int i=0;i<N;++i)for(int j=i+2;j<N;++j)if(rng()%1000<115)es.push_back({i,j});
 shino::CausalGraph graph;std::vector<Arc>arcs;std::set<GraphEdge>truth;for(auto[u,v]:es){auto name="q_"+std::to_string(u)+"_"+std::to_string(v);arcs.push_back({u,v,std::make_unique<shino::TimedFifo>("dag",name,0x1000+arcs.size()*4,graph)});truth.insert({proc(u),queue(u,v)});truth.insert({queue(u,v),proc(v)});}
 std::vector<std::vector<int>>in(N),out(N);for(size_t i=0;i<arcs.size();++i){out[arcs[i].u].push_back(i);in[arcs[i].v].push_back(i);}std::vector<std::uint64_t>service(N);for(auto&s:service)s=1+rng()%100;service[target]+=delta;std::uint64_t sink=0;bool values=true;const int hidden=0;
 for(int n=0;n<N;++n){
  sc_core::sc_spawn([&,n]{std::uint32_t value=1;if(!in[n].empty()){value=0;for(int a:in[n])value+=arcs[a].q->read();}sc_core::wait(service[n],sc_core::SC_NS);if(out[n].empty())sink=(std::uint64_t)(sc_core::sc_time_stamp().to_seconds()*1e9+0.5);for(int a:out[n])arcs[a].q->write(value,a!=hidden);},("node_"+std::to_string(n)).c_str());
 }
 graph.observe("diagnostic","dag","poll",0xdead,shino::AccessKind::kRead,true);sc_core::sc_start();
 std::vector<std::uint64_t>finish(N);for(int n=0;n<N;++n){std::uint64_t start=0;for(int a:in[n])start=std::max(start,finish[arcs[a].u]);finish[n]=start+service[n];}auto expected=finish[N-1];values&=sink==expected;auto raw=graph.observed_edges();auto rawtp=inter(raw,truth);std::string err;if(!graph.load_annotations(annotation,&err)){std::cerr<<err<<'\n';return 3;}auto eff=graph.edges();auto tp=inter(eff,truth),fp=eff.size()-tp,fn=truth.size()-tp;auto ratio=[](size_t a,size_t b){return b?double(a)/b:1.;};
 std::ofstream js(prefix+".json");js<<std::fixed<<std::setprecision(6)<<"{\n \"schema\":\"shino.graph-eval/v2\",\n \"seed\":"<<seed<<",\n \"processes\":"<<N<<",\n \"process_edges\":"<<es.size()<<",\n \"ground_truth_incidence_edges\":"<<truth.size()<<",\n \"raw_precision\":"<<ratio(rawtp,raw.size())<<",\n \"raw_recall\":"<<ratio(rawtp,truth.size())<<",\n \"effective_precision\":"<<ratio(tp,eff.size())<<",\n \"effective_recall\":"<<ratio(tp,truth.size())<<",\n \"exact_graph_match\":"<<(fp==0&&fn==0?"true":"false")<<",\n \"target_node\":"<<target<<",\n \"added_service_ns\":"<<delta<<",\n \"target_finish_ns\":"<<finish[target]<<",\n \"downstream_finish_ns\":"<<finish[std::min(N-1,target+N/3)]<<",\n \"expected_sink_ns\":"<<expected<<",\n \"observed_sink_ns\":"<<sink<<",\n \"timing_error_ns\":"<<(sink>expected?sink-expected:expected-sink)<<",\n \"outputs_correct\":"<<(values?"true":"false")<<"\n}\n";return fp||fn||!values?2:0;
}
