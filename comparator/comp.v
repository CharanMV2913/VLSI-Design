module comp (a,b,y1,y2,y3);
input [3:0]a;
input [3:0]b;
output y1;
output y2;
output y3;
reg y1;
reg y2;
reg y3;
always@(a,b)
	begin 
	if(a>b)
	begin
	y1=1'b1;
	y2=1'b0;
	y3=1'b0;
	end
	else if(a==b)
	begin
	y1=1'b0;
	y2=1'b1;
	y3=1'b0;
	end
	else
	begin
	y1=1'b0;
	y2=1'b0;
	y3=1'b1;
	end
	end
endmodule


