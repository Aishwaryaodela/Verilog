/*module fork_join(); 
  initial begin
    fork 
      begin
        #5 $display("%0d display A start of the display",$time);
        #10 $display ("%0d display A end of the block",$time); 
                    end
                    begin
                      #8 $display("%0d display B start of the display",$time);
                      #12 $display ("%0d display b end of the block",$time); 
                    end
                    begin
                      #15 $display("%0d display C start of the display",$time);
                      #20 $display ("%0d display C end of the block",$time); 
                    end
    join_any 
    disable fork; // disabling fork join
    $display("After fork_join block",$time); 
   end
endmodule*/
      
      
      
module fork_join();
  initial begin
    fork 
      begin
        #5 $display("%0d display A start of the display",$time);
        #10 $display ("%0d display A end of the block",$time); 
                    end
                    begin
                      #8 $display("%0d display B start of the display",$time);
                      #12 $display ("%0d display b end of the block",$time); 
                    end
                    begin
                      #15 $display("%0d display C start of the display",$time);
                      #20 $display ("%0d display C end of the block",$time); 
                    end
    join_any
    wait fork; // wait fork
    $display("After fork_join block",$time); 
   end
endmodule
