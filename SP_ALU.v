`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:45:12 11/10/2017 
// Design Name: 
// Module Name:    SP_ALU 
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
module SP_ALU(in,out,sel ,sel1);
	input [4:0] in;
	output [4:0] out;
	input sel,sel1;
	assign out=sel?in-1:(sel1?in:in+1);
endmodule
