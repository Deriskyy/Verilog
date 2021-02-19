`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 21:12:41
// Design Name: 
// Module Name: lab8_3_1_tb
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


module lab8_3_1_tb;
    reg Clk, CE, SCLR;
    wire [4:0] f, s0, s1, min;
    lab8_3_1 DUT (Clk, CE, SCLR, f, s0, s1, min);
    initial begin
    Clk = 0; 
    forever
         #5 Clk = ~Clk;
    end
    
    initial begin
        CE = 1; SCLR = 0;
    end
endmodule
