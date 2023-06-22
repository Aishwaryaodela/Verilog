module one_comp(input in_data, output out_data);
   reg out_data;
  always@(posedge clk or negedge rst)
     begin
       if(!rst)
        state = `IDLE;
       else 
        state = next_state;
     end
  always@(state)
    begin 
      case(state)
        `IDLE : next_state = `s0;
          `s0 : begin
                  if(in_data)  next_state = `s0;
                  else   next_state = `s1;
                end         
          `s1 : begin
                   if(in_data) next_state = `s0;
                   else next_state = `s1;
                end
        end
        assign out_data = (state == `s0) ? ((in_data == 1) ? 0 : 1) : ((state == `s1) ? ((in_data == 1) ? 0 : 1) : 0);
endmodule
