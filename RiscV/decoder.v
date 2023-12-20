module decoder(input [31:0]instruction, input clk,output reg[4:0]rs1_addr,output reg[4:0] rs2_addr,output reg[4:0]rd_addr,
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
 output  reg [6:0] fun7,
output reg write_en, output reg read_en);

	always@(posedge clk)
            begin
                 opcode<=instruction[6:0];
                 fun7<=instruction[31:25];
 		 fun3<=instruction[14:12]; 
                 rs1_addr<=instruction[19:15];
         	 rs2_addr<=instruction[24:20];
                 rd_addr<=instruction[11:7];
                 sub_en=1'b0;
		 sra_en=1'b0;
		  subw_en=1'b0;
		subw_en=1'b0;
		sraw_en=1'b0;
		add_en=1'b0;
		sll_en=1'b0;
		slt_en=1'b0;
		sltu_en=1'b0;
		xor_en=1'b0;
		srl_en=1'b0;
		or_en=1'b0;
		and_en=1'b0;
		write_en =1'b1;
		read_en=1'b1;


             if(fun7 ==7'b0100000)
                begin
		 if(opcode == 7'b0110011 )
                          begin
			  case(fun3)
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
			  case(fun3)
                               3'b000:begin
					subw_en=1'b1;
                                       end
                               3'b101:begin
					sraw_en=1'b1;
                                       end
				endcase
				end
     		          end
            else if(fun7 ==7'b0000000)
                  begin
                  if(opcode == 7'b0110011)
                       begin
			  case(fun3)
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

 		 	end


               

			end





endmodule
