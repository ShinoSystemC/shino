onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib ps_dma_fft_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {ps_dma_fft.udo}

run 1000ns

quit -force
