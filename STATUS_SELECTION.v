`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:57:16 11/10/2017 
// Design Name: 
// Module Name:    STATUS_SELECTION 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DFF( D, clk, Q, ld);
    input D, clk, ld;
	 output reg Q;
	 initial begin
		Q=0;
	end
	 always @(posedge clk)
	 begin 
		if(ld)
			Q <= D;
		else 
			Q <= Q;
		end
endmodule

module STATUS_SELECTION( vin, Cin, Zin, Sin, IR, ld, CC, clk);
	input vin, Cin, Zin, Sin, IR, ld, clk;
	output CC;
	reg CC;
	wire[3:0] IR;
	wire s0,s1,s3,s5,s7;
	assign s0 = 1'b1;
	DFF V(vin, clk, s1, ld);
	DFF C(Cin, clk, s3,ld);
	DFF Z(Zin, clk, s5, ld);
	DFF S1(Sin, clk, s7, ld);

	always@(IR[0] or IR[1] or IR[2] or IR[3] or s1 or s0 or s3 or s5 or s7)
	begin
		case(IR)
			4'b1001:CC<=~s7;
			4'b0001:CC<=s0;
			4'b0010:CC<=s3;
			4'b0011:CC<=~s3;
			4'b0100:CC<=s5;
			4'b0101:CC<=~s5;
			4'b0110:CC<=s1;
			4'b0111:CC<=~s1;
			4'b1000:CC<=s7;
			default: CC<=0;
		endcase	
	end
endmodule

