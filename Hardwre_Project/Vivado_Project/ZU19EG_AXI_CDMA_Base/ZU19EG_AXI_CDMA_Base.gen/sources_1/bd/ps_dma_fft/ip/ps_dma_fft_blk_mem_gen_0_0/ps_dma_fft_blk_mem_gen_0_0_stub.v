// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Sep 16 15:37:52 2026
// Host        : zc-os running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/vivao_workspace/fft_dma/719C_AXI_DMA_0915/719C_AXI_DMA_0915.gen/sources_1/bd/ps_dma_fft/ip/ps_dma_fft_blk_mem_gen_0_0/ps_dma_fft_blk_mem_gen_0_0_stub.v
// Design      : ps_dma_fft_blk_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu19eg_SE-ffvc1760-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *)
module ps_dma_fft_blk_mem_gen_0_0(clka, rsta, ena, wea, addra, dina, douta, clkb, rstb, enb, 
  web, addrb, dinb, doutb, rsta_busy, rstb_busy)
/* synthesis syn_black_box black_box_pad_pin="rsta,ena,wea[7:0],addra[31:0],dina[63:0],douta[63:0],rstb,enb,web[7:0],addrb[31:0],dinb[63:0],doutb[63:0],rsta_busy,rstb_busy" */
/* synthesis syn_force_seq_prim="clka" */
/* synthesis syn_force_seq_prim="clkb" */;
  input clka /* synthesis syn_isclock = 1 */;
  input rsta;
  input ena;
  input [7:0]wea;
  input [31:0]addra;
  input [63:0]dina;
  output [63:0]douta;
  input clkb /* synthesis syn_isclock = 1 */;
  input rstb;
  input enb;
  input [7:0]web;
  input [31:0]addrb;
  input [63:0]dinb;
  output [63:0]doutb;
  output rsta_busy;
  output rstb_busy;
endmodule
