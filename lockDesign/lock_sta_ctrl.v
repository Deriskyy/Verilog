`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:40:49 04/23/2020
// Design Name:   lock_design_prj
// Module Name:   H:/4200CODE/Finaldesign/lock_sta_ctrl.v
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
module   lock_sta_ctrl(
							clk,
							rst_n,
							Key_Data,
							Key_Done_Sig,
							Password_num1,
							Password_num2,
							Password_num3,
							Password_num4,
		
						    Change_word_sig,//passwords change signal
							Close_sig,//close signal
							OPEN_sig,//correct password signal
							ERROR_sig//incorrect password signal

							 );

input  clk;
input  rst_n;
input  [3:0]Key_Data;	
input  Key_Done_Sig;



output reg [3:0] Password_num1;
output reg [3:0] Password_num2;
output reg [3:0] Password_num3;
output reg [3:0] Password_num4;


output  reg Change_word_sig;
output  reg OPEN_sig;
output  reg ERROR_sig;
output  reg Close_sig;

reg  [6:0] i;

//initial passwords is 1234
reg  [3:0] initial_word1=4'h1;
reg  [3:0] initial_word2=4'h2;
reg  [3:0] initial_word3=4'h3;
reg  [3:0] initial_word4=4'h4;

always@(posedge clk or negedge rst_n)
begin
  if(!rst_n)
     begin
	    i<=7'd0;
	
	    initial_word1<=4'h1;
		initial_word2<=4'h2;
		initial_word3<=4'h3;
		initial_word4<=4'h4;

		
		Password_num1<=4'hf;
		Password_num2<=4'hf;
		Password_num3<=4'hf;
		Password_num4<=4'hf;

		
		Change_word_sig<=1'b0;
		OPEN_sig<=1'b1;
		ERROR_sig<=1'b0;

		Close_sig<=1'b0;

		
	  end  	

else if((Key_Done_Sig==1'b1))
  begin
    case(i)
	  7'd0:
	       case(Key_Data)
			 4'hE ://If input E, passwords input end
			      begin
					    i<=i+1'b1;							
						Password_num1<=4'hf;
						Password_num2<=4'hf;
						Password_num3<=4'hf;
			            Password_num4<=4'hf;
						OPEN_sig<=1'b0;
						Close_sig<=1'b1;
						Change_word_sig<=1'b0;
					end
					
			4'hF: //input E, change passwords
			     begin
				     i<=7'd8;				 				 
					 Password_num1<=4'hf;
					 Password_num2<=4'hf;
					 Password_num3<=4'hf;
					 Password_num4<=4'hf; 

					 
					 Change_word_sig<=1'b1;
					 OPEN_sig<=1'b1;
					 Close_sig<=1'b0;

				  end
		default:;
		endcase			
    7'd1:
				     begin
				        Password_num1<=Key_Data;
						OPEN_sig<=1'b0;
						Close_sig<=1'b1;
						//Close_sig<=1'b0;
						Change_word_sig<=1'b0;	
                        i<=i+1'b1;
				    	end	
						
	 7'd2:
						begin
						Password_num2<=Key_Data;
						OPEN_sig<=1'b0;
						Close_sig<=1'b1;
						Change_word_sig<=1'b0;	
						i<=i+1'b1;						
						end
	7'd3:

					  begin
					  Password_num3<=Key_Data;				  
					  OPEN_sig<=1'b0;
					  Close_sig<=1'b1;
					  Change_word_sig<=1'b0;	
                      i<=i+1'b1;
					  end	

	7'd4:

					  begin
					  Password_num4<=Key_Data;
					  OPEN_sig<=1'b0;
					  Close_sig<=1'b1;
					  Change_word_sig<=1'b0;	
                      i<=i+1'b1;
					  end			   
	7'd5:
           begin

			    if(Key_Data==4'hD)///////SW 1101
			    begin
				    if((Password_num1==initial_word1)&&(Password_num2==initial_word2)&&(Password_num3==initial_word3)&&(Password_num4==initial_word4))//?
					    begin
						i<=7'd0;//reset
												
						Password_num1<=4'hf;//Hide passwords?
						Password_num2<=4'hf;
						Password_num3<=4'hf;
			            Password_num4<=4'hf;	
						
						OPEN_sig<=1'b1;//opened
						Close_sig<=1'b0;//close
						Change_word_sig<=1'b0;	
						ERROR_sig<=1'b0;
						 end
				  else
				     
					  begin
						
					    Password_num1<=4'hf;
						Password_num2<=4'hf;
						Password_num3<=4'hf;
						Password_num4<=4'hf;	
	
									
						OPEN_sig<=1'b0;
						Close_sig<=1'b1;
						Change_word_sig<=1'b0;	
						ERROR_sig<=1'b1;
						i<=7'd1;//
			          end		  
			    end	 
			  else
						i<=i;//no change
			  end 
  				 
	7'd8:
	     begin
		             i<=i+1'b1;
		      	     Password_num1<=Key_Data;/////
					 
					 Change_word_sig<=1'b1;
			   		 OPEN_sig<=1'b1;
					 Close_sig<=1'b0;
			    	 //ERROR_sig<=1'b1;
		   end
	7'd9:
			begin
		    Password_num2<=Key_Data;//
			i<=i+1'b1;						
			end
			
	7'd10:

					  begin
					  Password_num3<=Key_Data;
                      i<=i+1'b1;
					  end	

	7'd11:
					  begin
					  Password_num4<=Key_Data;
                      i<=i+1'b1;
					  end							  
			 		
   7'd12:
         begin
			   if(Key_Data==4'hD)
				  begin
				      initial_word1<=Password_num1;
					  initial_word2<=Password_num2;
					  initial_word3<=Password_num3;
					  initial_word4<=Password_num4;
					  
					  i<=7'd0;
					  
					 Change_word_sig<=1'b0;
					 OPEN_sig<=1'b1;
					 Close_sig<=1'b0;
					  
				     Password_num1<=4'hF;
		             Password_num2<=4'hF;
		             Password_num3<=4'hF;
		             Password_num4<=4'hF; 			  			  
				   end					
			 else
		         i<=i;	 	   
		   end	
  default:;
  endcase
  end  
end



	 
endmodule							 