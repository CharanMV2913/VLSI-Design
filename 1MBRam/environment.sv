`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver driv;
  monitor mon;
  scoreboard scb;
  mailbox m1, m2;
  virtual intf vif;
  event gen_ended;

  function new(virtual intf vif, int transaction_count);
    this.vif = vif;
    m1 = new();
    m2 = new();
    gen = new(m1, gen_ended);
    gen.transaction_count = transaction_count;

    driv = new(vif, m1);
    mon = new(vif, m2);
    scb = new(m2);
  endfunction

  task test();
    fork
      gen.run();
      driv.run();
      mon.run();
      scb.run();
    join_any
  endtask

  task run();
    test();
    wait (gen_ended.triggered);
    wait (gen.transaction_count == driv.transaction_count);
    wait (gen.transaction_count == scb.transaction_count);
    $finish;
  endtask
endclass
