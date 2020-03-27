module StateDiagram (y_out, x_in, clk, reset_b);

output reg y_out;
input x_in, clk, reset_b;
reg [2:0] state;

parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010,
          S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

always @(posedge clk, negedge reset_b)
begin
	if (reset_b == 1'b0) 	begin state <= S0; y_out = 0; end

	case (state)
		S1:	begin state <= S2; y_out = 1; end
		S2:	begin state <= S3; y_out = 1; end
		S3:	begin state <= S4; y_out = 1; end
		S4:	begin state <= S5; y_out = 0; end
		S5:	begin state <= S0; y_out = 0; end
	endcase
end

always @(x_in)
	if (x_in == 1 && state == S0)	begin state <= S1; y_out = 0; end

endmodule
