
module ALUmux_tb;

reg [31:0]rs1_data;
reg [31:0]rs2_data;

wire [31:0]rd_data;

reg add_en;
reg sub_en;
reg xor_en;
reg or_en;
reg and_en;


reg sll_en;
reg sltu_en;
reg srl_en;
reg sra_en;
reg slt_en;
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
		.rd_data(rd_data));


initial begin

$shm_open("ALUMux.shm");
$shm_probe("ACTMF");
end

initial begin
add_en=0;or_en=0;and_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

#10 add_en=1; rs1_data=32'h5; rs2_data=32'h6;
or_en=0;and_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

$display("%d",add_en);
#10 or_en=1; rs1_data=32'h2; rs2_data=32'h3;
add_en=0;and_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

#10 and_en=1; rs1_data=32'h1; rs2_data=32'h2;
add_en=0;or_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

#10 xor_en=1; rs1_data=32'hF; rs2_data=32'hA;
add_en=0;or_en=0;and_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

#10 sub_en=1; rs1_data=32'hF; rs2_data=32'h0;
add_en=0;or_en=0;and_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

#10 slt_en=1; rs1_data=32'hf001;rs2_data=32'hf002;
add_en=0;or_en=0;and_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

#10 slt_en=1; rs1_data =32'hf0000002;rs2_data =32'hf0000001;
add_en=0;or_en=0;and_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;

#200 $finish; 

end
endmodule
 
