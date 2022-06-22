`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:40 06/26/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(a,b,opcode,out);
	input [31:0]a;
	input [31:0]b;
	input [2:0]opcode;
	output reg[31:0]out = 0;
		parameter [2:0]AND = 3'b011 ,
							OR = 3'b100 ,
							SUB = 3'b001 ,
							ADD = 3'b000 , 
							MUL = 3'b010 ;
							
	always @(*)
	begin
	case(opcode)
		AND : out = a &b;
		OR : out = a | b;
		SUB : out = a - b;
		ADD : out = a + b;
		MUL : out = a * b;
	endcase
	end


endmodule

