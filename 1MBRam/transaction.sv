class transaction;
    rand byte unsigned Data_In;
     rand bit EN;
     rand bit [19:0] Address;
    rand bit WE;
    logic [7:0] Data_Out;
     
     randc bit duplicate;
     
     constraint EN_dist {
    EN dist {0 := 1, 1 := 9}; 
    }

    function display(string name);
    $display("In: %s, Data_In = %h, Address = %h, En = %b, WE = %b, Data_Out = %h ",name, Data_In,Address, EN, WE, Data_Out);
    endfunction

    function transaction copy();
    copy = new();
    copy.Data_In = this.Data_In;
    copy.Address = this.Address;
    copy.EN = this.EN;
    copy.WE = this.WE;
    copy.Data_Out = this.Data_Out;
    endfunction

endclass
    
