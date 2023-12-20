module RiscV(input [31:0] instruction,input clk , input rst); // write en,read en and write data should be given manually


wire [4:0] rs1_addr;
wire [4:0] rs2_addr;
wire [4:0] rd_addr;

wire sub_en,sra_en,subw_en,sraw_en,add_en,sll_en,slt_en,sltu_en,xor_en,srl_en,or_en,and_en;

wire [31:0] rs1_data;
wire [31:0] rs2_data;

wire [31:0] rd_data_w;
wire read_en;
wire write_en;

	wire[31:0]add_rd_data; 
	wire[31:0]sub_rd_data;
	wire[31:0]sra_rd_data;
	wire[31:0]sll_rd_data;
	wire[31:0]slt_rd_data;
	wire[31:0]sltu_rd_data;
	wire[31:0]Xor_rd_data;
	wire[31:0]srl_rd_data;
	wire[31:0]Or_rd_data;
	wire[31:0]And_rd_data;




decoder d1(.instruction(instruction),.clk(clk),.rs1_addr(rs1_addr),.rs2_addr(rs2_addr),.rd_addr(rd_addr),.sub_en(sub_en),.sra_en(sra_en),.subw_en(subw_en),.sraw_en(sraw_en),.add_en(add_en),.sll_en(sll_en),.slt_en(slt_en),.sltu_en(sltu_en),.xor_en(xor_en),.srl_en(srl_en),.or_en(or_en),.and_en(and_en),/*.opcode(opcode),.fun3(fun3),.fun7(fun7),*/.read_en(read_en),.write_en(write_en));


Memory Mem (.clk(clk),.rst(rst),.read_en(read_en),.rs1_addr(rs1_addr),.rs2_addr(rs2_addr),.write_en(write_en),.write_addr(rd_addr),.write_data(rd_data_w),.rs1_data(rs1_data),.rs2_data(rs2_data));

ALUmux alumux(.add_en(add_en),.sub_en(sub_en),.sra_en(sra_en),.sll_en(sll_en),.slt_en(slt_en),.sltu_en(sltu_en),.xor_en(xor_en),.srl_en(srl_en),
		.or_en(or_en),.and_en(and_en),.rs1_data(rs1_data),.rs2_data(rs2_data),
		.add_rd_data(add_rd_data), 
		.sub_rd_data(sub_rd_data),
		.sra_rd_data(sra_rd_data),
		.sll_rd_data(sll_rd_data),
		.slt_rd_data(slt_rd_data),
		.sltu_rd_data(sltu_rd_data),
		.Xor_rd_data(Xor_rd_data),
		.srl_rd_data(srl_rd_data),
		.Or_rd_data(Or_rd_data),
		.And_rd_data(And_rd_data));

multiplexer Muxmodule(.add_en(add_en),.sub_en(sub_en),.sra_en(sra_en),.sll_en(sll_en),.slt_en(slt_en),.sltu_en(sltu_en),.xor_en(xor_en),.srl_en(srl_en),
		.or_en(or_en),.and_en(and_en),.rs1_data(rs1_data),.rs2_data(rs2_data),
		.add_rd_data(add_rd_data), 
		.sub_rd_data(sub_rd_data),
		.sra_rd_data(sra_rd_data),
		.sll_rd_data(sll_rd_data),
		.slt_rd_data(slt_rd_data),
		.sltu_rd_data(sltu_rd_data),
		.Xor_rd_data(Xor_rd_data),
		.srl_rd_data(srl_rd_data),
		.Or_rd_data(Or_rd_data),
		.And_rd_data(And_rd_data),
		.rd_data(rd_data_w));

endmodule
