`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 22:09:21
// Design Name: 
// Module Name: lab8_3_3
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


module lab8_3_3(
    input Clk, CE, SCLR,
    input [1:0] LOAD,
    output [3:0] s0, s1, m0, m1
    );
    integer count = 0, negcounter = 0;
    wire clk10;
    reg Q;
    
    clk_wiz_0 clock_inst
        (
        .clk_out1(clk10),
        .locked(locked),
        .clk_in1(Clk)
        );
        always @ (posedge clk10)
        begin
        if (CE)
            begin
            count <= count + 1;
            if (count >= 5)
                Q <= 1'b0;
            else Q <= 1'b1;
            if (count >= 10)
                count <= 0;
           end
       end
       c_counter10 sec0 (.CLK(Q), .CE(CE), .SCLR(SCLR), .Q(s0));
       c_counter6 sec1 (.CLK(s0 == 4'b0000), .CE(CE), .SCLR(SCLR), .Q(s1));
       c_counter_10 min0 (.CLK(s1 == 4'b0000), .CE(CE), .SCLR(SCLR), .Q(m0));
       c_counter_6 min1 (.CLK(m0 == 4'b0000), .CE(CE), .SCLR(SCLR), .Q(m1));
      
endmodule
