`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:02 06/26/2021 
// Design Name: 
// Module Name:    Branch_And 
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
module Branch_And(
		input zero_base,
		input branch,
		output resultMuxFromMem
    );
		assign resultMuxFromMem=zero_base & branch;
endmodule
