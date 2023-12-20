module Decoder(input [31:0] instruction ,input clk, output [4:0]rs1,
	output [4:0]rs2,output [4:0]rd);
wire [6:0] opcode;
wire [2:0] func3;
wire [6:0] func7;

	always(@posedge clk)
		begin
			opcode <= instruction[6:0];
			func3 <= instruction[14:12];
			func7 <= instruction[31:25];	
		if(func7 == 7'b0100000)
			begin
			if(opcode == 7'b0110011)
					begin
					case(func3)
						3'b000:begin
							sub_en=1'b1;
							end
						3'b101:begin
							sra_en=1'b1;
							end
					endcase
					end
			else if(opcode == 7'b0111011)
					begin
					case(func3)
						3'b000:begin
							subw_en=1'b1;
							end
						3'b101:begin
							sraw_en=1'b1;
							end
					end
			end
		else if(func7 == 7'b0000000)
			begin
			if(opcode == 7'b0110011)
					begin
					case(func3)
						3'b000:begin
							add_en=1'b1;
							end
						3'b001:begin
							sll_en=1'b1;
							end
						3'b010:begin
							slt_en=1'b1;
							end
						3'b011:begin
							sltu_en=1'b1;
							end
						3'b100:begin
							xor_en=1'b1;
							end
						3'b101:begin
							srl_en=1'b1;
							end
						3'b110:begin
							or_en=1'b1;
							end
						3'b111:begin
							and_en=1'b1;
							end
					endcase
					end
			else if(opcode == 7'b0111011)
				begin
				case(func3)
						3'b101:begin
							srl_en=1'b1;
							end
						3'b110:begin
							or_en=1'b1;
							end
						3'b111:begin
							and_en=1'b1;
							end

				endcase
				end
		





			end
endmodule
