#!/usr/bin/env python3
import json,pathlib,subprocess
ROOT=pathlib.Path(__file__).resolve().parents[1]; exe=ROOT/'build/systemc/systemc-graph-eval'; ann=ROOT/'experiments/graph-overrides.conf'; raw=ROOT/'results/raw/graph-sweep';raw.mkdir(parents=True,exist_ok=True)
rows=[]
for n in (8,16,24,32,48,64):
 for seed in (11,23,37,53,71):
  out=raw/f'n{n}-s{seed}';subprocess.run([exe,out,ann,str(n),str(seed),str(n//3),'0'],check=True,cwd=ROOT);rows.append(json.loads((pathlib.Path(str(out)+'.json')).read_text()))
prop=[]
for delta in (0,250,500,1000,2000,4000,8000,16000):
 out=raw/f'prop-{delta}';subprocess.run([exe,out,ann,'24','37','8',str(delta)],check=True,cwd=ROOT);prop.append(json.loads(pathlib.Path(str(out)+'.json').read_text()))
out={'schema':'shino.graph-sweep/v2','rows':rows,'propagation':prop};(ROOT/'results/graph-sweep.json').write_text(json.dumps(out,indent=2)+'\n');print(f'ran {len(rows)} graphs and {len(prop)} propagation points')
