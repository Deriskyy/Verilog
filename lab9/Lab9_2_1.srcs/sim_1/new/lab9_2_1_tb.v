`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 10:38:47
// Design Name: 
// Module Name: lab9_2_1_tb
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


module lab9_2_1_tb;
 wire yout;
    reg clk, reset;
    reg [1:0] ain;

    lab9_2_1 DUT (clk, reset, ain, yout);

    initial begin
        clk = 0; reset = 1; ain = 2'b00;
        #20 reset = 0;
        #20 ain = 2'b11;
        #10 ain = 2'b10;
        #10 ain = 2'b00;
        #20 ain = 2'b10;
        #10 ain = 2'b00;
        #10 ain = 2'b11;
        #10 ain = 2'b00;
        #10 ain = 2'b01;
        #10 ain = 2'b00;
        #10 ain = 2'b10;
        #10 ain = 2'b11;
        #10 ain = 2'b00;
        #10 reset = 1;
        #10 reset = 0;
        #10 ain = 2'b10;
        #30 ain = 2'b00;
        #30 $finish();
    end

    always #5 clk <= ~clk;
endmodule