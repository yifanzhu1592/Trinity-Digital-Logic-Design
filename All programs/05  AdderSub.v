module  AdderSub (sum_diff, carry, A, B, select);
output	[3:0]	sum_diff;
output	carry;
input   [3:0]	A, B;
input		select;
wire		w0, w1, w2, w3;
wire    B0, B1, B2, B3;

xor     x0(B0, B[0], select);
xor     x1(B1, B[1], select);
xor     x2(B2, B[2], select);
xor     x3(B3, B[3], select);

assign	{w0, sum_diff[0]} = A[0] + B0 + select;
assign	{w1, sum_diff[1]} = A[1] + B1 + w0;
assign	{w2, sum_diff[2]} = A[2] + B2 + w1;
assign	{w3, sum_diff[3]} = A[3] + B3 + w2;
assign	carry = w3 + select;

endmodule
