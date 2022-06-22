`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:36 06/26/2021 
// Design Name: 
// Module Name:    Hazard_Detect 
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
module Hazard_Detect(
		input wire [0:2] src,
		input wire [0:2] des,
		output reg [1:0] hazard=0
    );
	always @(*)
		begin	
			if(~((src[0] ^ des[0]) | (src[1] ^ des[1]) | (src[2] ^ des[2])))
				assign hazard=1;
		end

endmodule
