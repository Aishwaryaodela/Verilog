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
             case(in_data)     
                   1'b1 : next_state = `s0;
                   1'b0 : next_state = `s1;
                default : next_state = `IDLE;
             endcase
                end         
          `s1 : begin
             case(in_data)
                1'b1 : next_state = `s0;
                1'b0 : next_state = `s1;
                default : next_state = `IDLE;
                endcase
                end
        end
         assign out_data = (state == `s0) ? ((in_data == 1) ? 0 : 1) : ((in_data == 1) ? 0 : 1);
endmodule
