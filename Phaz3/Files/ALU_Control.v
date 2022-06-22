`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:35:51 06/25/2021 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(
		input [5:0] func,
		input wire [5:0] Opcode,
		output reg [2:0] aluOp
    );
	wire [2:0] opcode2=Opcode;
	wire [2:0] func2=func;
	reg [2:0] result;
		always@(Opcode,func)
			begin
		if(~Opcode[0] & ~Opcode[1] & ~Opcode[2])
				assign result=func2;
		else
				assign result=opcode2;
			end
		always@(*)
			begin
				
			if(result==3'b001)
				assign aluOp=3'b001;
				
			if(result==3'b010)
				assign aluOp=3'b010;
				
			if(result==3'b011)
				assign aluOp=3'b100;
				
			if(result==3'b100)
				assign aluOp=3'b101;
				
			if(result==3'b101)
				assign aluOp=3'b010;
				
			if(result==3'b110)
				assign aluOp=3'b010;
				
			if(result==3'b111)
				assign aluOp=3'b011;
			end

endmodule
