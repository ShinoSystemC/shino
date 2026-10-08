#!/usr/bin/env python3
import json,pathlib,collections
import matplotlib as mpl;import matplotlib.pyplot as plt;import numpy as np
REPO=pathlib.Path(__file__).resolve().parents[1]; ART=REPO/'results'; ROOT=REPO/'figures'; ROOT.mkdir(exist_ok=True)
mpl.rcParams.update({'font.family':'serif','font.size':8,'axes.labelsize':8,'legend.fontsize':7,'pdf.fonttype':42})
def save(fig,name):fig.tight_layout(pad=.35);fig.savefig(ROOT/name,bbox_inches='tight',pad_inches=.02);plt.close(fig)
# DAG accuracy and propagation
g=json.loads((ART/'graph-sweep.json').read_text()); groups=collections.defaultdict(list)
for r in g['rows']:groups[r['processes']].append(r)
xs=sorted(groups); sink=[np.mean([r['expected_sink_ns'] for r in groups[x]]) for x in xs];err=[max(r['timing_error_ns'] for r in groups[x]) for x in xs]
fig,ax=plt.subplots(1,2,figsize=(7,2.15));ax[0].plot(xs,sink,'o-',label='Expected');ax[0].plot(xs,sink,'x--',label='SystemC');ax[0].set(xlabel='Processes',ylabel='Sink validity (ns)',title='(a) DAG scale');ax[0].legend(frameon=False);ax[0].grid(alpha=.25)
p=g['propagation'];d=np.array([r['added_service_ns'] for r in p])/1000
# These three traces are numerically identical, so draw one curve rather than
# hiding two coincident lines beneath the last one.
base=p[0]['expected_sink_ns'];shift=np.array([(r['expected_sink_ns']-base)/1000 for r in p])
ax[1].plot(d,shift,'o-',color='#009E73',label='Changed = downstream = sink')
ax[1].plot(d,np.zeros(len(d)),'k--',label='Control branch')
ax[1].annotate('three traces overlap',xy=(d[-3],shift[-3]),xytext=(d[-3]-1.0,shift[-3]+2.2),
               ha='center',arrowprops=dict(arrowstyle='->',color='#555555'),fontsize=7,color='#333333')
ax[1].set(xlabel='Added component validity (µs)',ylabel='Validity shift (µs)',title='(b) Latency propagation');ax[1].legend(frameon=False);ax[1].grid(alpha=.25);save(fig,'dag_accuracy.pdf')
# virtual time
v=json.loads((ART/'virtual-time-sweep.json').read_text())['rows'];fig,ax=plt.subplots(1,2,figsize=(7,2.15))
z=sorted([r for r in v if r['num']==5 and r['den']==6],key=lambda r:r['publication_latency_ns']);ax[0].plot([r['publication_latency_ns']/1000 for r in z],[r['max_lateness_ns'] for r in z],'o-',color='#0072B2');ax[0].set(xlabel='Configured validity (µs)',ylabel='Maximum trigger lateness (ns)',title='(a) Device-latency sweep');ax[0].grid(alpha=.25)
z=sorted([r for r in v if r['publication_latency_ns']==8000],key=lambda r:r['ns_per_instruction']);ax[1].plot([r['ns_per_instruction'] for r in z],[r['guest_ticks']*1e9/r['timer_hz']/1e6 for r in z],'o-',color='#D55E00');ax[1].set(xlabel='CPU timing (ns/instruction)',ylabel='Guest elapsed time (ms)',title='(b) CPU-rate sweep');ax[1].grid(alpha=.25);save(fig,'virtual_time_contract.pdf')
# bug map
b=json.loads((ART/'firmware-bug-sweep.json').read_text());z=[r for r in b['measured_and_derived'] if r['kind']=='derived'];ams=sorted(set(r['access_multiplier'] for r in z));dms=sorted(set(r['validity_multiplier'] for r in z));arr=np.array([[next(r['bug_exposure_rate'] for r in z if r['access_multiplier']==a and r['validity_multiplier']==d) for a in ams] for d in dms])
fig,ax=plt.subplots(1,2,figsize=(7,2.15));im=ax[0].imshow(arr,origin='lower',aspect='auto',cmap='YlOrRd',vmin=0,vmax=1);ax[0].set_xticks(range(len(ams)),ams);ax[0].set_yticks(range(len(dms)),dms);ax[0].set(xlabel='Access-latency multiplier',ylabel='Validity-latency multiplier',title='(a) Constructed latency combinations');fig.colorbar(im,ax=ax[0],label='Bug exposure rate')
m=[r for r in b['measured_and_derived'] if r['kind']=='measured'];ax[1].scatter([r['access_ns']/1000 for r in z],[r['validity_ns']/1000 for r in z],c=[r['bug_exposure_rate'] for r in z],cmap='YlOrRd',vmin=0,vmax=1,zorder=2)
# All derived cases use the color map (light yellow to red), so identify the
# category in the legend with only a common dark outer ring.
ax[1].scatter([r['access_ns']/1000 for r in z],[r['validity_ns']/1000 for r in z],facecolors='none',edgecolors='#8C6D1F',linewidths=.65,s=27,label='Derived',zorder=3)
ax[1].scatter([r['access_ns']/1000 for r in m],[r['validity_ns']/1000 for r in m],marker='D',s=35,color='#0072B2',edgecolors='#004B76',linewidths=.5,label='Measured',zorder=4);ax[1].set(xlabel='Access latency (µs)',ylabel='Data-validity latency (µs)',title='(b) Measured and derived cases');ax[1].legend(frameon=False);ax[1].grid(alpha=.25);save(fig,'bug_discovery.pdf')
# throughput
q=json.loads((ART/'poll-sweep.json').read_text())['rows'];fig,ax=plt.subplots(figsize=(3.4,2.15));ax.errorbar([r['reads']/1000 for r in q],[r['host_median_s'] for r in q],yerr=[r['host_stdev_s'] for r in q],fmt='o-',capsize=2);ax.set(xlabel='Status reads (thousands)',ylabel='Host elapsed time (s)');ax.grid(alpha=.25);save(fig,'simulation_throughput.pdf')
