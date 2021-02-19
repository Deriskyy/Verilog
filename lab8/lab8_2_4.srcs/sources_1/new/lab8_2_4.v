`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/31 20:57:57
// Design Name: 
// Module Name: lab8_2_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

(* use_dsp48 = "yes" *)
module lab8_2_4
#(parameter  COUNT_SIZE   =8'd25)
(   
    input  wire		  	CLK100MHZ,
	input  wire		  	BTNU ,
	input  wire		  	enable ,
	input  wire		  	updown ,
    output wire [7:0]   out
    );

//*******************************************************************
//
//*******************************************************************
wire		CLK5MHZ;
wire		CLK_1HZ;



  clk_wiz_0 clk_wiz_div_inst0
   (
    // Clock out ports
    .clk_out1(CLK5MHZ),     // output clk_out1
    // Status and control signals
    .reset(BTNU), // input reset
    .locked(),       // output locked
   // Clock in ports
    .clk_in1(CLK100MHZ)); 

clock_div clock_div_inst1(
    .CLK5MHZ(CLK5MHZ), 
    .reset(BTNU), 
    .CLK_1HZ(CLK_1HZ)
    );


// Instantiate the module
Counter_Module  
	#(
		.COUNT_SIZE(COUNT_SIZE)
	 )
 Counter_Module_inst2
 (
    .CLK_1HZ(CLK_1HZ), 
    .BTNU(BTNU), 
    .enable(enable), 
    .updown(updown), 
    .out(out)
    );

    c_counter_binary_0 counter 
    (
     CLK, Q
    );
    
    
endmodule
