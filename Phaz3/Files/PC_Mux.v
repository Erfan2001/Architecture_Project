`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:33 06/26/2021 
// Design Name: 
// Module Name:    PC_Mux 
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
module PC_Mux(
		input [31:0] reg1,
		input [31:0] reg2,
		input selector,
		output reg [31:0] result
    );

	always@(*)
		begin
			if(selector==0)
				result=reg2;
			else
				result=reg1;
		end

endmodule
