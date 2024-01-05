class monitor;
    transaction t1;
    mailbox mon2scb;
    virtual intf vif;
    function new(virtual intf vif, mailbox mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
    endfunction
    task run();
    t1 = new();
    forever 
    begin
    @(posedge vif.clk);
     #5;
    t1.Data_In = vif.Data_In;
    t1.Address = vif.Address;
    t1.EN = vif.EN;
    t1.WE = vif.WE;
    t1.Data_Out = vif.Data_Out;
     //t1.display("Monitor");
    mon2scb.put(t1.copy());
    end
    endtask
    endclass
    