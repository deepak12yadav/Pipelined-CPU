`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:49:18 11/10/2017 
// Design Name: 
// Module Name:    SP_REG 
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
module SP_REG(in,clk,out);
	input [4:0] in;
	input clk;
	output [4:0] out;
	reg [4:0] out;
	initial begin
		out=5'b0;
	end
	always@(posedge clk)
	begin
		out=in;
	end
	always@(negedge clk )
	begin
		$display("SP = %d",out);
	end
endmodule

