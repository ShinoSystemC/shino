# FPGA Hardware-Latency Experiments

This directory contains the FPGA designs and firmware for reproducing the **real hardware latency measurements that parameterize the software experiments in the DATE paper**. The CDMA and convolution workloads provide hardware timing references for register access and device completion/data validity. These measurements are used by the corresponding models in [Software_Project](../Software_Project/README.md).

## Designs and matching firmware

| Workload | FPGA design | Hardware firmware |
|---|---|---|
| CDMA transfers | `Vivado_Project/ZU19EG_AXI_CDMA_Base/` | `Firmware_Code/ZU19EG_AXI_CDMA_Base_Firmware/` |
| Convolution accelerator | `Vivado_Project/ZU19EG_PL_CONV_ACC/` | `Firmware_Code/ZU19EG_PL_CONV_ACC_Firmware/` |

Open the corresponding Vivado project:

- `Vivado_Project/ZU19EG_AXI_CDMA_Base/ZU19EG_AXI_CDMA_Base.xpr`
- `Vivado_Project/ZU19EG_PL_CONV_ACC/ZU19EG_PL_CONV_ACC.xpr`

## Paper measurement platform

The paper reports an `xczu19eg_SE-ffvc1760-2-i` target with Vivado/Vitis 2023.1. The CPU clock is 1,333 MHz; the baseline PL clock for the DMA/CDMA, interconnect, accelerator and BRAM is 100 MHz. An additional CDMA setting uses 200 MHz. The CDMA evaluation distinguishes 100-MHz Interconnect, 200-MHz Interconnect and 100-MHz SmartConnect configurations.

Project exports may contain IP and SDK metadata from earlier tool versions. Check the selected device, IP versions, clock settings, memory map and constraints against the intended experimental configuration before regenerating hardware. A newer tool may require IP or firmware-workspace migration; not every timing configuration is necessarily exported as a separate project.

## Reproduction workflow

1. Open the appropriate Vivado project and verify the device, interconnect and clock configuration.
2. Regenerate the design and bitstream, and export the hardware platform for the firmware environment.
3. Import the matching firmware with the corresponding hardware platform/BSP. Verify its register and memory addresses before programming the FPGA.
4. Run the hardware workload and record register read/write response latency separately from operation completion/data-validity latency. Keep the board configuration, clocks and measurement boundary with the measurements.
5. Use these latency components in the corresponding software experiment. Do not substitute host execution time for hardware latency.

The measured CDMA parameter sets used by the software bug sweep are:

| Hardware setting | Read response (ns) | Write response (ns) | Completion/service parameter (ns) |
|---|---:|---:|---:|
| 100-MHz Interconnect | 302 | 62 | 7,967 |
| 200-MHz Interconnect | 212 | 30 | 4,075 |
| 100-MHz SmartConnect | 552 | 125 | 7,952 |

The software convolution polling experiment uses read/write parameters of 287/50 ns and a service parameter of 45,500 ns. Consult the paper for the measurement definitions and workload boundaries before comparing newly measured values.

## Connection to software evaluation

The software workloads include 4-KiB CDMA transfers and convolution of a 10×10 image with a 3×3 kernel. Measured latency components configure the virtual platform; independently scaled combinations test firmware behavior under additional timing conditions. Scaled combinations are synthetic and must not be reported as separate FPGA measurements.

The hardware firmware here is for the FPGA measurement platform; the Zephyr firmware under `../Software_Project/firmware/` is for QEMU. The FPGA measurements and rebuild flow were not rerun during the latest software reproducibility check. Generated metadata and historical commits require a separate privacy review if anonymous distribution is needed.
