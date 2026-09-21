// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Sep 18 22:12:04 2026
// Host        : zc-os running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/vivao_workspace/SystemC/719C_PL_CONV_ACC/719C_PL_CONV_ACC.gen/sources_1/ip/fifo_conv_window/fifo_conv_window_stub.v
// Design      : fifo_conv_window
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu19eg_SE-ffvc1760-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_8,Vivado 2023.1" *)
module fifo_conv_window(clk, srst, din, wr_en, rd_en, dout, full, empty, valid, 
  data_count, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="srst,din[31:0],wr_en,rd_en,dout[31:0],full,empty,valid,data_count[9:0],wr_rst_busy,rd_rst_busy" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input srst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  output [31:0]dout;
  output full;
  output empty;
  output valid;
  output [9:0]data_count;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
