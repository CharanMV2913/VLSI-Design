class generator;
  transaction t1;
  mailbox gen2driv;
  int transaction_count;
  event ended;
  function new(mailbox gen2driv, event ended);
    this.gen2driv = gen2driv;
    this.ended = ended;
    t1 = new();
  endfunction
  task run();
    for (int i = 0; i < transaction_count; i++) begin
      t1.randomize();
      //t1.display("Generator");
      gen2driv.put(t1.copy());
      #20;
      if (t1.duplicate == 1'b1 && t1.EN == 1'b1 && t1.WE == 1'b1) begin
        i++;
        t1.WE = ~t1.WE;
        gen2driv.put(t1.copy());
        #20;
      end
    end
    ->ended;
  endtask
endclass
