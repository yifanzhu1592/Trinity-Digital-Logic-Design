module OddFunction (A, x, y, clk, reset_b);

output reg A;
input x, y, clk, reset_b;

always @(x, y, clk, reset_b)
begin
if (reset_b == 0) A = 0;
else if (clk == 1 && x != y) A = !A;
end

endmodule
