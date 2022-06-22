`timescale 1ns / 1ps
module CTR_Unit(
		input wire [5:0] Opcode, 
               output reg MemtoReg,
               output reg  MemWrite,
               output reg  ALUSrc,
               output reg  RegDst,
               output reg  RegWrite,
					output reg 	ExtOp,
					output reg  Branch
    );
					reg [1:0] Rtype;
					reg [1:0] ori;
					reg [1:0] addi;
					reg [1:0] muli;
					reg [1:0] divi;
					reg [1:0] sw;
					reg [1:0] lw;
					reg [1:0] beq;
					initial Rtype = 1'b0;
					initial ori = 1'b0;
					initial addi = 1'b0;
					initial muli = 1'b0;
					initial divi = 1'b0;
					initial sw = 1'b0;
					initial lw = 1'b0;
					initial beq = 1'b0;
	
	always @(Opcode)
		begin 
                         
            if (~Opcode[0] & ~Opcode[1] & ~Opcode[2]) // R-type
						assign Rtype = 1;
						
				if (~Opcode[0] & ~Opcode[1] & Opcode[2]) //Ori
						assign ori = 1;
						
				if (~Opcode[0] & Opcode[1] & ~Opcode[2])  //Addi
						assign addi = 1;
						
				if (~Opcode[0] & Opcode[1] & Opcode[2])  //Muli
						assign muli = 1;
						
				if (Opcode[0] & ~Opcode[1] & ~Opcode[2])  //Divi
						assign divi = 1;
						
				if (Opcode[0] & ~Opcode[1] & Opcode[2]) //Sw
						assign sw = 1;
						
				if (Opcode[0] & Opcode[1] & ~Opcode[2])  //Lw
						assign lw = 1;
						
				if (Opcode[0] & Opcode[1] & Opcode[2]) //Beq
						assign beq = 1;
				if(Opcode[0] & Opcode[1] & ~Opcode[2] & ~Opcode[3] & ~Opcode[4] & ~Opcode[5])
						Branch=1;
		  end
		  
	always@(*)
		begin
			RegDst=Rtype | 0;
			RegWrite=Rtype | ori | addi | muli | divi | lw;
			ALUSrc=ori | addi | muli | divi | lw | sw;
			MemtoReg=lw;
			MemWrite=sw;
			ExtOp=sw| lw;
			Branch=beq;
		end
endmodule
