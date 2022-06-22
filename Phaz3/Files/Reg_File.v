`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:36:12 06/25/2021 
// Design Name: 
// Module Name:    Reg_File 
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
module Reg_File(ReadRegister1, ReadRegister2, ReadData1, ReadData2, RegWrite , WriteRegister, WriteData,clk);
	input [4:0] ReadRegister1,ReadRegister2,WriteRegister;
	input [31:0] WriteData;
	input RegWrite,clk;
	
	output reg [31:0] ReadData1,ReadData2;
	
	reg [31:0] Register [0:31];
	
	///////////////////////////
	initial begin
	Register[0] = 32'b0;
	Register[1] = 32'b0;
	Register[2] = 32'b0;
	Register[3] = 32'b0;
	Register[4] = 32'b0;
	Register[5] = 32'b0;
	Register[6] = 32'b0;
	Register[7] = 32'b0;
	
	end
	///////////////////////////
	
	always @(posedge clk)
	begin
		if(RegWrite == 1)
			begin
			Register[WriteRegister] <= WriteData;
			end
	end

	always @(negedge clk)
	begin
		ReadData1 <= Register[ReadRegister1];
		ReadData2 <= Register[ReadRegister2];
	end
endmodule
