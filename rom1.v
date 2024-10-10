module rom_1(
    input[3:0] addr,
    output reg [5:0]out
);
    always @(*) begin
        case (addr)
            4'd1:out = 6'b000001;
            4'd2:out = 6'b000011;
            4'd3:out = 6'b000100;
            4'd4:out = 6'b001000;
            4'd5:out = 6'b001010;
            4'd6:out = 6'b001101;
            4'd7:out = 6'b001111;
            4'd8:out = 6'b110001;
            4'd9:out = 6'b110011;
            4'd10:out = 6'b110100;
            4'd11:out = 6'b111000;
            4'd12:out = 6'b111010;
            4'd13:out = 6'b111101;
            4'd14:out = 6'b111111;
            4'd15:out = 6'b100001;
        endcase
    end
endmodule