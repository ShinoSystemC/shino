// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Sep 18 22:12:05 2026
// Host        : zc-os running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/vivao_workspace/SystemC/719C_PL_CONV_ACC/719C_PL_CONV_ACC.gen/sources_1/ip/fifo_acc/fifo_acc_sim_netlist.v
// Design      : fifo_acc
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu19eg_SE-ffvc1760-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_acc,fifo_generator_v13_2_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_8,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module fifo_acc
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    almost_full,
    empty,
    almost_empty,
    valid,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE ALMOST_FULL" *) output almost_full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ ALMOST_EMPTY" *) output almost_empty;
  output valid;
  output wr_rst_busy;
  output rd_rst_busy;

  wire almost_empty;
  wire almost_full;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire valid;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [6:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [6:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [6:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "7" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "1" *) 
  (* C_HAS_ALMOST_FULL = "1" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "2" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "127" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "126" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "7" *) 
  (* C_RD_DEPTH = "128" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "7" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "7" *) 
  (* C_WR_DEPTH = "128" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "7" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_acc_fifo_generator_v13_2_8 U0
       (.almost_empty(almost_empty),
        .almost_full(almost_full),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[6:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[6:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[6:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_acc_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_acc_xpm_cdc_gray__2
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_acc_xpm_cdc_single
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "5" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_single" *) 
(* SIM_ASSERT_CHK = "0" *) (* SRC_INPUT_REG = "0" *) (* VERSION = "0" *) 
(* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SINGLE" *) 
module fifo_acc_xpm_cdc_single__2
   (src_clk,
    src_in,
    dest_clk,
    dest_out);
  input src_clk;
  input src_in;
  input dest_clk;
  output dest_out;

  wire dest_clk;
  wire src_in;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SINGLE" *) wire [4:0]syncstages_ff;

  assign dest_out = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_in),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SINGLE" *) 
  FDRE \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_acc_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_acc_xpm_cdc_sync_rst__2
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
aMT3usC6uizzcwnzOCX4OsS16Ob+YxFcsGovFpFklbnaIaD1S0lVdxenTwHPp6ByIEi+ehwr6Rgg
z/3AlTheI5NFTM8ihiMA18/wmUxI7EbaftJACA1LykUKCuj5myy0T+DACuv3sGYIZS38TZTZnnBC
FGAlvTZmRWs+JzneH3o=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lR9ZerhYSAb39nzEkeYvhnwEs5t9y/+yTDf8KuoUtR1BGeHZq8pA/YxtjzQLtaOW1R1IQUb0FtSI
e3CYAb7WHYbIjcpw3vKHvW1SqcGn9CMGa556CYKmD2oF12Kow8xRaFvMSBUVxX7HsHxNWnRd+PU1
+C0YayU2KFIY/7Yl6cZ5luAzhw/6SW3PFYUIyyqWy5MCIXweHOwQR2IpQEdlDur5nluN7i7BeB+i
fxwwHh8TU/g7T4mhZFkiTuBKdLAtQOjxWxzqTMxgcuAjlTylY16FgMFOASdvvSbqBZJjbxMdVloU
rYjS8O/8rWktv8GXcaIdBJ2BRj01q7jsChsbwA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Qvl63GHz9mq2xOB7elt/vAQ7URLGdD1Lkcz7f3Wtw31dwjjjbP62Ny/Jr6OmBIheWlgejx38qxAT
TrHiiEyjKmGcnPn1Tn2n+cH4RAxCbOFnCI9n6+YsYMTe9JkplGhGGr39SkFgJz0I2IKpPsuqTjCj
rhf49TAryNMQeRpREJA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MA+9Ro+dh339m0iZrkKbqTKN8gQ5xkxN/SPCfhkOn+5jjgCTS5IOKLHil+HsZDjX333ebxnornwG
MOBxyEdFfLM8SA+bs2r41J/j0af2VVMmCM3hOh8JmZxB4X9Jg/glegNCbvwzqxMbOQNEy+zt7j5t
TFVD82RtPFmYVVYZZyll/WvAA+0aVpyjzLCIM1GznFky0RWLv65Wp4MJJnNRRrtG3muMznVO/u2s
tACsJ9jzv9M0IlMYjYH9BixhG6cZX02I4LEXXaPkhdOINlMMhsbArXtc9NphzmS4bY1/1yF1D6YD
EKLyS2Sr3HDl0O/lefN+jvfG8iKuVl55PNNrVQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wpMTg7STjFkUDhOqdNPa0FHXTnHQgKmhvqDv+rRVBvMiQ8O7u8oj7ibITq3o+jugJsMJ60B410gQ
JFTcqCJKYmYJvqi8rPLLOYDmFG6ZLP/Ixr3n62IyIaCeDltBahi3yV009QN0X+iuzuFCL+Y7g9ff
IvAgyBly+Z3Itv2H9EJMZPMl17Sa7IkgjmWqzVXIKNMKn0iDVYsQw6ZgzQDYQ8N8IvTIEggU3/lh
6Nf0hV0ev3qOv/2P+4w0U766Ux3yLuzPJSI7bKm3/ip9NjhOytxOiKKqVXhKG8dzbbuS5u3EE/eq
q6YxkL7gpvNltVqqBnJB6vHSyWrD6+MqsCtR9A==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q7Q4SSp70lxFryaopuic9VVP/Ire0pSsPEIMYdURBAczC7ShkuYeV02U7L3BlAiyBE4vBKcwYSQd
cWiaj8sVP7q4kxoRHKxLV1R5PIO6l4DsLWE2E+1MLyUPME0w5KTular/oX8EPCJ5n/8VCtW7x4Vf
dpeyki1/IAPJkAyi3zVZKHzgKhEwnZaZZtZYuMWoPZMt4V38sAcE42Raf+7yfFWG5HO74JY6iEnW
gJeRk58K+avB/XLF2/j2RQZfjTYizrprT2tUMBK6e7DRWZZtk8AOcsMhUikev44IFGNbNXjP8BXC
0J3y3P7pCFT6l+saU83nRwi/H25fSA34diJtNw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a/8ooC+s+6nfvfa1+oBhsvYWLJjFgp83DI1kNyOi5Am+ugPbGRmgGZudfyo6yw6Yd5gGbLm5aToQ
5G4cGF5HaXD5TU6A0ZZFMTIbzFLE76JMjjIxX8JcaJIZpSmrXqlru8l5gDINUEAmwUY3mRQnjcGJ
0Z+kMRH8iAEF+gEviPiFZSBbJeOPqivIS217kimQJX3BeNbNPQTP+GUidcRywpGMh5avxtA0kDRO
F9SoCSyTm9hr2v9hsK1IUAYQLb7n2/R+z5YNKNzt1oN4qgJH1wZfdI8if2K8+ohyOdnxrrgJOWdj
cOqr7cGqEOYfBMTIQeHVZzb7NGWVN+9B8XSUaQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FLPvOUNRWNW2GU+FEGmt2XWthOT5bY/31DRbol2cUmEGNF6b2XzpCosNKGx/o2n6sQvGP39KRFCs
nJu0ihe2dUGee9nEZZUcpwPjnEfXVI3yJaRVYy8iL+rm59lXq0jX4sjAPieDvv8shgAnoXLTZGlq
K+2c1JhaHt+nFi27TDrYar/+P8nP1MhocOS7BjzCvSs0foEXj92/qD+71Sm/LqGr8cjlH2qTJJ8B
ynxoH6iT+bksVA2VbtPT9o6h1kJ/zwP4wcsL9l+qSlJhd4GI11JPux26DlNyIi41WmufQcfiT0PB
r6O9+0E9lV9ODwKdjaxfZRK29rjKeq2yr0jWhMV38XKKqHAJli7MIypGRXcCo+u89H87KgYt+ebw
s3foIqCe0JKR57WzI8VD6XdNtOL8eBxK539oemx4vkE0cGYECZKYru6A2hPeZOYDD5eyWSUlQl1R
EciK49WM8HnssyRVcmE6di6bISMbVi0TZG/v98bz+9UZa8DtqMVYH0tz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fphquQOeFuqByo36Gh2C1zEC1J6u9swSMbMzsKldIvLm+SZ6/hr/N8KJ/G2vBABzX6UtbVuP1ZXx
AxdftP4Aqis1B3Bs6989aQG9eo0SOHA7r6aFLtFb3qoD5Pvqw4aVNU4z4EtTpFpn/jCWD21lKROf
q5X32HRfFq1jwqod+9vIbUNRRzz5y9VHvXfacZlxDazSPmcCF4hxB1KqWqT44KmYVkDedgkgnYgb
ZGidHnTb3W7C8tSqC9ac4kNJCL429QndtddweESJNlpX+65pt9Irok9pkOodwoj0QScswOIFjhBZ
/GrzZLQcFWiD3gXRU4DazzxQnGdRH4qEIRWziw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1lUYYHPCt1BUJOvcBbgMU2GSQiqfxItz4ntieMaenjrtsE9SLwaU6xB0tBl8Atw5yP/RRNww1kX/
9uZbTz5He3r9mPVt+mGxB4N3f9BbCrQRb4USVPgKO/+vWUfMQERGklScy0+fz75WuxH74CjRUoDI
8iyssb2cUNnfDe13jIoI8gM1w4w/Pkxkmb6Mef53QMxacHAWEZeytcH3fuL/adO263D8P90U3XJv
vBXJmbjkRVi9qzjBzfMxuOy2KbZaZgR3BLzaffIfFnMwg/Rb8sGls5pQsZv5jL2wk3+Bj3OXBYdd
pDyjGoalJBzObKzd/t15kNHwY4FXYFcZLQPncw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRmSEzaa2WFVvMH1BwWc1TIUpVbzSEIP0VbI6n0sEgct/X4PiTfMQmK1jBVCaISIzwBxscKQwZOt
mb/nmINGg6I7ih39LSbBMtx6cdCUiyaLkPeRbqfyPpKhvnUIFmdKVvTd1dYzxeOeuDnhSVaBaAcN
3lngSg7lIbmhLIGjC29yQrBTiLArbVZi6IRGronMK51e3UrYa6GspsznhiuRcXjEb4bHKrJ2CM5Z
BUwA+E9949sQgyOagFZbLVle2ESbwBaoxcAPn2gxfRHlT0leqyLgUGDZLsfArzGzw9BTGzyEG2TR
XOrKFNYRfMXMrnGsBM7acIelY4LdAMgsKgDH/A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 118288)
`pragma protect data_block
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
yT6jnVgb9NBWRXRJ8A==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
