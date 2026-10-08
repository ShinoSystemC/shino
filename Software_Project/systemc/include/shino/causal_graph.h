#ifndef SHINO_CAUSAL_GRAPH_H
#define SHINO_CAUSAL_GRAPH_H
#include <cstdint>
#include <mutex>
#include <set>
#include <string>
#include <vector>
namespace shino {
enum class AccessKind { kRead, kWrite };
struct GraphEdge { std::string source,destination; bool operator<(const GraphEdge&o)const{return source<o.source||(source==o.source&&destination<o.destination);} bool operator==(const GraphEdge&o)const{return source==o.source&&destination==o.destination;} };
struct EffectiveEdge { GraphEdge edge; std::string provenance; };
class CausalGraph {
 public:
  bool observe(const std::string&,const std::string&,const std::string&,std::uintptr_t,AccessKind,bool);
  bool add_edge(const std::string&,const std::string&);
  bool suppress_edge(const std::string&,const std::string&);
  bool load_annotations(const std::string&,std::string* error=nullptr);
  void freeze(bool value=true); bool frozen()const;
  std::vector<GraphEdge> observed_edges()const; std::vector<GraphEdge> edges()const;
  std::vector<EffectiveEdge> effective_edges()const; std::string to_json()const;
 private:
  static bool valid_edge(const GraphEdge&);
  mutable std::mutex mutex_; std::set<GraphEdge> observed_,manual_,suppressed_; bool frozen_=false;
};
}
#endif
