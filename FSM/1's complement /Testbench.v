module one_comptb;
  reg in_data;
  always clk = ~clk;
  initial begin
    clk = 1'b0; rst = 1'b1
