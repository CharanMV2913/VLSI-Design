class scoreboard;
  transaction t1;
  mailbox mon2scb;
  int transaction_count = 0;
  byte unsigned local_memory[longint];
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  task run();
    byte unsigned data;
    forever begin
      mon2scb.get(t1);
      if (local_memory.exists(t1.Address)) data = local_memory[t1.Address];
      else data = 8'b11111111;

      if (t1.EN == 1'b1 && t1.WE == 1'b1) begin
        local_memory[t1.Address] = t1.Data_In;
        $display("PASS - Data Write: Saved %h in location %h", t1.Data_In, t1.Address);
      end else if (t1.EN == 1'b1 && t1.WE == 1'b0 && t1.Data_Out === data)
        $display(
            "PASS - Data Read : Location - %h, Retrieved %h , Actual = %h",
            t1.Address,
            t1.Data_Out,
            data
        );
      else if (t1.EN == 1'b1 && t1.WE == 1'b0 && t1.Data_Out !== data)
        $display(
            "FAIL - Data Read : Location - %h, Retrieved %h , Actual = %h",
            t1.Address,
            t1.Data_Out,
            data
        );
      else if (t1.EN == 1'b0 && t1.Data_Out === 8'bzzzzzzzz)
        $display("PASS - EN = %b, Data_Out = %b", t1.EN, t1.Data_Out);
      else if (t1.EN == 1'b0 && t1.Data_Out !== 8'bzzzzzzzz)
        $display("FAIL - EN = %b, Data_Out = %b", t1.EN, t1.Data_Out);
      else $display("Some other error");
      transaction_count++;
    end
  endtask
endclass
