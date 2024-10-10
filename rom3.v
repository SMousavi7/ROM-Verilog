module rom_3(
    input[1:0] addr,
    output reg[31:0] out
);
    always @(*) begin
        case (addr)
            2'd0:out = 32'h00000054;
            2'd1:out = 32'h00000080;
            2'd2:out = 32'h00000090;
            2'd3:out = 32'h00000060;  
        endcase
    end
endmodule