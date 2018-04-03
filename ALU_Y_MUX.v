`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:29:43 11/10/2017 
// Design Name: 
// Module Name:    ALU_Y_MUX 
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
module ALU_Y_MUX(in1,in2,out,sel );
	input [15:0] in1,in2;
	output [15:0] out;
	input sel;
	assign out= sel ? in1: in2;

endmodule
