`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:11 06/26/2021 
// Design Name: 
// Module Name:    PC 
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
module PC(
		input [31:0] pc,
		input clk,
		output reg [31:0] pc_res
    );
	 
	 always @(posedge clk)
		begin
			assign pc_res=pc;
		end
		

endmodule
