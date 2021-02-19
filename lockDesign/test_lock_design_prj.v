`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:19:49 04/23/2020
// Design Name:   lock_design_prj
// Module Name:   H:/4200CODE/Finaldesign/test_lock_design_prj.v
// Project Name:  lock_design_prj
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lock_design_prj
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_lock_design_prj;

	// Inputs
	reg Clk;
	reg Rst_n;
	reg key_in;
	reg [3:0] Sw;

	// Outputs
	wire Close_sig;
	wire OPEN_sig;
	wire ERROR_sig;
	wire Change_word;
	wire Dp;
	wire [7:0] sel;
	wire [6:0] seg;

	// Instantiate the Unit Under Test (UUT)
	lock_design_prj uut (
		.Clk(Clk), 
		.Rst_n(Rst_n), 
		.key_in(key_in), 
		.Sw(Sw), 
		.Close_sig(Close_sig), 
		.OPEN_sig(OPEN_sig), 
		.ERROR_sig(ERROR_sig), 
		.Change_word(Change_word), 
		.Dp(Dp), 
		.sel(sel), 
		.seg(seg)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		// Wait 100 ns for global reset to finish
		forever #10  Clk=!Clk;
        
		// Add stimulus here

	end
	
	initial begin
		Rst_n = 0;
		key_in = 1;
		Sw = 0;		
		#2000;
		Rst_n = 1;
		key_in = 0;
		Sw = 4'hE;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;
		Sw = 4'h1;
	    
		key_in = 0;
		#200;
		key_in = 1;	
		#200;

		Sw = 4'h2;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h3;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h4;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;		

		Sw = 4'hD;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;		




		Sw = 4'hF;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;	
		Sw = 4'h5;

		key_in = 0;
		#200;
		key_in = 1;	
		#200;

		Sw = 4'h2;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h3;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h5;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;		

		Sw = 4'hD;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;	


		Sw = 4'hE;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;
		
		Sw = 4'h1;
	    
		key_in = 0;
		#200;
		key_in = 1;	
		#200;

		Sw = 4'h2;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h3;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h4;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;		

		Sw = 4'hD;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;		

		
		Sw = 4'h5;
	    
		key_in = 0;
		#200;
		key_in = 1;	
		#200;

		Sw = 4'h2;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h3;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;


		Sw = 4'h5;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;		

		Sw = 4'hD;
	
		key_in = 0;
		#200;
		key_in = 1;	
		#200;			
	end
      
endmodule

