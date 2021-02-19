`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/13 21:54:33
// Design Name: 
// Module Name: lab10_1_1
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


module lab10_1_1(product, done, multiplier, multiplicand, start, clk);
    input clk, start;
    input[2:0] multiplicand, multiplier;
    output reg [5:0] product;
    output done;

    reg [4:0] bit;
    reg c;
    reg [2:0] m;
    wire done = !bit;
    initial bit = 0;
    always @(posedge clk)
      if(done && start) begin
    //initialize
        bit = 3;
        product[5:3] = 3'd0;
        product[2:0] = multiplier;
        m = multiplicand;
        c = 1'd0;
      end
      else if(bit) begin
         if(product[0]) 
            {c, product[5:3]} = product[5:3] + m;
            product[5:0] = {c, product[5:1]};
             c = 0;
             bit = bit - 1;   
         end 
         
 endmodule       
    
