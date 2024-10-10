module rom_5(
    input[1:0] addr,
    output reg[31:0] out
);
    always @(*) begin
        case (addr)
            2'd0:out = 32'h00000045;
            2'd1:out = 32'h00000055;
            2'd2:out = 32'h00000065;
            2'd3:out = 32'h00000075;  
        endcase
    end
endmodule