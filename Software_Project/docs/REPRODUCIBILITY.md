# Reproducibility and evidence scope

This package uses the fresh sequential rerun rather than older paper summaries whose event accounting and two bug classifications did not reproduce.

| Experiment | Fresh reference result |
|---|---|
| DAG | 30 seeded DAGs and 8 propagation points; exact corrected graph matches and zero sink timing error |
| Virtual time | 16 configurations; 17,600 events; zero early triggers; maximum lateness 293 ns |
| Bug sweep | 3 measured and 48 scaled configurations; 6/48 scaled cases expose the fixed-post-work assumption; all 51 corrected paths pass |
| Polling | 9 densities, 5 repetitions each; reads 156,000 to 15,000; host median 11.9921 to 1.9690 seconds (83.58% reduction); all output checks pass |

Host seconds and standard deviations depend on machine load. Read counts and deterministic model times are the meaningful exact comparisons. The six bug-exposing points all have validity multiplier 8; the measured configurations pass. Scaled configurations are synthetic, not independent hardware measurements.

## Trace limitations

Bug and throughput sweeps disable completion tracing to reduce instrumentation cost. Their trace-derived event and early-trigger fields are **not measured**. Included raw results are annotated accordingly; firmware output checks remain valid. Dedicated trace-enabled polling endpoint runs each recorded 1,000 completions with zero early triggers (maximum lateness 148 ns for work 0, and 0 ns for work 512). Two discrepant bug configurations were each checked three further times with trace enabled; all six runs recorded 1,100 events, zero early triggers, and correct wait-for-completion output.

The launcher now rejects traced runs with incomplete completion accounting and explicitly marks untraced deadline checks unavailable. A process lock serializes launchers because the models use fixed POSIX shared-memory names. Do not launch the model/bridge manually while a suite runs; older external launchers do not honor the new lock.

## Historical discrepancies

Earlier summaries reported 13,841 events and four bug-exposing configurations. The new rerun yields 17,600 events and six cases. The precise historical cause is unproven; interference between runners sharing memory/log names is a risk, not a confirmed diagnosis. Do not cite the old counts as verified by this package.

## Validation boundary

Source builds, SystemC tests and all four suites were checked on the existing Linux development host. This is not a clean-machine installation validation, a new FPGA measurement, a CPU cycle-accuracy claim, or an interrupt/multi-outstanding evaluation. Portable-path and checker improvements were additionally smoke-tested in this exported repository.
