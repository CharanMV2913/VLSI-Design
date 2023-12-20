module decodertb;
reg [31:0]instruction;
reg clk;

wire [4:0] rs1_addr,rs2_addr,rd_addr;
wire[6:0] opcode,fun7;
wire [2:0] fun3;
wire sub_en,sra_en,subw_en,sraw_en,add_en,sll_en,slt_en,sltu_en,xor_en,srl_en,or_en,and_en;


decoder d1(.instruction(instruction),.clk(clk),.rs1_addr(rs1_addr),.rs2_addr(rs2_addr),.rd_addr(rd_addr),.sub_en(sub_en),.sra_en(sra_en),.subw_en(subw_en),.sraw_en(sraw_en),.add_en(add_en),.sll_en(sll_en),.slt_en(slt_en),.sltu_en(sltu_en),.xor_en(xor_en),.srl_en(srl_en),.or_en(or_en),.and_en(and_en),.opcode(opcode),.fun3(fun3),.fun7(fun7));
initial begin
$shm_open("decode.shm");
$shm_probe("ACTMF");
end
initial begin
   
    forever #10 clk=~clk;
  end

 initial begin
   clk=0;
   instruction=32'h00b50c33;
  #20 instruction=32'h40b50c33;
  #20 instruction=32'h00b51c33;
  #20 instruction=32'h00b52c33;
#10 $finish;
end 
endmodule
