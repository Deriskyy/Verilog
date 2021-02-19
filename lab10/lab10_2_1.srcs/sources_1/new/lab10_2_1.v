`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/14 17:37:53
// Design Name: 
// Module Name: lab10_2_1
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


module lab10_2_1(
    input start, CLK10MHZ,
    input[3:0] multiplicand, multiplier,
    output reg [7:0] product,
    output done,
    //output [3:0] a,b;
    output CLK10kHZ);

    reg [4:0] bit;
    reg c;
    reg [3:0] m;
    assign done = !bit;
    reg [3:0] ROM [31:0];
    wire [3:0] a,b;
    wire CLK5MHZ;
    
      clk_wiz_0 clk_wiz_div_inst0
   (
    .clk_out1(CLK5MHZ),     
  
    .clk_in1(CLK10MHZ)); 

    clk_div clock_div_inst1(
       CLK5MHZ,CLK10kHZ
    );
    assign a = ROM[multiplicand];
    assign b = ROM[5'h10| multiplier];
initial begin
    $readmemh("multiplicant.txt",ROM,0, 31);
    end
    initial bit = 0;

    always @(posedge CLK10kHZ)
      if(done && start) begin
    //initialize
        bit = 4;
        product[7:4] = 3'd0;
        product[3:0] = b;
        m = a;
        c = 1'd0;
      end
      else if(bit) begin
         if(product[0]) 
            {c, product[7:4]} = product[7:4] + m;
            product[7:0] = {c, product[7:1]};
             c = 0;
             bit = bit - 1;   
         end   
 endmodule     
