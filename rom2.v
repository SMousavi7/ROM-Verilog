module rom_2(
    input[1:0] addr,
    output reg[31:0] out
);
    always @(*) begin
        case (addr)
            2'd0:out = 32'h00000032;
            2'd1:out = 32'h00000067;
            2'd2:out = 32'h00000057;
            2'd3:out = 32'h00000047;  
        endcase
    end
endmodule