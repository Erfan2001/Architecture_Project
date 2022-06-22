`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:54:09 06/27/2021 
// Design Name: 
// Module Name:    MUX 
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
module MUX
#(parameter BUS_WIDTH = 32)(
		input [BUS_WIDTH-1:0] A,
		input [BUS_WIDTH-1:0] B,
		input [BUS_WIDTH-1:0] C,
		input [1:0] cntl,
		output reg [BUS_WIDTH-1:0] MUXOut
		);

always @(*)
begin
	case(cntl)
		2'b00 : MUXOut <= A;
		2'b01 : MUXOut <= B;
		2'b10 : MUXOut <= C;
		default : MUXOut <= {BUS_WIDTH{1'b0}};
	endcase
end
endmodule : MUX