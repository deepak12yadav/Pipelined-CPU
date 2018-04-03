`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:34:11 11/10/2017 
// Design Name: 
// Module Name:    REG_BANK 
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
module REG_BANK(rd_addr,wr_addr,in,out,clk,wr);
	input[2:0] rd_addr,wr_addr;
	input [15:0] in;
	output [15:0] out;
	input clk,wr;
	reg [15:0] register[7:0];
	integer i;
	initial begin
			for(i=0;i<8;i=i+1)
			begin
				register[i]=16'b0;
			end
	end
	assign out=register[rd_addr];
	
	always@(posedge clk)
	begin
		if(wr)
			register[wr_addr]=in;
	end

	always@(negedge clk )
	begin
		$display("r0 = %d",register[0]);
		$display("r1 = %d",register[1]);
	end
	
endmodule
