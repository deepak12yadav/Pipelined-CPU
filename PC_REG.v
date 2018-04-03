`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:52:01 11/10/2017 
// Design Name: 
// Module Name:    PC_REG 
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
module PC_REG(in,clk,out);
	input [4:0] in;
	input clk;
	output [4:0] out;
	reg [4:0] out;
	initial begin
		out=21;
	end
	always@(posedge clk)
	begin
		out=in;
	end
	always@(negedge clk )
	begin
		$display("PC = %d",out);
	end
endmodule
