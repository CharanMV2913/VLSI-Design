module RiscVtb;
reg [31:0] instruction;
reg clk;
reg rst;


initial begin
	clk =1'b0;
end



RiscV Riscv(.instruction(instruction),.clk(clk),.rst(rst));
initial begin
forever  #2 clk=~clk;
end

initial begin
$shm_open("RiscV.shm");
$shm_probe("ACTMF");
end

initial begin
rst =1; #2  rst =0;

#10 instruction = 32'h00b50c33;
#20 instruction=32'h40b50c33;
#20 instruction=32'h00b51c33;
#20 instruction=32'h00b52c33;

#200 
$finish;

end

endmodule
