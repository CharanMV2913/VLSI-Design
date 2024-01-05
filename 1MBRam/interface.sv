interface intf ();
  byte unsigned Data_In;
  logic [7:0] Data_Out;
  bit [19:0] Address;
  bit clk, EN, WE;
endinterface
