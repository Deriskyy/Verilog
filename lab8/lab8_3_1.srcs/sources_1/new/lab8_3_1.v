`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/31 22:22:31
// Design Name: 
// Module Name: lab8_3_1
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


module lab8_3_1(
    input Clk, CE, SCLR,
    output [4:0] f, s0, s1, min
    );
    wire clk5;
    
    clk_wiz_0 clk_wiz_div_inst0
    (
    .clk_out1(clk5),
    .locked(locked),
    .clk_in1(Clk)
    );
    
    c_counter_binary_f ff (
     .CLK(clk5),
     .CE(CE),
     .SCLR(SCLR),
     .Q(f)
    );
    
    c_counter_binary_s0 S0(
      .CLK(f == 4'b0000),
      .CE(CE),
      .SCLR(SCLR),
      .Q(s0)
    );
    
    c_counter_binary_s1 S1(
        .CLK(s0 == 4'b0000),
        .CE(CE),
        .SCLR(SCLR),
        .Q(s1)
    );
    
    c_counter_binary_m M(
        .CLK(s1 == 4'b0000),
        .CE(CE),
        .SCLR(SCLR),
        .Q(min)
    );
    
    
    endmodule