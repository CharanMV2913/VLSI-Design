class driver;
  transaction t1;
  mailbox gen2driv;
  virtual intf vif;
  int transaction_count = 0;
  function new(virtual intf vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  task run();
    forever begin
      gen2driv.get(t1);
      vif.Data_In <= t1.Data_In;
      vif.Address <= t1.Address;
      vif.EN <= t1.EN;
      vif.WE <= t1.WE;
      //t1.display("Driver");
      @(posedge vif.clk);
      transaction_count++;
    end
  endtask
endclass
