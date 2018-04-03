`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:06:41 11/10/2017 
// Design Name: 
// Module Name:    CPU_SINGLE_CYCLE 
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
module CPU_SINGLE_CYCLE(clk,out);
	output [15:0] out;
	input clk;
	wire X_PC,branch,un_conditional,push,sp_new,call,reg_wr,alu,call_ret;
	wire [2:0]fn;
	wire [15:0] X,Y,Z,_data_mem,_reg_bank,IR,_data_in;
	wire C1out,CC,_branch_out,cout,sout,vout,zout;
	wire [4:0] _pc,_address_in,_pc_in,_pc_alu,_sp_new,_sp_old;
	assign out=Z;
	CONTROLLER r0(IR[15:8],X_PC,branch,un_conditional,push,sp_new,call,reg_wr,alu,fn,call_ret);
	ALU r1(X,Y,Z,fn,C1out);
	ALU_X_MUX r2({11'b0,_pc_alu},_data_mem,X,X_PC);
	ALU_Y_MUX r3({4'b0,IR[11:0]},_reg_bank,Y,(branch|call));
	BRANCH_MUX r4(CC,_branch_out,un_conditional);
	DATA_MEM r5(_data_in,_address_in,_data_mem,(push|call),clk);
	DATA_MEM_ADD_MUX r6(_sp_new,_sp_old,_address_in,sp_new);
	DATA_MEM_IN_MUX r7({11'b0,_pc_alu},_reg_bank,_data_in,call);
	INS_MEM r8(_pc,IR);
	PC_ALU r9(_pc,_pc_alu);
	PC_REG r10(_pc_in,clk,_pc);
	PC_UPDATE_MUX r11(_pc_alu,Z[4:0],_pc_in,branch,call_ret,_branch_out);
	REG_BANK r12(IR[7:5],IR[7:5],Z,_reg_bank,clk,reg_wr);
	SP_ALU r13(_sp_old,_sp_new,sp_new,branch);
	SP_REG r14(_sp_new,clk,_sp_old);
	STATUS_DETECTOR r15(Z,C1out,cout,sout,vout,zout);
	STATUS_SELECTION r16(vout, cout, zout, sout, IR[15:12], alu, CC, clk);
endmodule
