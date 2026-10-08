PYTHON ?= python3
ZEPHYR_BASE ?= $(CURDIR)/.deps/zephyr
CROSS_COMPILE ?= $(patsubst %gcc,%,$(shell command -v aarch64-none-elf-gcc))
BUILD_ENV = ZEPHYR_BASE=$(ZEPHYR_BASE) ZEPHYR_TOOLCHAIN_VARIANT=cross-compile CROSS_COMPILE=$(CROSS_COMPILE)
.PHONY: all systemc firmware firmware-cdma firmware-conv test plots
all: systemc firmware
systemc:
	cmake -S systemc -B build/systemc -GNinja
	cmake --build build/systemc -j4
firmware: firmware-cdma firmware-conv
firmware-cdma:
	$(BUILD_ENV) cmake -S firmware/app -B build/firmware-cdma -GNinja -DBOARD=qemu_cortex_a53 -DZephyr_DIR=$(ZEPHYR_BASE)/share/zephyr-package/cmake -DPython3_EXECUTABLE=$(shell command -v $(PYTHON))
	$(BUILD_ENV) cmake --build build/firmware-cdma -j4
firmware-conv:
	$(BUILD_ENV) cmake -S firmware/app -B build/firmware-conv -GNinja -DBOARD=qemu_cortex_a53 -DZephyr_DIR=$(ZEPHYR_BASE)/share/zephyr-package/cmake -DPython3_EXECUTABLE=$(shell command -v $(PYTHON)) -DCONFIG_SHINO_CONV_WORKLOAD=y
	$(BUILD_ENV) cmake --build build/firmware-conv -j4
test: systemc
	ctest --test-dir build/systemc --output-on-failure
plots:
	MPLCONFIGDIR=$(CURDIR)/build/mpl-cache $(PYTHON) tools/plot_evaluation.py
