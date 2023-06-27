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
        wait(e1.triggered);
        $display("@%0d after triggering event B",$time);
      end
    join
  end
endmodule
