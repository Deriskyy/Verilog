`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 18:39:31
// Design Name: 
// Module Name: clk_div
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

module clk_div( 
input clkIn, 
output Clk);
    wire clock_in;  
    reg[27:0] counter=28'd0;
    parameter DIVISOR = 28'd500;

always @(posedge clkIn)
    begin
        counter <= counter + 28'd1;
    if(counter>=(DIVISOR-1))
        counter <= 28'd0;
end
assign Clk = (counter<DIVISOR/2)?1'b0:1'b1;
endmodule