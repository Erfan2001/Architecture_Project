`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:38 06/26/2021 
// Design Name: 
// Module Name:    WB 
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
module WB(
		input [31:0] memoryData,
		input [31:0] alu_res,
		input [31:0] des_in,
		input register_write,
		output [31:0] des_out,
		output [4:0] write_reg
    );
		assign des_out=des_in;
		//instance
		Write_Mux WriteReg(memoryData,alu_res,register_write,write_reg);

endmodule
