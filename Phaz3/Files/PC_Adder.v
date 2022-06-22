`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:07:42 06/26/2021 
// Design Name: 
// Module Name:    PC_Adder 
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
module PC_Adder(
		input [31:0] pc,
		output reg [31:0] pc_res
    );
	 always@(*)
		begin
			pc_res=pc+4;
		end


endmodule
