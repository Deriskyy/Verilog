`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/15 14:36:26
// Design Name: 
// Module Name: lab10_2_1_tb
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


module lab10_2_1_tb;
reg CLK100MHZ,start;
reg [3:0] aa,ab;
wire done,clk;
wire [7:0] result;
integer i=0,j=0;
lab10_2_1 DUT (start,CLK100MHZ,aa,ab,result,done,clk);

initial begin
CLK100MHZ = 0;
forever #5 CLK100MHZ = ~CLK100MHZ;
end

initial begin
start = 0;
for(i=1;i<= 10;i=i+1)begin
for(j=0;j<=10;j=j+1)begin
#1000000 aa=i; ab = j;
end
end
end
initial begin
#150000;
forever begin
#900000 start = 1;
#100000 start = 0;
end end
endmodule
