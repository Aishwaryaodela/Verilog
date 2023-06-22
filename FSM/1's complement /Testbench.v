module one_comptb;
  reg clk,rst,in_data;
  always #5 clk = ~clk;
  one_comp DUT(clk,rst,in_data,out_data);
  initial begin
    clk = 1'b0; rst = 1'b0; 
    #5 rst = 1'b1; in_data =1'b1;
    #10 in_data = 1'b0;
    #10 in_data = 1'b1;
  end
  initial begin
    $monitor("clk = %0d, in_data = %0d,out_data = %0d" ,clk,in_data,out_data); 
    #60 $finish;
  end
endmodule
