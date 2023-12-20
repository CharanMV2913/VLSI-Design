module Add(input add_en,input wire [31:0]rs1_data ,input wire [31:0]rs2_data,output reg [31:0] add_rd_data);
always @(*) begin
if(add_en == 1)
	begin
	 add_rd_data <= rs1_data + rs2_data;
	end
end
endmodule

module sub(input sub_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0] sub_rd_data);
always @(*) begin
if(sub_en == 1)
	begin
	 sub_rd_data <= rs1_data - rs2_data;
	end
end
endmodule

module Xor(input xor_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]Xor_rd_data);
always @(*) begin
if(xor_en == 1)
	begin
	 Xor_rd_data <= rs1_data ^ rs2_data;
	end
end
endmodule

module Or(input or_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0] Or_rd_data);
always @(*) begin
if(or_en == 1)
	begin
	 Or_rd_data <= rs1_data | rs2_data;
	end
end
endmodule

module And(input and_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0] And_rd_data);
always @(*) begin
if(and_en == 1)
	begin
	 And_rd_data <= rs1_data & rs2_data;
	end
end
endmodule

//////////////////////////////////////////////////////////////////////////////
module sll(input sll_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]sll_rd_data);
always @(*) begin
if(sll_en == 1)
	begin
	 sll_rd_data <= rs1_data << rs2_data;
	end
end
endmodule


module sltu(input sltu_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]sltu_rd_data);
always @(*) begin
if(sltu_en == 1)
	begin
	 sltu_rd_data <= (rs1_data < rs2_data) ? 1:0;
	end
end
endmodule

module srl(input srl_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]srl_rd_data);
always @(*) begin
if(srl_en == 1)
	begin
	srl_rd_data <= rs1_data >> rs2_data;
	end
end
endmodule

module sra(input sra_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]sra_rd_data);
always @(*) begin
if(sra_en == 1)
	begin
	 sra_rd_data <= (rs1_data >> rs2_data);
	end
end
endmodule

///////////////////////////////////////////////////////////////////////////////
module slt(input slt_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]slt_rd_data);
wire [1:0] case_data;
assign case_data ={rs1_data[31],rs2_data[31]};
always @(*) begin
if(slt_en == 1)
	begin
		case(case_data)
			2'b00:begin
				slt_rd_data <= rs1_data < rs2_data ? 1:0;
			      end
			2'b01:begin
				slt_rd_data <= 32'b0;	
			      end
			2'b10:begin
				slt_rd_data <= 32'b1;
			      end
			2'b11:begin
				slt_rd_data <= rs1_data > rs2_data ? 1:0;
			      end
		endcase
	end
end
endmodule
///////////////////////////////////////////////////////////////////
