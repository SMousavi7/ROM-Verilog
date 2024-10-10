module rom_4(
    input[1:0] addr,
    output reg[31:0] out
);
    always @(*) begin
        case (addr)
            2'd0:out = 32'h00000006;
            2'd1:out = 32'h00000020;
            2'd2:out = 32'h00000030;
            2'd3:out = 32'h00000040;  
        endcase
    end
endmodule