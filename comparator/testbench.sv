`include "interface.sv"
`include "test.sv"
module tbench_top;
	intf i_intf();
	test t1(i_intf);
	comp m1(.a(i_intf.a),.b(i_intf.b),.y1(i_intf.y1),.y2(i_intf.y2),.y3(i_intf.y3));
endmodule

