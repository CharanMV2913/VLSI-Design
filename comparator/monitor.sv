class monitor;
	transaction t;
	virtual intf vif;
	mailbox mon2scb;
	
	function new(virtual intf vif,mailbox mon2scb);
		this.vif = vif;
		this.mon2scb = mon2scb;
	endfunction

	task run();
			repeat(10)
			#3;
			begin
			t = new();
			t.a = vif.a;
			t.b = vif.b;
			t.y1 = vif.y1;
			t.y2 = vif.y2;
			t.y3 = vif.y3;
			mon2scb.put(t);
			t.display("Monitor");
			end
		endtask
endclass


