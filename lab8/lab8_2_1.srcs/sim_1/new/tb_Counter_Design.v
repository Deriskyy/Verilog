`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/31 16:45:02
// Design Name: 
// Module Name: tb_Counter_Design
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


module tb_Counter_Design;

	// Inputs
	reg CLK100MHZ;
	reg BTNU;
	reg enable;
	reg updown;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	lab8_2_1 uut (
		.CLK100MHZ(CLK100MHZ), 
		.BTNU(BTNU), 
		.enable(enable), 
		.updown(updown), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		CLK100MHZ = 0;
		// Wait 100 ns for global reset to finish
		forever #10 CLK100MHZ=!CLK100MHZ;
        
		// Add stimulus here

	end
      
	  
	 initial begin
		BTNU = 0;
		enable = 1;
		updown = 1;
		
		#2000;
		BTNU = 0;	
		
		
		#2000;
		#500 enable = 1;		
		#500 updown = 1;
		#500 BTNU = 0;
		
		#200 enable = 1; 		
		#300 updown = 1;
		#3000 BTNU = 1;
		
		

     end	 
endmodule
