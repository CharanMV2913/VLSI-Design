module Memorytb;
reg clk;
reg rst;
reg read_en;
reg write_en;

reg [4:0] rs1_addr;
reg [4:0] rs2_addr;

reg [4:0] write_addr;
reg [31:0] write_data;


wire [31:0] rs1_data;
wire [31:0] rs2_data;

Memory M1 (.clk(clk),.rst(rst),.read_en(read_en),.rs1_addr(rs1_addr),.rs2_addr(rs2_addr),.write_en(write_en),.write_addr(write_addr),.write_data(write_data),.rs1_data(rs1_data),.rs2_data(rs2_data));


initial begin

$shm_open("Memory.shm");
$shm_probe("ACTMF");
end

initial begin
clk =1'b0;
rst=0;
end
always #2 clk = ~clk;

initial begin 
#10; rst =1; 
#10; rst =0;

#5 ;write_en = 1;read_en=0; write_addr = 5'h15 ;write_data = 32'hABCD;

#5 ;write_en = 1;read_en=0;write_addr = 5'h14 ;write_data = 32'hA0CD;

#5 ;write_en = 1; read_en=0;write_addr = 5'h13 ;write_data = 32'h0BCD;

#5 ;write_en = 1; read_en=0;write_addr = 5'h12 ;write_data = 32'hAB0D;

#5 ;write_en = 1; read_en=0;write_addr = 5'h11 ;write_data = 32'hABC0;


#50 write_en =0; read_en=0; 
#5 ;read_en =1; rs1_addr =5'h15 ; rs2_addr =5'h11;

#5 ;read_en =1; rs1_addr =5'h14 ; rs2_addr =5'h12;

#5 ;read_en =1; rs1_addr =5'h13 ; rs2_addr =5'h13;

#5 ;read_en =1; rs1_addr =5'h12 ; rs2_addr =5'h14;

#5 ;read_en =1; rs1_addr =5'h11 ; rs2_addr =5'h15;
#10 rst =1;
#200; $finish;
end

endmodule
