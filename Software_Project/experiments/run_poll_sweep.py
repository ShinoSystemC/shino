#!/usr/bin/env python3
"""Build and run convolution polling workloads; paths come from the environment."""
import argparse,json,os,pathlib,shutil,statistics,subprocess,sys
ROOT=pathlib.Path(__file__).resolve().parents[1]
POINTS=(0,4,8,16,32,64,128,256,512)
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--repetitions',type=int,default=5);ap.add_argument('--qemu',type=pathlib.Path,required=True);a=ap.parse_args()
 if a.repetitions<2:ap.error('at least two repetitions are required for standard deviation')
 raw=ROOT/'results/raw/poll-sweep';raw.mkdir(parents=True,exist_ok=True);rows=[]
 zephyr=pathlib.Path(os.getenv('ZEPHYR_BASE',ROOT/'.deps/zephyr')).resolve()
 prefix=os.getenv('CROSS_COMPILE')
 if not prefix:
  gcc=shutil.which('aarch64-none-elf-gcc')
  if not gcc:ap.error('Install AArch64 bare-metal GCC or set CROSS_COMPILE to an absolute prefix')
  prefix=gcc[:-3]
 env=os.environ.copy();env.update(ZEPHYR_BASE=str(zephyr),ZEPHYR_TOOLCHAIN_VARIANT='cross-compile',CROSS_COMPILE=prefix)
 for work in POINTS:
  build=ROOT/'build'/f'firmware-conv-poll-{work}'
  subprocess.run(['cmake','-S',str(ROOT/'firmware/app'),'-B',str(build),'-GNinja','-DBOARD=qemu_cortex_a53',f'-DZephyr_DIR={zephyr}/share/zephyr-package/cmake',f'-DPython3_EXECUTABLE={sys.executable}','-DCONFIG_SHINO_CONV_WORKLOAD=y',f'-DCONFIG_SHINO_POLL_WORK={work}'],cwd=ROOT,env=env,check=True)
  subprocess.run(['cmake','--build',str(build),'-j4'],env=env,check=True)
  xs=[]
  for rep in range(1,a.repetitions+1):
   out=raw/f'poll-{work}-{rep}.json'
   subprocess.run([sys.executable,str(ROOT/'experiments/run_device.py'),'--device','conv','--firmware',str(build/'zephyr/zephyr.elf'),'--read-ns','287','--write-ns','50','--service-ns','45500','--trace','off','--qemu',str(a.qemu),'--output',str(out)],cwd=ROOT,check=True)
   xs.append(json.loads(out.read_text()))
  rows.append({'poll_work':work,'repetitions':len(xs),'reads':statistics.median(x['observed']['reads'] for x in xs),'host_median_s':statistics.median(x['host_elapsed_s'] for x in xs),'host_stdev_s':statistics.stdev(x['host_elapsed_s'] for x in xs),'corrected_failures':sum(x['observed']['fixed_output_failures'] for x in xs),'early_triggers':None,'deadline_checks':'not measured (trace disabled)','all_ok':all(x['observed']['ok'] for x in xs)})
 (ROOT/'results/poll-sweep.json').write_text(json.dumps({'schema':'shino.poll-sweep/v2','rows':rows},indent=2)+'\n')
if __name__=='__main__':main()
