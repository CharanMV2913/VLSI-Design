`include "environment.sv"
program test (
    intf i_intf
);
  environment env;
  initial begin
    env = new(i_intf, 25);
    env.run();
    $finish;
  end
endprogram