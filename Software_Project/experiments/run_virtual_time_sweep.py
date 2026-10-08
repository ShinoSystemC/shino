#!/usr/bin/env python3
"""Run QEMU/SystemC device completions across CPU and device timing pairs."""
import argparse,json,pathlib,subprocess,sys
ROOT=pathlib.Path(__file__).resolve().parents[1]
RATIOS=((1,2),(2,3),(3,4),(4,5),(5,6),(1,1),(5,4),(3,2)); LAT=(1000,2000,4000,8000,16000,32000,46000,64000,96000)
PAIRS=tuple((n,d,8000) for n,d in RATIOS)+tuple((5,6,x) for x in LAT if x!=8000)
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--qemu',type=pathlib.Path);a=ap.parse_args();raw=ROOT/'results/raw/virtual-time';raw.mkdir(parents=True,exist_ok=True);rows=[]
 for num,den,latency in PAIRS:
  out=raw/f'r{num}-{den}-d{latency}.json';cmd=[sys.executable,str(ROOT/'experiments/run_device.py'),'--device','cdma','--read-ns','302','--write-ns','62','--service-ns',str(latency),'--icount-num',str(num),'--icount-den',str(den),'--output',str(out)]
  if a.qemu:cmd+=['--qemu',str(a.qemu)]
  subprocess.run(cmd,cwd=ROOT,check=True,stdout=subprocess.DEVNULL);r=json.loads(out.read_text());rows.append({'num':num,'den':den,'ns_per_instruction':num/den,'publication_latency_ns':latency,'guest_ticks':r['observed']['guest_ticks'],'timer_hz':r['observed']['timer_hz'],'completion_events':r['completion_events'],'early_triggers':r['early_triggers'],'max_lateness_ns':r['max_lateness_ns'],'payload_before_status':r['observed']['fixed_transfer_failures']==0,'pass':r['pass']})
 result={'schema':'shino.virtual-time-sweep/v2','rows':rows};(ROOT/'results/virtual-time-sweep.json').write_text(json.dumps(result,indent=2)+'\n');print(f'ran {len(rows)} QEMU/SystemC timing combinations')
if __name__=='__main__':main()
