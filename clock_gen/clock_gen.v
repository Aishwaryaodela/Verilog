/*------generating clock without using an always block-----*/
module clock_gen();
  reg clk;
  initial 
    begin
       clk = 1'b0;
       forever #30 clk = ~clk;
    end
  initial #1000 $finish;
 endmodule
