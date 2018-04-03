`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:51:24 11/10/2017 
// Design Name: 
// Module Name:    DATA_MEM 
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
module DATA_MEM(in,address,out,wr,clk);
	input [4:0] address;
	input clk,wr;
	input [15:0] in;
	output [15:0] out;
	reg [15:0] memory[31:0];
	integer i;
	initial begin
			for(i=0;i<32;i=i+1)
			begin
				memory[i]=16'b0;
			end
			memory[0]=3;
			memory[1]=1;
			memory[2]=3;
	end
	
	assign out = memory[address];
	always@(posedge clk)
	begin
		if(wr)
			memory[address]=in;
	end
	
	always@(negedge clk )
	begin
		$display("memory[%h] = %d",0,memory[0]);
		$display("memory[%h] = %d",1,memory[1]);
		$display("memory[%h] = %d\n\n",2,memory[2]);
	end
	
endmodule
