module ALUmux(	input wire  sub_en,
		input wire  sra_en,
		input wire  add_en,
		input wire  sll_en,
		input wire  slt_en,
		input wire  sltu_en,
		input wire  xor_en,
		input wire  srl_en,
		input wire  or_en,
		input wire  and_en ,

	input wire [31:0]rs1_data,
	input wire [31:0]rs2_data,

	output [31:0]add_rd_data, 
	output [31:0]sub_rd_data,
	output [31:0]sra_rd_data,
	output [31:0]sll_rd_data,
	output [31:0]slt_rd_data,
	output [31:0]sltu_rd_data,
	output [31:0]Xor_rd_data,
	output [31:0]srl_rd_data,
	output [31:0]Or_rd_data,
	output [31:0]And_rd_data);



Add add_inst(.add_en(add_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.add_rd_data(add_rd_data));
sub sub_inst(.sub_en(sub_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.sub_rd_data(sub_rd_data));
sra sra_inst(.sra_en(sra_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.sra_rd_data(sra_rd_data));
sll sll_inst(.sll_en(sll_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.sll_rd_data(sll_rd_data));
slt slt_inst(.slt_en(slt_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.slt_rd_data(slt_rd_data));
sltu sltu_inst(.sltu_en(sltu_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.sltu_rd_data(sltu_rd_data));
Xor xor_inst(.xor_en(xor_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.Xor_rd_data(Xor_rd_data));
srl srl_inst(.srl_en(srl_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.srl_rd_data(srl_rd_data));
Or or_inst(.or_en(or_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.Or_rd_data(Or_rd_data));
And and_inst(.and_en(and_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.And_rd_data(And_rd_data));



endmodule 


module multiplexer(
		input wire  sub_en,
		input wire  sra_en,
		input wire  add_en,
		input wire  sll_en,
		input wire  slt_en,
		input wire  sltu_en,
		input wire  xor_en,
		input wire  srl_en,
		input wire  or_en,
		input wire  and_en ,

	input wire [31:0]rs1_data,
	input wire [31:0]rs2_data,

	input wire [31:0]add_rd_data, 
	input wire [31:0]sub_rd_data,
	input wire [31:0]sra_rd_data,
	input wire [31:0]sll_rd_data,
	input wire [31:0]slt_rd_data,
	input wire [31:0]sltu_rd_data,
	input wire [31:0]Xor_rd_data,
	input wire [31:0]srl_rd_data,
	input wire [31:0]Or_rd_data,
	input wire [31:0]And_rd_data,
	
	output reg [31:0] rd_data);
	
ALUmux ALU1(  	  .sub_en(sub_en),
		  .sra_en(sra_en),
		  .add_en(add_en),
		  .sll_en(sll_en),
		  .slt_en(slt_en),
		  .sltu_en(sltu_en),
		  .xor_en(xor_en),
		  .srl_en(srl_en),
		  .or_en(or_en),
		  .and_en(and_en ),

		 .rs1_data(rs1_data),
		 .rs2_data(rs2_data),

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


	always @(*)
	begin
		if(add_en)
			begin
			rd_data <= add_rd_data;
			end
		else if(sub_en)
			begin
			rd_data <= sub_rd_data;
			end
		else if(sra_en)
			begin
			rd_data <= sra_rd_data;
			end
		else if(sll_en)
			begin
			rd_data <= sll_rd_data;
			end
		else if(slt_en)
			begin
			rd_data <= slt_rd_data;
			end
		else if(sltu_en)
			begin
			rd_data <= sltu_rd_data;
			end
		else if(xor_en)
			begin
			rd_data <=Xor_rd_data;
			end
		else if(srl_en)
			begin
			rd_data <= srl_rd_data;
			end
		else if(or_en)
			begin
			rd_data <= Or_rd_data;
			end
		else if(and_en)
			begin
			rd_data <= And_rd_data;
			end
		else
			begin
			rd_data <= 32'b0;
			end

	end


endmodule
