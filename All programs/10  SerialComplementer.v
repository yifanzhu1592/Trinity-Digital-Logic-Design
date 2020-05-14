module Serial_Twos_Comp (y, data, load, shift_control, Clock, reset_b);

output reg	y;
input [7: 0]	data;
input		load, shift_control, Clock, reset_b;
reg		carry, flag;
reg [3:0]	index;
reg [16:0]	two_complement_data;

parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0010, S3 = 4'b0011,
          S4 = 4'b0100, S5 = 4'b0101, S6 = 4'b0110, S7 = 4'b0111,
          S8 = 4'b1000, S9 = 4'b1001, S10 = 4'b1010, S11 = 4'b1011,
          S12 = 4'b1100, S13 = 4'b1101, S14 = 4'b1110, S15 = 4'b1111;

always @(posedge Clock, negedge reset_b)
begin
	if (reset_b == 0)
	begin 
		carry = 0;
		if (flag == 1) index = S9;
		else index = S0;
		y = 0;
		two_complement_data[0] = ~data[0];
		if (two_complement_data[0] == 1)
		begin
			two_complement_data[0] = 0;
			carry = 1;
		end
		else
		begin
			two_complement_data[0] = 1;
			carry = 0;
		end
		two_complement_data[1] = ~data[1];
		if (carry == 1)
		begin
			if (two_complement_data[1] == 1)
			begin
				two_complement_data[1] = 0;
				carry = 1;
			end
			else
			begin
				two_complement_data[1] = 1;
				carry = 0;
			end
		end
		two_complement_data[2] = ~data[2];
		if (carry == 1)
		begin
			if (two_complement_data[2] == 1)
			begin
				two_complement_data[2] = 0;
				carry = 1;
			end
			else
			begin
				two_complement_data[2] = 1;
				carry = 0;
			end
		end
		two_complement_data[3] = ~data[3];
		if (carry == 1)
		begin
			if (two_complement_data[3] == 1)
			begin
				two_complement_data[3] = 0;
				carry = 1;
			end
			else
			begin
				two_complement_data[3] = 1;
				carry = 0;
			end
		end
		two_complement_data[4] = ~data[4];
		if (carry == 1)
		begin
			if (two_complement_data[4] == 1)
			begin
				two_complement_data[4] = 0;
				carry = 1;
			end
			else
			begin
				two_complement_data[4] = 1;
				carry = 0;
			end
		end
		two_complement_data[5] = ~data[5];
		if (carry == 1)
		begin
			if (two_complement_data[5] == 1)
			begin
				two_complement_data[5] = 0;
				carry = 1;
			end
			else
			begin
				two_complement_data[5] = 1;
				carry = 0;
			end
		end
		two_complement_data[6] = ~data[6];
		if (carry == 1)
		begin
			if (two_complement_data[6] == 1)
			begin
				two_complement_data[6] = 0;
				carry = 1;
			end
			else
			begin
				two_complement_data[6] = 1;
				carry = 0;
			end
		end
		two_complement_data[7] = ~data[7];
		if (carry == 1)
		begin
			if (two_complement_data[7] == 1)
			begin
				two_complement_data[7] = 0;
				carry = 1;
			end
			else
			begin
				two_complement_data[7] = 1;
				carry = 0;
			end
		end
		two_complement_data[9] = data[0];
		two_complement_data[10] = data[1];
		two_complement_data[11] = data[2];
		two_complement_data[12] = data[3];
		two_complement_data[13] = data[4];
		two_complement_data[14] = data[5];
		two_complement_data[15] = data[6];
		two_complement_data[16] = data[7];
	end

	if (load == 0 && shift_control == 1)
	begin 
		if (index == S0)
		begin
			y = two_complement_data[index];
			index = S1;
		end
		else if (index == S1)
		begin
			y = two_complement_data[index];
			index = S2;
		end
		else if (index == S2)
		begin
			y = two_complement_data[index];
			index = S3;
		end
		else if (index == S3)
		begin
			y = two_complement_data[index];
			index = S4;
		end
		else if (index == S4)
		begin
			y = two_complement_data[index];
			index = S5;
		end
		else if (index == S5)
		begin
			y = two_complement_data[index];
			index = S6;
		end
		else if (index == S6)
		begin
			y = two_complement_data[index];
			index = S7;
		end
		else if (index == S7)
		begin
			y = two_complement_data[index];
			index = S8;
		end
		else if (index == S8)
		begin
			y = 1;
			flag = 1;
		end
		else if (index == S9)
		begin	
			y = two_complement_data[index];
			index = S10;
		end
		else if (index == S10)
		begin	
			y = two_complement_data[index];
			index = S11;
		end
		else if (index == S11)
		begin	
			y = two_complement_data[index];
			index = S12;
		end
		else if (index == S12)
		begin	
			y = two_complement_data[index];
			index = S13;
		end
		else if (index == S13)
		begin
			y = two_complement_data[index];
			index = S14;
		end
		else if (index == S14)
		begin
			y = two_complement_data[index];
			index = S15;
		end
		else if (index == S15)
		begin
			y = two_complement_data[index];
			index = S0;
		end
	end

	if (load == 1 && flag == 1)	y = 1;

end

endmodule
