`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:55 06/26/2021 
// Design Name: 
// Module Name:    Instruction_Mem 
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
module Instruction_Mem(
    input      [15:0]  pc, 
    output reg   [31:0]  instruction
    );
	reg [31:0] instructions[0:16];
	
	initial begin 
		$readmemb("instructions.mem", instructions);
	end
	
	always @ (pc) begin
		instruction = instructions[pc];
	end

endmodule
