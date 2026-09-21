// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Fri Sep 18 22:12:04 2026
// Host        : zc-os running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/vivao_workspace/SystemC/719C_PL_CONV_ACC/719C_PL_CONV_ACC.gen/sources_1/ip/fifo_signal_transfer/fifo_signal_transfer_sim_netlist.v
// Design      : fifo_signal_transfer
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu19eg_SE-ffvc1760-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_signal_transfer,fifo_generator_v13_2_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_8,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module fifo_signal_transfer
   (rst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid,
    wr_rst_busy,
    rd_rst_busy);
  input rst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [0:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [0:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [0:0]din;
  wire [0:0]dout;
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
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
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
  (* C_DIN_WIDTH = "1" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "1" *) 
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
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
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
  fifo_signal_transfer_fifo_generator_v13_2_8 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
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
module fifo_signal_transfer_xpm_cdc_gray
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
module fifo_signal_transfer_xpm_cdc_gray__2
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
module fifo_signal_transfer_xpm_cdc_single
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
module fifo_signal_transfer_xpm_cdc_single__2
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
module fifo_signal_transfer_xpm_cdc_sync_rst
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
module fifo_signal_transfer_xpm_cdc_sync_rst__2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 110272)
`pragma protect data_block
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
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
