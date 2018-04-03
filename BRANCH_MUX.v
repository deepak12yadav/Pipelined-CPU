`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:04:10 11/10/2017 
// Design Name: 
// Module Name:    BRANCH_MUX 
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
module BRANCH_MUX(in1,out,sel );
	input in1;
	output out;
	input sel;
	assign out= sel ? 1: (in1?1:0);
endmodule
