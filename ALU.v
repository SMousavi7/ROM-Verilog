module ALU (input_a, input_b, select, out, carry);
	input[31:0] input_a, input_b;
	input[3:0] select;
	output reg[31:0] out;
	output reg carry;

	wire[31:0] first_m, second_m, third_m, forth_m, fifth_m, sixth_m, seventh_m;
	wire Cout_temp;

	carry_look_ahead_32bit one(input_a, input_b, first_m, Cout_temp);
	carry_look_ahead_32bit two(input_a, ~input_b + 1'b1, second_m, Cout_temp);
	assign third_m = input_a & input_b;
	assign forth_m = input_a | input_b;
	assign fifth_m = (input_a > input_b) ? input_a : input_b;
	assign sixth_m = ~input_a;
	assign seventh_m = ~(input_a|input_b);
	wire[31:0] temp2;
	assign temp2 = second_m;
	always @(*) begin
		case (select)
			4'd1:begin
			  	out = first_m;
				carry = Cout_temp;
			end 
			4'd3: begin
			  	out = {20'h00000, temp2[2:0]};
				carry = ~Cout_temp;
			end
			4'd4: begin
				out = third_m;
				carry = 1'b0;
			end
			4'd8: begin
				out = forth_m;
				carry = 1'b0;
			end
			4'd10:begin
				out = fifth_m;
				carry = 1'b0;
			end
			4'd13: begin
				out = sixth_m;
				carry = 1'b0;
			end
			4'd15:begin
			   	out = seventh_m;
				carry = 1'b0;
			end
		endcase
	end
endmodule

module carry_look_ahead_32bit(input_a, input_b, sum, cout);
	input[31:0] input_a, input_b;
	output[31:0] sum;
	wire[31:0] gen, pro;
	wire[32:0] c;
	wire[31:0] temp_sum, temp_temp_sum;
	output cout;
	assign c[0] = 1'b0;
	genvar i;
	genvar j;
	generate
		for(j = 0; j < 32; j = j + 1) begin
			assign gen[j] = input_a[j] & input_b[j];
			assign pro[j] = input_a[j] ^ input_b[j];
		end
	endgenerate
	generate
		for(i = 0; i < 32; i = i + 1) begin
			assign c[i + 1] = (c[i] & pro[i]) | gen[i];
		end
	endgenerate
	assign sum = input_a ^ input_b ^ c;
	assign cout = c[12];
endmodule
