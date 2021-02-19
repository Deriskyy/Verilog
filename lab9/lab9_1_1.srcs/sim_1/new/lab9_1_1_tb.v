`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 10:29:08
// Design Name: 
// Module Name: lab9_1_1_tb
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


module lab9_1_1_tb;
reg clk, reset, a;
    wire [3:0] count;
    wire y;

    lab9_1_1 DUT (clk, a, reset, y, count);

    initial begin
        clk = 0; reset = 1; a = 0;
        #20 reset = 0;
        #20 a = 1;
        #20 a = 0;
        #40 a = 1;
        #10 a = 0;
        #10 a = 1;
        #10 a = 0;
        #20 a = 1;
        #10 a = 1;
        #10 reset = 1;
        #10 $finish();
    end

    always #5 clk <= ~clk;
endmodule

