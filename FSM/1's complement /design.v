`include "def.v"
module one_comp(input clk,rst,in_data, output out_data);
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
        `IDLE : next_state = `S0;
          `S0 : begin
             case(in_data)     
                   1'b1 : next_state = `S0;
                   1'b0 : next_state = `S1;
                default : next_state = `IDLE;
             endcase
                end         
          `S1 : begin
             case(in_data)
                1'b1 : next_state = `S0;
                1'b0 : next_state = `S1;
                default : next_state = `IDLE;
                endcase
                end
        end
         assign out_data = (state == `S0) ? ((in_data== 1) ? 0 : 1) : ((in_data == 1) ? 0 : 1);
endmodule
