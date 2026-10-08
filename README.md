# Shino — DATE Paper Experimental Source

This repository accompanies the Shino paper submitted to DATE. It contains the FPGA and QEMU–SystemC experiments used to study firmware-visible timing: the time to complete a register access is distinct from the time when a device result becomes valid.

The two project directories form one experimental workflow. **The FPGA experiments measure real hardware access and completion latency for the CDMA and convolution workloads. The software experiments configure Shino with those measurements, reproduce the corresponding timing conditions in a virtual platform, and examine their effect on firmware correctness and simulation cost.** Synthetic latency sweeps then explore timing combinations beyond the measured hardware settings.

## Experimental workflow

1. Build and run the FPGA workloads to obtain hardware response and data-validity timing.
2. Configure the corresponding latency components in the QEMU–SystemC platform.
3. Run the dependency-graph, virtual-time, firmware-bug and polling experiments.
4. Inspect raw results and regenerate the evaluation figures.

Hardware measurements are inputs to the software experiments; matching a configured model deadline is not, by itself, proof of cycle-level hardware fidelity.

## Project directories

| Project | Role in the paper evaluation | Instructions |
|---|---|---|
| `Hardwre_Project/` | FPGA CDMA and convolution designs, together with firmware for reproducing the real-hardware latency measurements used by the software evaluation. | [Hardware experiments](Hardwre_Project/README.md) |
| `Software_Project/` | QEMU–SystemC timing platform, Zephyr workloads, four evaluation suites, raw results and figure-generation code. | [Software experiments](Software_Project/README.md) |

## Start with the software tests

```sh
cd Software_Project
make systemc
make test
```

The graph tests require SystemC and a C++ toolchain. Firmware experiments additionally require patched QEMU 8.2.2, Zephyr 3.7.2 and an AArch64 toolchain. Follow the software README for dependency setup and the complete reproduction commands; follow the hardware README for the FPGA measurement workflow.

## Results and reproduction scope

The included software reference data contain 30 exact corrected-graph matches, 17,600 traced completion events with zero early triggers and maximum lateness 293 ns, and correct wait-for-completion behavior in all 51 measured/derived timing configurations. Six synthetic combinations expose the fixed-post-work assumption. Host runtime is machine-dependent.

See [reproducibility notes](Software_Project/docs/REPRODUCIBILITY.md) for the distinction between measured and synthetic settings, trace-enabled and trace-disabled checks, and differences from earlier paper summaries. The software rerun did not repeat the FPGA measurements. FPGA project metadata and repository history have not undergone a full anonymity review.
