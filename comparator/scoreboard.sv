class scoreboard;
	mailbox mon2scb;
	transaction t;
	
	function new(mailbox mon2scb);
		this.mon2scb=mon2scb;
	endfunction

	task run();
		repeat(10)
		begin
			mon2scb.get(t);
			if(t.a == t.b && t.y1 == 0 && t.y2 == 1 && t.y3 == 0)
				$display("Passed");
			else if(t.a > t.b && t.y1 == 1 && t.y2 == 0 && t.y3 == 0)
				$display("Passed");
			else if(t.a < t.b && t.y1 == 0 && t.y2 == 0 && t.y3 == 1)
				$display("Passed");
			else
				$display("Failed");				
			
			t.display("Scoreboard");
		end	
	endtask
endclass
