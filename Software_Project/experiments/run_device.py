#!/usr/bin/env python3
"""Run one Zephyr/QEMU/SystemC device experiment and retain raw evidence."""
import argparse, fcntl, json, os, pathlib, re, socket, subprocess, sys, time
ROOT = pathlib.Path(__file__).resolve().parents[1]
SHM = ["/dev/shm/shino_qemu_transport", "/dev/shm/shino_cdma_registers",
       "/dev/shm/shino_cdma_memory", "/dev/shm/shino_conv_registers",
       "/dev/shm/shino_conv_memory", "/dev/shm/shino_aux_memory"]

def wait(path, timeout=8):
    end=time.time()+timeout
    while time.time()<end:
        if pathlib.Path(path).exists(): return
        time.sleep(.02)
    raise RuntimeError("timeout: "+path)
def stop(p):
    if p and p.poll() is None:
        p.terminate()
        try: p.wait(2)
        except subprocess.TimeoutExpired: p.kill(); p.wait()
def main():
    ap=argparse.ArgumentParser(); ap.add_argument("--device",choices=["cdma","conv"],required=True)
    ap.add_argument("--qemu",type=pathlib.Path,default=pathlib.Path(os.getenv("SHINO_QEMU",ROOT/".deps/qemu/build/qemu-system-aarch64"))); ap.add_argument("--firmware",type=pathlib.Path)
    ap.add_argument("--read-ns",type=int,required=True); ap.add_argument("--write-ns",type=int,required=True); ap.add_argument("--service-ns",type=int,required=True)
    ap.add_argument("--icount-num",type=int,default=5); ap.add_argument("--icount-den",type=int,default=6); ap.add_argument("--trace",choices=["on","off"],default="on"); ap.add_argument("--timeout-s",type=float,default=300); ap.add_argument("--output",type=pathlib.Path,required=True); a=ap.parse_args()
    fw=a.firmware or ROOT/"build"/("firmware-conv" if a.device=="conv" else "firmware-cdma")/"zephyr/zephyr.elf"
    model=ROOT/"build/systemc/shino-model"; bridge=ROOT/"build/systemc/shino-bridge"
    lock = pathlib.Path('/tmp/shino-device-experiments.lock').open('a')
    fcntl.flock(lock, fcntl.LOCK_EX)
    for p in SHM: pathlib.Path(p).unlink(missing_ok=True)
    pathlib.Path("/dev/shm/shino_aux_memory").touch()
    os.truncate("/dev/shm/shino_aux_memory", 1 << 24)
    qmp=f"/tmp/shino-review-{os.getpid()}.sock"; pathlib.Path(qmp).unlink(missing_ok=True)
    logs=ROOT/"build/logs"; logs.mkdir(parents=True,exist_ok=True); ps=[]; begin=time.monotonic()
    try:
        ml=(logs/f"{a.device}-model.log").open("w+"); ps.append(subprocess.Popen([model],stdout=ml,stderr=subprocess.STDOUT,text=True)); wait(SHM[1]); wait(SHM[3])
        dev="shino-mmio,mmio-base=0x80010000,mmio-size=0x1000,bram-base=0xb0000000,bram-size=0x1000000,cdma-base=0x80000000,cdma-size=0x10000,cdma-bram-base=0x82000000,cdma-bram-size=0x100000,conv-bram-base=0xa0000000,conv-bram-size=0x100000,shm-name=/shino_qemu_transport,bram-path=/dev/shm/shino_aux_memory,cdma-bram-path=/dev/shm/shino_cdma_memory,conv-bram-path=/dev/shm/shino_conv_memory,timeout-ms=30000,advance-virtual-time=on"
        cmd=[str(a.qemu),"-machine","virt,secure=on,gic-version=3","-cpu","cortex-a53","-smp","1","-m","128M","-nographic","-nodefaults","-serial","stdio","-monitor","none","-kernel",str(fw),"-device",dev,"-accel","tcg,thread=single","-icount",f"shift=0,sleep=off,ns-num={a.icount_num},ns-den={a.icount_den}","-S","-qmp",f"unix:{qmp},server=on,wait=off"]
        ql=(logs/f"{a.device}-qemu.log").open("w+"); q=subprocess.Popen(cmd,stdout=ql,stderr=subprocess.STDOUT,text=True); ps.append(q); wait(SHM[0]); wait(qmp)
        env=os.environ.copy(); env.update(SHINO_CDMA_READ_NS=str(a.read_ns),SHINO_CDMA_WRITE_NS=str(a.write_ns),SHINO_CDMA_SERVICE_NS=str(a.service_ns),SHINO_CONV_READ_NS=str(a.read_ns),SHINO_CONV_WRITE_NS=str(a.write_ns),SHINO_CONV_SERVICE_NS=str(a.service_ns),SHINO_TRACE="1" if a.trace=="on" else "0")
        bl=(logs/f"{a.device}-bridge.log").open("w+"); ps.append(subprocess.Popen([bridge],env=env,stdout=bl,stderr=subprocess.STDOUT,text=True)); time.sleep(.1)
        s=socket.socket(socket.AF_UNIX); s.connect(qmp); s.recv(4096); s.sendall(b'{"execute":"qmp_capabilities"}\n'); s.recv(4096); s.sendall(b'{"execute":"cont"}\n'); s.recv(4096); s.close()
        text=""; marker="SHINO_CONV" if a.device=="conv" else "SHINO_CDMA"; end=time.time()+a.timeout_s
        while time.time()<end:
            text = (logs/f"{a.device}-qemu.log").read_text()
            if re.search(marker+r"[^\r\n]* ok=\d+",text): break
            if q.poll() is not None: break
            time.sleep(.1)
        line=re.search(marker+r"[^\r\n]*",text)
        trace = (logs/f"{a.device}-bridge.log").read_text()
        if not line:
            print("QEMU LOG:\n"+text[-4000:],file=sys.stderr)
            print("BRIDGE LOG:\n"+trace[-4000:],file=sys.stderr)
        commits=re.findall(r"TRACE \w+_commit seq=(\d+) deadline_ns=(\d+) trigger_ns=(\d+) lateness_ns=(\d+)",trace)
        fields={k:int(v) for k,v in re.findall(r"(\w+)=(\d+)",line.group(0) if line else "")}
        result={"schema":"shino.device/v1","device":a.device,"injected":{"read_ns":a.read_ns,"write_ns":a.write_ns,"service_ns":a.service_ns,"icount_num":a.icount_num,"icount_den":a.icount_den},"observed":fields,"completion_events":len(commits),"early_triggers":sum(int(t)<int(d) for _,d,t,_ in commits),"max_lateness_ns":max([int(x[3]) for x in commits],default=None),"host_elapsed_s":time.monotonic()-begin,"pass":bool(line and fields.get("ok")==1 and (commits or a.trace=="off"))}
        result['trace_enabled'] = a.trace == 'on'
        if a.trace == 'on':
            expected = fields.get('runs', 0) + fields.get('window_runs', 0)
            result['expected_completion_events'] = expected
            result['pass'] = result['pass'] and len(commits) == expected and result['early_triggers'] == 0
        else:
            result['completion_events'] = None
            result['early_triggers'] = None
            result['deadline_checks'] = 'not measured (trace disabled)'
        a.output.parent.mkdir(parents=True,exist_ok=True); a.output.write_text(json.dumps(result,indent=2)+"\n"); print(line.group(0) if line else text[-2000:]); return 0 if result["pass"] else 1
    finally:
        for p in reversed(ps): stop(p)
        pathlib.Path(qmp).unlink(missing_ok=True)
if __name__=="__main__": sys.exit(main())
