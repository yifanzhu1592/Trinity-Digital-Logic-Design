module  BCD_Adder (Sum, Carry_out, Addend, Augend, Carry_in);
output	[3:0]	Sum;
output	Carry_out;
input   [3:0]	Addend, Augend;
input		Carry_in;
wire    [3:0]	z, z1;
wire		k;

assign  {k, z} = Addend + Augend + Carry_in;
assign  Carry_out = (z[1] && z[3]) || (z[2] && z[3]) || k;
assign  z1[0] = 0;
assign  z1[1] = Carry_out;
assign  z1[2] = Carry_out;
assign  z1[3] = 0;
assign  Sum = z + z1;

endmodule
