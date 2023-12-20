module ALU_tb;

reg [31:0]rs1_data;
reg [31:0]rs2_data;

 [31:0]rd_data;

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

ALUmux ALUtop(	   sub_en,
		   sra_en,
		   subw_en,
		   sraw_en,
		   add_en,
		   sll_en,
		   slt_en,
		   sltu_en,
		   xor_en,
		   srl_en,
		   or_en,
		   and_en ,  [31:0]rs1_data,  [31:0]rs2_data, [31:0]rd_data);

//  Add u1 (.add_en(add_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  sub u2 (.sub_en(sub_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data));
//  Xor u3 (.xor_en(xor_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  Or u4(.or_en(or_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  And u5 (.and_en(and_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  sll u6 (.sll_en(sll_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  sltu u7 (.sltu_en(sltu_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  srl u8 (.srl_en(srl_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  sra u9 (.sra_en(sra_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 
//  slt u10 (.slt_en(slt_en),.rs1_data(rs1_data),.rs2_data(rs2_data),.rd_data(rd_data)); 

initial begin

$shm_open("ALU.shm");
$shm_probe("ACTMF");
end

initial begin
add_en=0;or_en=0;and_en=0;xor_en=0;sub_en=0; sll_en=0; sltu_en=0; srl_en=0;sra_en=0;slt_en=0;
#10 add_en=1; rs1_data=32'h5; rs2_data=32'h6;
$display("%d",add_en);
#10 or_en=1; rs1_data=32'h2; rs2_data=32'h3;
#10 and_en=1; rs1_data=32'h1; rs2_data=32'h2;
#10 xor_en=1; rs1_data=32'hF; rs2_data=32'hA;
#10 sub_en=1; rs1_data=32'hF; rs2_data=32'h0;

#10 slt_en=1; rs1_data=32'hf001;rs2_data=32'hf002;
#10 slt_en=1; rs1_data =32'hf0000002;rs2_data =32'hf0000001;

#200 $finish; 

end
endmodule
 
