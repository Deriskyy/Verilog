`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/30 16:19:48
// Design Name: 
// Module Name: lab8_1_2
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


module lab8_1_2
#(parameter inverter_delay = 1, andor_delay = 3, xor_delay = 4)(
   input [3:0]a,
    input [3:0]b,
    input cin,
    output [3:0]sum,
    output cout
   );
    wire cout1,cout2,cout3;
	wire p0,p1,p2,p3,g0,g1,g2,g3,c1,c2,c3,c4,c0;
	wire pg0,pg1,pg2,pg3;
	wire pp1,pp2,pp3;
	wire ppp1,ppp2,ppp3;
	xor #xor_delay (p0, a[0], b[0]), (p1, a[1], b[1]), (p2, a[2], b[2]), (p3, a[3], b[3]);   
    and #andor_delay (g0, a[0], b[0]), (g1, a[1], b[1]), (g2, a[2], b[2]), (g3, a[3], b[3]);
    and #andor_delay (pg0, p0, cin), (pg1, p1, g0), (pg2, p2, g1), (pg3, p3, g2),
           (pp1, p1, p0, cin), (pp2, p2, p1, g0), (pp3, p3, p2, g1),
           (ppp1, p1, p1, p1, cin), (ppp2, p3, p2, p1, g0), (ppp3, p3, p2, p1, p0, cin);
    or #andor_delay (c1, g0, pg0), (c2, g2, pg1, pp1), (c3, g2, pg2, pp2, ppp1), (cout, g3, pg3, pp3, ppp2, ppp3);   
	xor #inverter_delay (sum[0], p0, cin), (sum[1], p1, c1), (sum[2], p2, c2), (sum[3], p3, c3); 
endmodule