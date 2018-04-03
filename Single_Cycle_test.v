`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:17:52 11/10/2017
// Design Name:   CPU_SINGLE_CYCLE
// Module Name:   C:/Users/DEEPAK/Downloads/assignment_3/Single_Cycle_test.v
// Project Name:  assignment_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU_SINGLE_CYCLE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Single_Cycle_test;

	// Inputs
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	CPU_SINGLE_CYCLE uut (
		.clk(clk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		$dumpfile("dump.vcd");
		$dumpvars;
		// Wait 100 ns for global reset to finish
		#100;
      #500 $finish; 
		// Add stimulus here
	end
	always #10 clk=~clk;
      
endmodule

