`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:01 06/26/2021 
// Design Name: 
// Module Name:    MEM 
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
module MEM(
		input [31:0] target,
		input equal,
		input [31:0] alu_res_in,
		input [31:0] val2,
		input [31:0] des_in,
		input signal_mem_read,
		input signal_mem_write,
		input write_back,
		input branch,
		output write_back_res,
		output [31:0] memory_data,
		output [31:0] alu_res_out,
		output [31:0] des_out,
		output [31:0] resultMuxFromMem,
		output [31:0] targetAddress
    );
	 
	 assign des_out=des_in;
	 assign alu_res_out=alu_res_in;
	 assign write_back_res=write_back;
	 assign targetAddress=target;
	 //instance
	 Branch_And Branch(branch,equal,resultMuxFromMem);
	 Data_Mem DataMemory(alu_res_in,val2,signal_mem_read,signal_mem_write,memory_data);


endmodule
