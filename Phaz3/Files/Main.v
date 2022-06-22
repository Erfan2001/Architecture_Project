`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:43:23 06/27/2021 
// Design Name: 
// Module Name:    Main 
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
module Main(
		input clk,
		input reset
    );
	 //additional Registers
	reg[31:0] PC = 32'b0;
	
	wire [31:0] instruction;
	wire [5:0] funct;
	wire [4:0] rs, rt, rd, shamt;
	wire [25:0] address;
	wire [15:0] immediate;
	wire [5:0] opcode;
	
	wire regDes,regWrite,aluSrc,memToReg,memWrite,memRead,extOp,branch,jump;
	
	wire [31:0] write_data, rs_content, rt_content, memory_read_data;
	
	wire [31:0] resultMuxFromMem;
	wire [31:0] res_adder;
	wire [4:0] write_reg;
	wire [31:0] immediate_ext;
	wire [31:0] target;
	wire equal;
	wire [31:0] alu_res;
	wire [31:0] destination;
	wire [31:0] targetJump;
	//instamces
	IF Instruction_Fetch(PC,clk,resultMuxFromMem,res_adder,instruction);
	ID Instruction_Decode(PC,instruction,write_reg,write_data,regWrite,clk,PC,rs,rt,immediate_ext,rt,rd,targetJump,memToReg,memWrite,aluSrc,regDes,regWrite,extOp,branch);
	wire func={instruction[31],instruction[30],instruction[29],instruction[28],instruction[27],instruction[26]};
	EXE Execution(reset,clk,rs,rt,immediate_ext,alu_res,rt,immediate_ext,rd,destination,rs,rt,rs,rt,immediate_ext,PC,PC,func,func,alu_res,write_reg,alu_res,rt,branch,memRead,memWrite,jump,branch,memRead,memWrite,jump);
	MEM Memory(target,equal,alu_res,rt,destination,memRead,memWrite,regWrite,branch,regWrite,memory_read_data,alu_res,rd,resultMuxFromMem,target);
	WB WriteBack(memory_read_data,alu_res,regWrite,write_data,write_reg);
	
	//Clock
		always @(posedge clk)
	       begin 
					if(jump)  //Jump
						PC=targetJump;
					else if(branch)  //Branch
						PC=PC+4+target;
					else       //Default
						PC = PC+4;
	       end 
endmodule
