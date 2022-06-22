`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:13 06/26/2021 
// Design Name: 
// Module Name:    Data_Mem 
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
module Data_Mem(
		input  [31:0] address,
		input  [31:0] write_data,
		input signal_mem_read,
		input signal_mem_write,
		output reg [31:0] read_data
    );
	 
	reg [31:0] data_mem [255:0];
	
	initial begin
		$readmemb("dataMemory.mem", data_mem);
	end
	
		always @(address) 
			begin
				if(signal_mem_write) 
					begin
						data_mem[address] = write_data;
						$writememb("dataMemory.mem", data_mem);
					end
			end
		
		always @(address) 
			begin
				if(signal_mem_read) 
					begin
						read_data = data_mem[address];
					end
			end

endmodule
