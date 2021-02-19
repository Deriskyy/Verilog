`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 10:33:23
// Design Name: 
// Module Name: lab9_2_1
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


module lab9_2_1(
input clk,reset,
input [1:0]ain ,
output yout
 );
     parameter S00 = 2'b00, S01 = 2'b01, S10 = 2'b10, S11 = 2'b11;
    reg [1:0] state, nextstate;
    reg y, nexty;
    assign yout = y;

    initial begin
        y = 0;
        nexty = 0;
        state = S00;
        nextstate = S00;
    end

    // always block to apply state
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            y <= 0;
            state <= S00;
        end
        else begin
            y <= nexty;
            state <= nextstate;
        end
    end

    // always block to update state
    always @(state or ain) begin
        case(ain)
            2'b00: nextstate <= S00;
            2'b01: nextstate <= S01;
            2'b10: nextstate <= S10;
            2'b11: nextstate <= S11;
        endcase
    end

    // always block to compute output
    always @(state or ain) begin
        if (ain == 2'b00)
            case(state)
                S00: nexty <= y;
                S01: nexty <= 0;
                S10: nexty <= ~y;
                S11: nexty <= 1;
            endcase
        else
            nexty <= y;
    end
endmodule