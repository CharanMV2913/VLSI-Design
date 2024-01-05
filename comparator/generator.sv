class generator;
	transaction t;
	mailbox gen2driv;

	function new(mailbox gen2driv);
		this.gen2driv = gen2driv;
	endfunction

	task run();
		repeat(10)
		begin
			t = new();
			t.randomize();
			t.display("Generator");
			gen2driv.put(t);
		end
	endtask
endclass
