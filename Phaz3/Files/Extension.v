`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:32 06/23/2021 
// Design Name: 
// Module Name:    Extension 
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
module Extension(
		input [15:0] imm,
		input  ExtOp,
		output reg [31:0] ext
    );
	 always @(*)
		begin
			if(ExtOp)
				begin
					assign ext={{16{imm[15]}},imm};
				end
			else
				begin
					assign ext=imm;
				end
		end	
endmodule
