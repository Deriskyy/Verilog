`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/11 10:17:28
// Design Name: 
// Module Name: lab9_1_1
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


module lab9_1_1(
input clk,ain,reset,
output reg yout,
output reg [3:0]  count
 );
 parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
    reg [1:0] state, nextstate;

    initial begin
        state = S0;
        nextstate = S0;
        count = 0;
    end

    // always block to apply next state
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 0;
            state <= S0;
            nextstate <= S0;
        end
        else begin
            count <= count + ain;
            state <= nextstate;
        end
    end

    // always block to compute next state
    always @(state or ain) begin
        if (ain)
            case(state)
                S0: nextstate <= S1;
                S1: nextstate <= S2;
                S2: nextstate <= S3;
                S3: nextstate <= S1;
            endcase
        else
            nextstate <= state;
    end

    // always block to compute output
    always @(state or ain) begin
        case(state)
            S0: yout <= ~ain;
            S1: yout <= 0;
            S2: yout <= 0;
            S3: yout <= ain;
        endcase
    end
endmodule
