`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 22:02:00
// Design Name: 
// Module Name: lab8_3_2_tb
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


module lab8_3_2_tb;
    reg Clk, CE, SCLR;
    reg [1:0] LOAD, reload;
    wire [3:0] s0, s1, min;
    lab8_3_2 DUT (Clk, CE, SCLR, LOAD, reload, s0, s1, min);
    initial begin
        Clk = 0;
        forever #5 Clk = ~Clk;
        end
    initial begin
        LOAD = 2'b11; CE = 1; SCLR = 0;
        #10000 reload = 1;
        #50000 SCLR = 1; 
        #10000 SCLR = 0;  
        
        end
endmodule
