`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:11:03 06/27/2021 
// Design Name: 
// Module Name:    ForwardingUnit 
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
module ForwardingUnit(
		input [4:0] rs_ID,
		input [4:0] rt_ID,
		input [4:0] rs_EX,
		input [4:0] rt_EX,
		input [4:0] writeRegAddress_MEM,
		input [4:0] writeRegAddress_WB,
		input regWrite_MEM_Signal,
		input regWrite_WB_Signal,
		output reg readData1Sel_ID,
		output reg readData2Sel_ID,
		output reg [1:0] readData1Sel_EX,
		output reg [1:0] readData2Sel_EX
    );
	 
	always @(rs_ID,rt_ID,rs_EX,rt_EX,writeRegAddress_MEM,writeRegAddress_WB,regWrite_MEM_Signal,regWrite_WB_Signal) begin
		
		if (rs_EX == writeRegAddress_MEM && regWrite_MEM_Signal == 1) 
			begin
				readData1Sel_EX <= 1;
			end 
		else if (rs_EX == writeRegAddress_WB && regWrite_WB_Signal == 1) 
			begin
				readData1Sel_EX <= 2;
			end
		else 
			begin
				readData1Sel_EX <= 0;
			end
		
		if (rt_EX == writeRegAddress_MEM && regWrite_MEM_Signal == 1) 
			begin
				readData2Sel_EX <= 1;
			end
		else if (rt_EX == writeRegAddress_WB && regWrite_WB_Signal == 1) 
			begin
				readData2Sel_EX <= 2;
			end 
		else 
			begin
				readData2Sel_EX <= 0;
			end
		
		if (rs_ID == writeRegAddress_WB && regWrite_WB_Signal == 1) 
			begin
				readData1Sel_ID <= 1;
			end
		else 
			begin
				readData1Sel_ID <= 0;
			end
		
		if (rt_ID == writeRegAddress_WB && regWrite_WB_Signal == 1)
			begin
				readData2Sel_ID <= 1;
			end
		else 
			begin
				readData2Sel_ID <= 0;
			end
	end
	

endmodule
