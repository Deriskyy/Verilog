`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/30 18:11:00
// Design Name: 
// Module Name: lab8_1_2_tb
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


module lab8_1_2_tb;
    reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0] sum;
	wire cout;
	defparam DUT.inverter_delay = 10, DUT.andor_delay = 12, DUT.xor_delay = 15;
	lab8_1_2 DUT (.a(a), .b(b), .cin(cin),.sum(sum), .cout(cout));

	initial begin
	    a = 4'b0000;b = 4'b0001;cin = 0;
		#100 a = 4'b0001; b = 4'b0010; cin = 0;
		#100 a = 4'b0110; b = 4'b1001; cin = 1;
		#100 a = 4'b0100; b = 4'b0000; cin = 1;
		#100 $finish;
	end
      
endmodule
