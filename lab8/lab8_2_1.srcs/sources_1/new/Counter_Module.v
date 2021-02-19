`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/31 16:30:47
// Design Name: 
// Module Name: Counter_Module
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


module Counter_Module
#(parameter COUNT_SIZE = 8'd255)
    (
    input  wire		  	CLK_1HZ,
	input  wire		  	BTNU ,
	input  wire		  	enable ,
	input  wire		  	updown ,
    output wire [7:0]   out  
    
    );
    reg [7:0] Counter = 8'd0;
    
    always @ (posedge CLK_1HZ) begin
        if (BTNU == 1'b1)begin
            Counter <= 8'b0;
            end
        else if (enable == 1'b1) begin
            if (updown == 1'b1) begin
                if (Counter == COUNT_SIZE)
                 Counter <= 8'd0;
                else 
                 Counter <= Counter + 1'b1;
                end
            else begin
                if (Counter == 8'd0)
                    Counter <= COUNT_SIZE;
                else
                    Counter <= Counter - 1'b1;
                end
            end
         else
            Counter <= Counter;
        end
        assign out = Counter;
    
endmodule
