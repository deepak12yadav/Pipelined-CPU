`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:55:57 11/10/2017 
// Design Name: 
// Module Name:    INS_MEM 
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
module INS_MEM(in,out);
	input [4:0] in;
	output [15:0] out;
	//reg [2:0] out;
	reg [15:0] memory[31:0];
	integer i;
	initial begin
			for(i=0;i<32;i=i+1)
			begin
				memory[i]=16'b0;
			end
			//main
			memory[21]=16'b1111010000000000; //pop r0
			memory[22]=16'b1111010000100000;	//pop r1
			memory[23]=16'b1010000000000001;	//call to 25
			memory[24]=16'b0001000000000011;	// branch to 28
			
			//func
			memory[25]=16'b1111000000100000; //push r1
			memory[26]=16'b1111100000000000;	//add r0
			memory[27]=16'b1111110000000000;	// ret
			
			//left instructions
			memory[28]=16'b1111100100100000;	//neg r1
			memory[29]=16'b1111000000100000; //push r1
			memory[30]=16'b1111100000000000; //add r0
			memory[31]=16'b1111000000000000; //push r0
	end
	
	assign out = memory[in];

endmodule
