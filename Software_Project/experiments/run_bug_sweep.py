#!/usr/bin/env python3
"""Run one firmware binary across measured and hardware-derived latency pairs."""
import argparse,json,pathlib,subprocess,sys
ROOT=pathlib.Path(__file__).resolve().parents[1]
MEASURED=(("CDMA IC-100",302,62,7967),("CDMA IC-200",212,30,4075),("CDMA SC-100",552,125,7952));AM=(.5,.75,1,1.25,1.5,2);DM=(.5,.75,1,1.25,1.5,2,4,8)
def run(qemu,name,r,w,s,out):
 cmd=[sys.executable,str(ROOT/'experiments/run_device.py'),'--device','cdma','--read-ns',str(round(r)),'--write-ns',str(round(w)),'--service-ns',str(round(s)),'--trace','off','--output',str(out)]
 if qemu:cmd+=['--qemu',str(qemu)]
 subprocess.run(cmd,cwd=ROOT,check=True,stdout=subprocess.DEVNULL);x=json.loads(out.read_text());return {'name':name,'access_ns':r+3*w,'validity_ns':s,'window_successes':x['observed']['window_successes'],'bug_exposure_rate':1-x['observed']['window_successes']/100,'corrected_ok':x['observed']['fixed_transfer_failures']==0,'pass':x['pass']}
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--qemu',type=pathlib.Path);a=ap.parse_args();raw=ROOT/'results/raw/bug-sweep';raw.mkdir(parents=True,exist_ok=True);points=[]
 for name,r,w,s in MEASURED:
  p=run(a.qemu,name,r,w,s,raw/(name.lower().replace(' ','-')+'.json'));p['kind']='measured';points.append(p)
 br,bw,bs=302,62,7967
 for am in AM:
  for dm in DM:
   p=run(a.qemu,f'a{am}-d{dm}',br*am,bw*am,bs*dm,raw/f'a{am}-d{dm}.json');p.update(kind='derived',access_multiplier=am,validity_multiplier=dm);points.append(p)
 out={'schema':'shino.bug-sweep/v2','measured_and_derived':points};(ROOT/'results/firmware-bug-sweep.json').write_text(json.dumps(out,indent=2)+'\n');print(f'ran {len(points)} firmware latency combinations')
if __name__=='__main__':main()
