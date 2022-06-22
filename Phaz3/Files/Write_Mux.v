`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:19 06/26/2021 
// Design Name: 
// Module Name:    Write_Mux 
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
module Write_Mux(
		input [31:0] memory_data,
		input [31:0] alu_res,
		input selector,
		output reg [4:0] write_reg
    );
	 
	 always@(*)
		begin
			if(selector==0)
				write_reg=memory_data;
			else
				write_reg=alu_res;
		end


endmodule
