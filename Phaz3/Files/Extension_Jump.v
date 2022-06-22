`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:55:16 06/27/2021 
// Design Name: 
// Module Name:    Extension_Jump 
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
module Extension_Jump(
		input [25:0] target,
		output reg [31:0] ext_jump
    );
	 always @(*)
		begin
			assign ext_jump=target;
		end
endmodule
