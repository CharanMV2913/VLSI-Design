class transaction;
	rand bit [3:0]a;
	rand bit [3:0]b;
	bit y1,y2,y3;
	
	function void display(string name);
		$display("In:%s:a=%b,b=%b,y1=%b,y2=%b,y3=%b", name,a,b,y1,y2,y3);
		$display("_________");
	endfunction
endclass



