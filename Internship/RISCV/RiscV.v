module RiscV(input [31:0]instruction, input clk,output reg[4:0]rs1_addr,output reg[4:0] rs2_addr,output reg[4:0]rd_addr, output reg sub_en,
		output reg sra_en,
		output   reg subw_en,
		output  reg sraw_en,
		output  reg add_en,
		output  reg sll_en,
		output  reg slt_en,
		output  reg sltu_en,
		output  reg xor_en,
		output  reg srl_en,
		output  reg or_en,
		output  reg and_en,
		output reg [6:0] opcode,
 		output  reg [2:0] fun3,
 		output  reg [6:0] fun7,

input clk,input rst ,input read_en ,input [4:0]rs1_addr,input [4:0]rs2_addr, 
	input write_en ,input [4:0]write_addr ,input [31:0]write_data ,output reg [31:0]rs1_data, output reg [31:0]rs2_data
)



decoder decoder_inst(input [31:0]instruction, input clk,output reg[4:0]rs1_addr,output reg[4:0] rs2_addr,output reg[4:0]rd_addr,
                 output reg sub_en,
		output reg sra_en,
		output   reg subw_en,
		output  reg sraw_en,
		output  reg add_en,
		output  reg sll_en,
		output  reg slt_en,
		output  reg sltu_en,
		output  reg xor_en,
		output  reg srl_en,
		output  reg or_en,
		output  reg and_en,
output reg [6:0] opcode,
 output  reg [2:0] fun3,
 output  reg [6:0] fun7);


Memory Memory_inst(input clk,input rst ,input read_en ,input [4:0]rs1_addr,input [4:0]rs2_addr, 
			input write_en ,input [4:0]write_addr ,input [31:0]write_data ,output reg [31:0]rs1_data, output reg [31:0]rs2_data);

Add Add_inst(input add_en,input wire [31:0]rs1_data ,input wire [31:0]rs2_data,output reg [31:0]rd_data);

sub sub_inst(input sub_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

Xor Xor_inst(input xor_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

Or Or_inst(input or_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

And And_inst(input and_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

sll sll_inst(input sll_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

sltu sltu_inst(input sltu_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

srl srl_inst(input srl_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

sra sra_inst(input sra_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

slt slt_inst(input slt_en,input [31:0]rs1_data ,input [31:0]rs2_data,output reg[31:0]rd_data);

