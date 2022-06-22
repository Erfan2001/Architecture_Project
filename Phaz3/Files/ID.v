`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:33 06/26/2021 
// Design Name: 
// Module Name:    ID 
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
module ID(
		input [31:0] pc_in,
		input [31:0] instruction,
		input [4:0] write_reg,
		input [31:0] write_data,
		input reg_write,
		input clk,
		output [31:0] pc_out,
		output [31:0] valA,
		output [31:0] valB,
		output [31:0] imm_ext,
		output [31:0] rt,
		output [31:0] rd,
		output [31:0] targetJump,
		output reg  MemtoReg,
      output reg  MemWrite,
      output reg  ALUSrc,
      output reg  RegDst,
      output reg  RegWrite,
		output reg 	ExtOp,
		output reg  Branch
    );
	 

		
		wire [5:0] opcode= {instruction[5],instruction[4],instruction[3],instruction[2],instruction[1],instruction[0]};
		wire [4:0] regA={instruction[10],instruction[9],instruction[8],instruction[7],instruction[6]};
		wire [4:0] regB={instruction[15],instruction[14],instruction[13],instruction[12],instruction[11]};
		wire [4:0] regC={instruction[18],instruction[17],instruction[16],instruction[15],instruction[14]};
		wire [5:0] func={instruction[31],instruction[30],instruction[29],instruction[28],instruction[27],instruction[26]};
		wire [15:0] imm={instruction[31],instruction[30],instruction[29],instruction[28],instruction[27],instruction[26],
							  instruction[25],instruction[24],instruction[23],instruction[22],instruction[21],instruction[20],
							  instruction[19],instruction[18],instruction[17],instruction[16]
		                 };
		wire [25:0] targetAddress={instruction[31],instruction[30],instruction[29],instruction[28],instruction[27],instruction[26],
								  instruction[25],instruction[24],instruction[23],instruction[22],instruction[21],instruction[20],
							     instruction[19],instruction[18],instruction[17],instruction[16],instruction[15],instruction[14],
								  instruction[13],instruction[12],instruction[11],instruction[10],instruction[9],instruction[8],
								  instruction[7],instruction[6]
									};
							  
		assign pc_out=pc_in;
		assign rt=regB;
		assign rd=regC;
		
	//instance
	
	CTR_Unit ControlUnit(opcode,MemtoReg,MemWrite,ALUSrc,RegDst,RegWrite,ExtOp,Branch);
	
	Reg_File RegisterFile(regA,regB,valA,valB,reg_write,write_reg,write_data,clk);
	
	Extension Ext(imm,ExtOp,imm_ext);
	
	Extension_Jump ExtJump(targetAddress,targetJump);

endmodule
