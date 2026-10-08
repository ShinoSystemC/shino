#include "shino/causal_graph.h"
#include <fstream>
#include <sstream>
namespace shino { namespace {
std::string esc(const std::string&s){std::string o;for(char c:s){if(c=='\\'||c=='"')o+='\\';o+=c;}return o;}
bool starts(const std::string&s,const char*p){return s.rfind(p,0)==0;}
}
bool CausalGraph::valid_edge(const GraphEdge&e){return (starts(e.source,"queue:")&&starts(e.destination,"process:"))||(starts(e.source,"process:")&&starts(e.destination,"queue:"));}
bool CausalGraph::observe(const std::string&p,const std::string&m,const std::string&r,std::uintptr_t,AccessKind k,bool q){if(!q||p.empty())return false;GraphEdge e{k==AccessKind::kRead?"queue:"+m+"."+r:"process:"+p,k==AccessKind::kRead?"process:"+p:"queue:"+m+"."+r};std::lock_guard<std::mutex>l(mutex_);return !frozen_&&observed_.insert(e).second;}
bool CausalGraph::add_edge(const std::string&s,const std::string&d){GraphEdge e{s,d};if(!valid_edge(e))return false;std::lock_guard<std::mutex>l(mutex_);return !frozen_&&manual_.insert(e).second;}
bool CausalGraph::suppress_edge(const std::string&s,const std::string&d){GraphEdge e{s,d};if(!valid_edge(e))return false;std::lock_guard<std::mutex>l(mutex_);return !frozen_&&suppressed_.insert(e).second;}
bool CausalGraph::load_annotations(const std::string&path,std::string*err){std::ifstream f(path);if(!f){if(err)*err="cannot open annotation file";return false;}std::string line;unsigned n=0;while(std::getline(f,line)){++n;if(line.empty()||line[0]=='#')continue;auto eq=line.find('=');auto arrow=line.find("->");if(eq==std::string::npos||arrow==std::string::npos||arrow<eq){if(err)*err="invalid annotation line "+std::to_string(n);return false;}auto op=line.substr(0,eq),s=line.substr(eq+1,arrow-eq-1),d=line.substr(arrow+2);bool ok=op=="dependency.add"?add_edge(s,d):op=="dependency.remove"?suppress_edge(s,d):false;if(!ok){if(err)*err="invalid or duplicate annotation line "+std::to_string(n);return false;}}return true;}
void CausalGraph::freeze(bool v){std::lock_guard<std::mutex>l(mutex_);frozen_=v;}bool CausalGraph::frozen()const{std::lock_guard<std::mutex>l(mutex_);return frozen_;}
std::vector<GraphEdge>CausalGraph::observed_edges()const{std::lock_guard<std::mutex>l(mutex_);return {observed_.begin(),observed_.end()};}
std::vector<EffectiveEdge>CausalGraph::effective_edges()const{std::lock_guard<std::mutex>l(mutex_);std::set<GraphEdge>all=observed_;all.insert(manual_.begin(),manual_.end());std::vector<EffectiveEdge>v;for(auto&e:all)if(!suppressed_.count(e))v.push_back({e,observed_.count(e)?(manual_.count(e)?"observed+manual":"observed"):"manual"});return v;}
std::vector<GraphEdge>CausalGraph::edges()const{auto x=effective_edges();std::vector<GraphEdge>v;for(auto&e:x)v.push_back(e.edge);return v;}
std::string CausalGraph::to_json()const{auto x=effective_edges();std::ostringstream o;o<<"{\n  \"version\": 2,\n  \"edges\": [";for(size_t i=0;i<x.size();++i)o<<(i?",\n":"\n")<<"    {\"source\": \""<<esc(x[i].edge.source)<<"\", \"destination\": \""<<esc(x[i].edge.destination)<<"\", \"provenance\": \""<<x[i].provenance<<"\"}";if(!x.empty())o<<'\n';o<<"  ]\n}\n";return o.str();}
}
