`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 22:23:10
// Design Name: 
// Module Name: lab8_3_3_tb
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


module lab8_3_3_tb();
    reg Clk, CE, SCLR;
    reg [1:0] LOAD;
    wire [3:0] s0, s1, m0, m1;
    lab8_3_3 DUT (Clk, CE, SCLR, LOAD, s0, s1, m0, m1);
    
    initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
    end
    
    initial begin
        LOAD = 2'b11; CE = 1; SCLR = 0;
        #50000 SCLR = 1;
        #10000 SCLR = 0;
        end
        
endmodule
