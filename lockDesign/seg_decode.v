`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:27:09 04/23/2020
// Design Name:   lock_design_prj
// Module Name:   H:/4200CODE/Finaldesign/seg_decode.v
// Project Name:  lock_design_prj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lock_design_prj
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module seg_decode(Clk,Rst_n,En,disp_data,sel,seg);

	input Clk;	//clk = 50Mhz
	input Rst_n;
	input En;	
	
	input [15:0]disp_data;
	
	output [7:0] sel;//
	output reg [6:0] seg;//
	
	reg [14:0]divider_cnt;//25000-1
	
	reg clk_1K;
	reg [7:0]sel_r;
	
	reg [3:0]data_tmp;


	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)
		divider_cnt <= 15'd0;
	else if(!En)
		divider_cnt <= 15'd0;
	else if(divider_cnt == 24999)
		divider_cnt <= 15'd0;
	else
		divider_cnt <= divider_cnt + 1'b1;

	
	always@(posedge Clk or negedge Rst_n)
	if(!Rst_n)
		clk_1K <= 1'b0;
	else if(divider_cnt == 24999)
		clk_1K <= ~clk_1K;
	else
		clk_1K <= clk_1K;
		

	always@(posedge clk_1K or negedge Rst_n)
	if(!Rst_n)
		sel_r <= 8'b1111_1110;
	else if(sel_r == 8'b1111_0111)
		sel_r <= 8'b1111_1110;
	else
		sel_r <=  {sel_r[6:0],sel_r[7]};
		
	always@(*)
		case(sel_r)
			8'b1111_1110:data_tmp = disp_data[3:0];
			8'b1111_1101:data_tmp = disp_data[7:4];
			8'b1111_1011:data_tmp = disp_data[11:8];
			8'b1111_0111:data_tmp = disp_data[15:12];
			default:data_tmp = 4'b0000;
		endcase
		
	always@(*)
		case(data_tmp)
			4'h0:seg = 7'b1000000;
			4'h1:seg = 7'b1111001;
			4'h2:seg = 7'b0100100;
			4'h3:seg = 7'b0110000;
			4'h4:seg = 7'b0011001;
			4'h5:seg = 7'b0010010;
			4'h6:seg = 7'b0000010;
			4'h7:seg = 7'b1111000;
			4'h8:seg = 7'b0000000;
			4'h9:seg = 7'b0010000;
			4'ha:seg = 7'b0001000;
			4'hb:seg = 7'b0000011;
			4'hc:seg = 7'b1000110;
			4'hd:seg = 7'b0100001;
			4'he:seg = 7'b0000110;
			4'hf:seg = 7'b1111111;
		endcase
		
	assign sel = (En)?sel_r:8'b1111_1111;

endmodule
