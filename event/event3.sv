//3.event triggered and waited for it at time 0. The 1)@e1 will not work and 2)wait(e1.triggered) 
module events; 
  event e1;
  initial begin
    fork
      begin
        $display("@%0d before triggering even A",$time);
        
        ->e1;
        $display("@%0d after triggering event A",$time);
      end
      begin
        $display("@%0d before triggering even B",$time);
        @e1;
        $display("@%0d after triggering event B",$time);
      end
    join
  end
endmodule 
