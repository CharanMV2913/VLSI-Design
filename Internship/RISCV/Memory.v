module Memory(input clk,input rst ,input read_en ,input [4:0]rs1_addr,input [4:0]rs2_addr, 
	input write_en ,input [4:0]write_addr ,input [31:0]write_data ,output reg [31:0]rs1_data, output reg [31:0]rs2_data);

reg [31:0] mem[0:31];

always @(posedge clk or posedge rst)
		begin
		if(rst == 0)
			 begin
			if(write_en ==1'b1 && read_en == 1'b0)
				begin
			 	mem[write_addr] <= write_data;
				$display("write");
				end 
			end
		else begin
			rs1_data <= 32'b0;
			rs2_data <= 32'b0;
		end
		end
always @(posedge clk or posedge rst)
		 begin
		if(rst ==0)
		begin	
		if(write_en ==1'b0 && read_en == 1'b1)
			begin
			 rs1_data = mem[rs1_addr];
			 rs2_data = mem[rs2_addr];
			end
		end
	else begin
		rs1_data <= 32'b0;
		rs2_data <= 32'b0;
		end
end
endmodule
