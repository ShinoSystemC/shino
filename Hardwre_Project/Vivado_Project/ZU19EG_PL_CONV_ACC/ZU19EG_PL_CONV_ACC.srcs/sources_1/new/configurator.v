`timescale 1ns / 1ps


`define define_width  32'h00000001 
`define define_height 32'h00000002
`define define_conv_coff 32'h00000003  
`define define_conv_data 32'h00000004 
`define define_decimal_num 32'h00000005 
`define define_bram_mac_en 32'h00000006 
`define define_rd_result_en 32'h00000007

module configurator
(
	input clk,
	input rst_n,
	input  [31:0] cfg_reg0,
	input  [31:0] cfg_reg1,
	
	output reg [31:0] max_width,
	output reg [31:0] max_height,
	output reg [31:0] decimal_num,
	output reg cfg_coff_en,
	output reg cfg_data_en,
	output reg bram_mac_en,
	output reg rd_result_en
);

always@(posedge clk or negedge rst_n)
if(~rst_n) begin
	max_width <= 'd256;
	max_height <= 'd256;
	decimal_num <= 'd0;
	cfg_coff_en <= 0;
	cfg_data_en <= 0;	
	bram_mac_en <= 0;
	rd_result_en <= 0;
end
else begin
	case(cfg_reg0)
		`define_width: begin
			max_width <= cfg_reg1;
		end
		`define_height: begin
			max_height <= cfg_reg1;
		end
		`define_decimal_num: begin
			decimal_num <= cfg_reg1;
		end
		`define_conv_coff: begin
			cfg_coff_en <= ~(cfg_reg1 == 'd0);
		end
		`define_conv_data: begin
			cfg_data_en <= ~(cfg_reg1 == 'd0);
		end
		`define_bram_mac_en:begin
			bram_mac_en <= ~(cfg_reg1 == 'd0);
		end
		`define_rd_result_en:begin
			rd_result_en <= ~(cfg_reg1 == 'd0);
		end
		default: begin
			max_width <= 'd256;
			max_height <= 'd256;
			decimal_num <= 'd0;
			cfg_coff_en <= 0;
			cfg_data_en <= 0;	
			bram_mac_en <= 0;
			rd_result_en <= 0;
		end
	endcase
end

endmodule
