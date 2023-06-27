//2.event triggered and waiting for the event from time 0.It will work for both 1)@e1 and 2) wait(e1.triggered)
module events; 
  event e1;
  initial begin
    fork
      begin
        $display("@%0d before triggering even A",$time);
        #10
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
