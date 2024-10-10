module rom_6(
    input[2:0] addr,
    output reg[31:0] out
);
    always @(*) begin
        case (addr)
            3'd0:out = 32'h97243000;
            3'd1:out = 32'h98243000; 
            3'd2:out = 32'h99243000;
            3'd3:out = 32'h00243000;
            3'd4:out = 32'h01243000;
        endcase
    end
endmodule