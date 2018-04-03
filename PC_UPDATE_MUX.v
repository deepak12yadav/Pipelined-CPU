`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:09:20 11/10/2017 
// Design Name: 
// Module Name:    PC_UPDATE_MUX 
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
module PC_UPDATE_MUX(in1,in2,out,sel_branch,sel_call_ret,sel_con );
	input [4:0] in1,in2;
	output [4:0] out;
	input sel_branch,sel_con,sel_call_ret;
	assign out= sel_branch ? (sel_con?in2:in1): (sel_call_ret?in2:in1);
endmodule
