module FiniteStateMachine (out_z, in_x, in_y, clk, reset_b);

output reg out_z;
input in_x, in_y, clk, reset_b;
reg [1:0] state, next_state;

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
always @(posedge clk, negedge reset_b)
	if (reset_b == 1'b0) state <= S0; else state <= next_state;

	always @(in_x, in_y, state)
  	begin
    	case (state)
   		S0: 	if (in_x == 0) next_state = S0;
    	    		else if (in_y == 0) next_state = S3;
          		else next_state = S1;
   		S1: 	if (in_x == 0) next_state = S0;
    	    		else next_state = S2;
    		S2: 	if (in_x == 0) next_state = S0;
    	    		else next_state = S3;
   		S3: 	if (in_x == 0) next_state = S0;
    	    		else next_state = S3;
    	endcase
    	if (state == S0 || state == S1) out_z = 1'b0;
   	else out_z = 1'b1;
   	end
endmodule
