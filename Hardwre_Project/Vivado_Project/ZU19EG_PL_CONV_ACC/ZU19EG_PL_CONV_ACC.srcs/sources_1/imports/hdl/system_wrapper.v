//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Fri Sep 18 22:07:00 2026
//Host        : zc-os running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (
   
   );
	
	

  wire [31:0]M_AXIS_MM2S_0_tdata;
  wire [3:0]M_AXIS_MM2S_0_tkeep;
  wire M_AXIS_MM2S_0_tlast;
  wire M_AXIS_MM2S_0_tready;
  wire M_AXIS_MM2S_0_tvalid;
  wire [31:0]S_AXIS_S2MM_0_tdata;
  wire [3:0]S_AXIS_S2MM_0_tkeep;
  wire S_AXIS_S2MM_0_tlast;
  wire S_AXIS_S2MM_0_tready;
  wire S_AXIS_S2MM_0_tvalid;
  wire mm2s_prmry_reset_out_n_0;
  wire pl_clk;
  wire [31:0]reg0;
  wire [31:0]reg1;
  wire [31:0]reg2;
  wire [31:0]reg3;
  wire s2mm_prmry_reset_out_n_0;

  system system_i
       (
        .M_AXIS_MM2S_0_tdata(M_AXIS_MM2S_0_tdata),
        .M_AXIS_MM2S_0_tkeep(M_AXIS_MM2S_0_tkeep),
        .M_AXIS_MM2S_0_tlast(M_AXIS_MM2S_0_tlast),
        .M_AXIS_MM2S_0_tready(M_AXIS_MM2S_0_tready),
        .M_AXIS_MM2S_0_tvalid(M_AXIS_MM2S_0_tvalid),
        .S_AXIS_S2MM_0_tdata(S_AXIS_S2MM_0_tdata),
        .S_AXIS_S2MM_0_tkeep(S_AXIS_S2MM_0_tkeep),
        .S_AXIS_S2MM_0_tlast(S_AXIS_S2MM_0_tlast),
        .S_AXIS_S2MM_0_tready(S_AXIS_S2MM_0_tready),
        .S_AXIS_S2MM_0_tvalid(S_AXIS_S2MM_0_tvalid),
        .mm2s_prmry_reset_out_n_0(mm2s_prmry_reset_out_n_0),
        .pl_clk(pl_clk),
        .reg0(reg0),
        .reg1(reg1),
        .reg2(reg2),
        .reg3(reg3),
        .s2mm_prmry_reset_out_n_0(s2mm_prmry_reset_out_n_0));

		
Conv_Acc Conv_Acc_inst
    (
    .clk_ps(pl_clk),
    .M_AXIS_MM2S_0_tdata(M_AXIS_MM2S_0_tdata),
    .M_AXIS_MM2S_0_tkeep(M_AXIS_MM2S_0_tkeep),
    .M_AXIS_MM2S_0_tlast(M_AXIS_MM2S_0_tlast),
    .M_AXIS_MM2S_0_tready(M_AXIS_MM2S_0_tready),
    .M_AXIS_MM2S_0_tvalid(M_AXIS_MM2S_0_tvalid),    
    .S_AXIS_S2MM_0_tdata(S_AXIS_S2MM_0_tdata),
    .S_AXIS_S2MM_0_tkeep(S_AXIS_S2MM_0_tkeep),
    .S_AXIS_S2MM_0_tlast(S_AXIS_S2MM_0_tlast),
    .S_AXIS_S2MM_0_tready(S_AXIS_S2MM_0_tready),
    .S_AXIS_S2MM_0_tvalid(S_AXIS_S2MM_0_tvalid),
    .mm2s_prmry_reset_out_n_0(mm2s_prmry_reset_out_n_0),    
    .s2mm_prmry_reset_out_n_0(s2mm_prmry_reset_out_n_0),    
    .reg0(reg0),
	.reg1(reg1),
	.reg2(reg2),
	.reg3(reg3)
    ); 		

endmodule