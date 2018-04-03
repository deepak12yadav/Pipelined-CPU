`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:27:50 11/10/2017 
// Design Name: 
// Module Name:    CONTROLLER 
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
module CONTROLLER(in,X_PC,branch,un_conditional,push,sp_new,call,reg_wr,alu,fn,call_ret);
	input [15:8] in;
	output [2:0] fn;
	output X_PC,branch,un_conditional,push,sp_new,call,reg_wr,alu,call_ret;
	wire non_label,in15,in14,in13,in12,in10,in9,in8,non_label1,call1,pop,ret,add,neg,or_,not_;
	and and0(non_label,in[15],in[14],in[13],in[12]);	//non label
	not n0(in15,in[15]);
	not n1(in14,in[14]);
	not n2(in13,in[13]);
	not n3(in12,in[12]);
	not n6(in11,in[11]);
	not n7(in10,in[10]);
	not n8(in9,in[9]);
	not n9(in8,in[8]);
	and ans1(un_conditional,in15,in13,in14,in[12]); //un_conditional
	and call_(call,in[15],in14,in[13],in12); //call	//data_mem_in_pc
	not n4(non_label1,non_label);
	not n5(call1,call);
	and and2(branch,non_label1,call1);//branch	Y_LABEL
	and and3(push,non_label,in11,in10);	//push	mem_wr
	and and4(pop,non_label,in11,in[10]);	//pop
	and and5(ret,non_label,in[11],in[10]);	//ret
	and and6(alu,non_label,in[11],in10);	//alu	//alu_status
	and and4_(add,alu,in9,in8);	//add
	and and4__(neg,alu,in9,in[8]);	//neg
	and and4___(or_,alu,in[9],in8);	//or_
	and and4____(not_,alu,in[9],in[8]);	//not_
	or or4(X_PC,ret,branch,call);	//X_PC
	or or5(sp_new,push,call);	//sp_new	// sp_minus
	or or6(reg_wr,alu,pop);	//reg_wr
	
	or or7(fn[0],add,neg,not_,call,branch);
	or or8(fn[1],neg,pop,ret);
	or or9(fn[2],or_,not_,pop);
	or or10(call_ret,call,ret);
endmodule
