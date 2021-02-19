`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:19:49 04/23/2020
// Design Name:   lock_design_prj
// Module Name:   H:/4200CODE/Finaldesign/lock_design_prj.v
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
/////////////////////////////////////////////////////////////////////////////////
module lock_design_prj(
					input 			 			Clk,
					input 			 			Rst_n,
					input 			 			key_in,
					input       wire	[3:0]	Sw,
					output                      Close_sig,
					output                      OPEN_sig,
					output                      ERROR_sig,
					output      	            Change_word,
					output                      Dp,
					output  	[7:0]			sel,
					output wire [6:0]			seg
                      );
					  
wire    		Key_Done_Sig;


wire  [3:0]     Password_num1;
wire  [3:0]     Password_num2;
wire  [3:0]     Password_num3;
wire  [3:0]     Password_num4;
wire  [23:0]    disp_data;



wire 				Close_sig_r ;
wire 				OPEN_sig_r ;
wire 				ERROR_sig_r ;
wire 				Change_word_sig ;



					  

key_filter key_filter_U0 (
    .Clk(Clk), 
    .Rst_n(Rst_n), 
    .key_in(!key_in), 
    .key_in_flag(Key_Done_Sig)
    );
	
lock_sta_ctrl lock_sta_ctrl_U1 (
    .clk(Clk), 
    .rst_n(Rst_n), 
    .Key_Data(Sw), 
    .Key_Done_Sig(Key_Done_Sig), 
    .Password_num1(Password_num1), 
    .Password_num2(Password_num2), 
    .Password_num3(Password_num3), 
    .Password_num4(Password_num4), 
    .Change_word_sig(Change_word_sig), 
    .Close_sig(Close_sig_r), 
    .OPEN_sig(OPEN_sig_r), 
    .ERROR_sig(ERROR_sig_r)
    );	
	
seg_decode seg_decode_U2 (
    .Clk(Clk), 
    .Rst_n(Rst_n), 
    .En(1'b1), 
    .disp_data(disp_data), 
    .sel(sel), 
    .seg(seg)
    );


assign  disp_data={Password_num1,Password_num2,Password_num3,Password_num4};
assign  Close_sig=Close_sig_r;
assign  OPEN_sig=OPEN_sig_r;
assign  ERROR_sig=ERROR_sig_r;
assign  Change_word=Change_word_sig;
assign  Dp	   = 1'b1;
  
endmodule					  