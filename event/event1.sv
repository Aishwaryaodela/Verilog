//1.event triggered first & waited for the event, It will not work for both 1)@e1 and 2)wait(e1.triggered)
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
        #10
        @e1;
        $display("@%0d after triggering event B",$time);
      end
    join
  end
endmodule
