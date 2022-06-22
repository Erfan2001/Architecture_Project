`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:35:51 06/26/2021 
// Design Name: 
// Module Name:    IF 
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
module IF(
		input pc_src,
		input clk,
		input [31:0] resultMuxFromMem,
		output reg [31:0] res_adder,
		output reg [31:0] instruction
    );

	wire [31:0] pc;
	wire [31:0] pc_res;
	
	//instances 
	
	PC program_counter(pc,clk,pc_res);
	PC_Adder programCounter_Adder(pc_res,res_adder);
	PC_Mux programCounter_Mux(resultMuxFromMem,res_adder,pc_src,pc);
	Instruction_Mem instructionMemory(pc,instruction);
endmodule
