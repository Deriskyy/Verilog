`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 21:00:12
// Design Name: 
// Module Name: clock_div
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


module clock_div(
    input CLK5MHZ,
    input BTNU,
    output reg CLK_1HZ
    );
     integer n;
    initial begin
        CLK_1HZ = 0;
        n = 0;
    end 
 always @(posedge CLK5MHZ) begin
        if (BTNU == 1'b1) begin
           n <= 0;
           CLK_1HZ <= 0;
        end
       else begin
            n = n + 1;
            if (n >= 249) begin////
                CLK_1HZ = ~CLK_1HZ;
                n = 0;
            end
        end
 end
endmodule
