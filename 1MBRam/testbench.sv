`include "interface.sv"
`include "test.sv"
module tbench_top;

  intf i_intf ();
  test t1 (i_intf);

  RAM_1MB R1 (
      .Data_In(i_intf.Data_In),
      .Address(i_intf.Address),
      .clk(i_intf.clk),
      .EN(i_intf.EN),
      .WE(i_intf.WE),
      .Data_Out(i_intf.Data_Out));
  initial begin
    i_intf.clk <= 0;
  end
  always #10 i_intf.clk <= ~i_intf.clk;
endmodule
