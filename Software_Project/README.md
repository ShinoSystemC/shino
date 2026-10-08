# Software Experiments for the Shino DATE Paper

This directory contains the QEMU–SystemC platform and software experiments accompanying the Shino paper submitted to DATE. Shino separates register-access response from later data validity so that unchanged firmware can exercise explicit device timing rather than host-dependent simulation delay.

The [FPGA experiments](../Hardwre_Project/README.md) measure CDMA and convolution access/completion latency on real hardware. Those measured components configure the virtual devices here. Dependency-graph and virtual-time experiments check the execution contract; measured and scaled latency configurations examine firmware timing assumptions; polling experiments quantify simulation cost. Scaled timing configurations are synthetic, not additional FPGA measurements.

## Contents and prerequisites

| Directory | Purpose |
|---|---|
| `systemc/` | Timing core, transport, dependency observation, functional models and tests |
| `qemu/patches/` | QEMU 8.2.2 MMIO and rational instruction-time patch |
| `firmware/` | Zephyr 3.7.2 Cortex-A53 workloads and MMU patch |
| `experiments/` | Four experiment runners |
| `results/` | Reference summaries and raw JSON |
| `tools/`, `figures/` | Python plotting code and evaluation figures |

Use Linux x86-64 with POSIX shared memory, Python 3.10+, CMake, Ninja, a C++17 compiler, SystemC 2.3.3, AArch64 bare-metal GCC 12.2 or compatible, and QEMU 8.2.2. Run every command below from `Software_Project/`.

On Ubuntu/Debian, install the usual build dependencies (package versions depend on the distribution):

```sh
sudo apt-get update
sudo apt-get install build-essential git curl xz-utils cmake ninja-build pkg-config \
  python3-dev python3-venv device-tree-compiler libsystemc-dev \
  libglib2.0-dev libpixman-1-dev zlib1g-dev libfdt-dev libssl-dev
pkg-config --modversion systemc
```

Install an **AArch64 bare-metal** toolchain, such as Arm GNU Toolchain 12.2.Rel1 for `aarch64-none-elf`, and put its `bin/` directory on PATH. A Linux-targeting `aarch64-linux-gnu` toolchain is not the reference compiler. Set an absolute prefix for Zephyr:

```sh
command -v aarch64-none-elf-gcc
export CROSS_COMPILE="$(command -v aarch64-none-elf-gcc)"
: "${CROSS_COMPILE:?Install the AArch64 bare-metal toolchain first}"
export CROSS_COMPILE="${CROSS_COMPILE%gcc}"
```

## Build the platform and workloads

```sh
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt west
sh firmware/fetch-zephyr.sh
pip install -r .deps/zephyr/scripts/requirements.txt
export ZEPHYR_BASE="$PWD/.deps/zephyr"
make all
make test
```

The Zephyr fetch script uses the fixed kernel revision in `firmware/west.yml` and applies the register/payload MMU mapping patch. It may be rerun without reapplying an already-present patch. The minimal application does not require the full Zephyr module collection. Dependencies downloaded online require access to GitHub and PyPI.

If firmware configuration previously failed with an incorrect toolchain prefix, configure a fresh build directory or clear only the failed `build/firmware-*` cache before rebuilding; changing the environment does not necessarily replace a cached prefix.

### Patched QEMU

Download pristine QEMU 8.2.2 from [QEMU releases](https://download.qemu.org/) and extract it at `.deps/qemu/`. For example:

```sh
mkdir -p .deps
curl -fL https://download.qemu.org/qemu-8.2.2.tar.xz -o .deps/qemu-8.2.2.tar.xz
tar -xf .deps/qemu-8.2.2.tar.xz -C .deps
# For a fresh checkout, rename the extracted qemu-8.2.2 directory to qemu.
mv .deps/qemu-8.2.2 .deps/qemu
git -C .deps/qemu apply --check "$PWD/qemu/patches/0001-shino-mmio-qemu-8.2.2.patch"
git -C .deps/qemu apply "$PWD/qemu/patches/0001-shino-mmio-qemu-8.2.2.patch"
mkdir -p .deps/qemu/build
(cd .deps/qemu/build && ../configure --target-list=aarch64-softmmu && ninja -j4)
export SHINO_QEMU="$PWD/.deps/qemu/build/qemu-system-aarch64"
```

Apply the QEMU patch once to unmodified source. If `.deps/qemu/` already exists, reuse or inspect it rather than renaming another source tree over it.

## Run the paper experiments

Preserve a copy of `results/` before rerunning: experiment runners overwrite the summaries and raw files. Run device suites sequentially. The launcher serializes its fixed shared-memory resources; do not start another model, bridge or older launcher manually at the same time.

```sh
python3 experiments/run_graph_sweep.py
python3 experiments/run_virtual_time_sweep.py --qemu "$SHINO_QEMU"
python3 experiments/run_bug_sweep.py --qemu "$SHINO_QEMU"
python3 experiments/run_poll_sweep.py --repetitions 5 --qemu "$SHINO_QEMU"
make plots
```

| Experiment | Workload and checks | Summary |
|---|---|---|
| Dependency timing | 30 seeded DAGs (8–64 processes), plus 8 service perturbations; corrected-edge and sink-time agreement with the configured oracle | `results/graph-sweep.json` |
| Joint virtual time | 16 CPU-rate/device-latency configurations; complete event accounting, no early completion and correct payload | `results/virtual-time-sweep.json` |
| Firmware assumption | 3 measured CDMA settings and 48 independently scaled combinations; post-work decision versus wait-for-completion | `results/firmware-bug-sweep.json` |
| Polling cost | 9 work-between-poll settings, each repeated 5 times; output, read count, host median and standard deviation | `results/poll-sweep.json` |

The CDMA workload performs 1,000 4-KiB transfers plus 100 post-work decisions. The convolution workload performs 1,000 operations from a 10×10 image and 3×3 kernel to an 8×8 output. FPGA hardware is not required for these software runs once the measured latency parameters are available.

## Inspect results

Compare graph structure, sink-time error, virtual-time events, firmware correctness and polling counts against the reference JSON. Host seconds and standard deviations vary with machine and load; compare the trend rather than requiring identical wall time. `make plots` reads the four summaries and writes the corresponding PDFs to `figures/`.

Traced device runs require the expected number of completions and zero early triggers to pass. Bug and throughput sweeps disable tracing to reduce instrumentation cost: their trace-derived deadline checks are unavailable, not measured zeros. Firmware output checks still run. See [evidence scope](docs/REPRODUCIBILITY.md) for the reference-data provenance and its distinction from the submitted paper.

## Scope

The evaluated platform has one Cortex-A53 vCPU, one outstanding completion and polling-based CDMA/convolution workloads. Configured DAG-oracle agreement validates implementation consistency, not cycle-level hardware fidelity. Interrupt timing and multiple outstanding completions are not evaluated. Source and patch copyright notices remain with their respective components.
