`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/01 21:41:37
// Design Name: 
// Module Name: lab8_3_2
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


module lab8_3_2(
    input Clk, CE, SCLR,
    input [1:0] LOAD,
    input [1:0] reload,
    output reg [3:0] s0, s1, min
    );
    integer count = 0, negcounter = 0;
    wire clk10;
    wire lo;
    reg Q;
    
    clk_wiz_0 clock_inst
        (
        .clk_out1(clk10),
        .locked(locked),
        .clk_in1(Clk)
        );
        always @ (posedge clk10)
        begin
            if(CE) begin
                count <= count + 1;
                if (count >= 5)
                    Q <= 1'b0;
                else Q <= 1'b1;
                if (count >= 10)
                    count <= 0;
                   end
        end
        always @ (LOAD or reload)
        begin
            if (CE) begin
                //min = LOAD;
                //s1 = 4'b0000;
                //s0 = 4'b0000;
                negcounter = (LOAD * 60);
                    end
             if (reload) begin
                s0 = (LOAD % 10);
                s1 = ((LOAD % 60) - s0)/10;
                min = (LOAD - (LOAD % 60)) / 60;
             end
            end
         always @ (Q)
         begin 
            if (CE && (negcounter >= 0))
            begin
                negcounter = negcounter - 1;
            end
         end
         always @ (posedge SCLR)
         begin
            negcounter = 0;
         end
         always @ (negcounter)
         begin
            if (CE) begin
                s0 = (negcounter % 10);
                s1 = ((negcounter % 60) - s0)/10;
                min = (negcounter - (negcounter % 60)) / 60;
            end
         end
endmodule
