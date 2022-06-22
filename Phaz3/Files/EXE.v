`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:52:26 06/27/2021 
// Design Name: 
// Module Name:    EXE 
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
module EXE(clk , reset , RegData1_in , RegData2_in , SignExtend_in ,RegData1_out , RegData2_out , SignExtend_out , RegDst_in , RegDst_out , 
				RegisterRs_in , RegisterRt_in , RegisterRs_out , RegisterRt_out , JumpAdder_in , PcPlus4_in , PcPlus4_out ,
				func_in , func_out, AluSrc_out , RegWrite_in, MemtoReg_in , RegWrite_out
				,Branch_in, MemRead_in, MemWrite_in, Jump_in , Branch_out, MemRead_out, MemWrite_out, Jump_out);
				
				
				input clk , reset;
				input [31:0] RegData1_in , RegData2_in;
				input [31:0] SignExtend_in;
				input RegDst_in;
				input [4:0] RegisterRs_in , RegisterRt_in;
				input [31:0] JumpAdder_in , PcPlus4_in;
				input [5:0] func_in;
				input RegWrite_in, MemtoReg_in;
				input Branch_in, MemRead_in, MemWrite_in, Jump_in;
				output Branch_out, MemRead_out, MemWrite_out, Jump_out;
				output [31:0] RegData1_out , RegData2_out;
				output [31:0] SignExtend_out;
				output RegDst_out;
				output RegisterRs_out , RegisterRt_out;
				output [31:0] PcPlus4_out;
				output [4:0] func_out;
				output AluSrc_out;
				output RegWrite_out;
				
				reg RegWrite_out;
				reg MemRead_out, MemWrite_out, Jump_out ,Branch_out;
				reg RegDst_out, AluSrc_out;
				reg [2:0] AluOp_out;
				reg [31:0] JumpAdder_out , PcPlus4_out;
				reg [31:0] RegData1_out , RegData2_out, SignExtend_out;
				reg [4:0] RegisterRs_out, RegisterRt_out;
				reg [5:0] func_out;
				
				//instances
				ALU alu_1(RegData1_in , RegData2_in , AluOp_in , RegData1_out , RegData2_out);
				ALU_Control alu_ctr(func_in , AluOp_in);
				Slt2 slt2_jump(SignExtend_in , JumpAdder_out);
				MUX mux_all(RegData1_in , RegData2_in , RegWrite_in);
				
				always @(posedge clk or posedge reset)
		begin
		if (reset == 1'b1)
		begin
			RegWrite_out = 1'b0;
			Branch_out = 1'b0;
			MemRead_out = 1'b0;
			MemWrite_out = 1'b0;
			Jump_out = 1'b0;
			RegDst_out = 1'b0;
			AluSrc_out = 1'b0;
			AluOp_out = 2'b0;
			JumpAdder_out = 32'b0;
			PcPlus4_out = 32'b0;
			RegData1_out = 32'b0;
			RegData2_out = 32'b0;
			SignExtend_out = 32'b0;
			RegisterRs_out = 5'b0;
			RegisterRs_out = 5'b0;
			func_out = 6'b0;			
		end
		else begin
			RegWrite_out = RegWrite_in;
			Branch_out = Branch_in;
			MemRead_out = MemRead_in;
			MemWrite_out = MemWrite_in;
			Jump_out = Jump_in;
			RegDst_out = RegDst_in;
			AluOp_out = AluOp_in;
			JumpAdder_out = JumpAdder_in;
			PcPlus4_out = PcPlus4_out;
			RegData1_out = RegData1_in;
			RegData1_out = RegData1_in;
			SignExtend_out = SignExtend_in;
			RegisterRs_out = RegisterRs_in;
			RegisterRt_out = RegisterRt_in;
			func_out = func_in;
		end	
		
	end	

endmodule

