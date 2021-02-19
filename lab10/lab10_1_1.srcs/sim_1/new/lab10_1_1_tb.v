`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 14:07:13
// Design Name: 
// Module Name: lab10_1_1_tb
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


module lab10_1_1_tb;
    reg clk, start;
    reg [2:0] multiplicand, multiplier;
    wire [5:0] product;
    wire done;
    
    lab10_1_1 DUT (product, done, multiplier, multiplicand, start, clk);
    
    initial begin
    clk = 0; start = 0; multiplicand = 3'b111; multiplier = 3'b101;
    #30 start = 1;
    #10 start = 0;
    #140 start = 1; multiplicand = 3'b100; multiplier = 3'b001;
    #10 start = 0;
    #150 start = 1; multiplicand = 3'b111; multiplier = 3'b100;
    #10  start = 0;
    #200 $finish();
    end
    always #5 clk <= ~clk;
endmodule
