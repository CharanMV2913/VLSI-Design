class driver;
	transaction t;
	virtual intf vif;
	mailbox gen2driv;

	function new(virtual intf vif,mailbox gen2driv);
		this.vif=vif;
		this.gen2driv = gen2driv;
	endfunction

	task run();
		repeat(10)
			begin
			gen2driv.get(t);
			vif.a <= t.a;
			vif.b <= t.b;			
			t.display("driver");


			end
		endtask
endclass
