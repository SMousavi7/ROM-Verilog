module mux_2(
    input[31:0] input_a,
    input[31:0] input_b,
    input select,
    output [31:0] out
);
    assign out = (select) ? input_b : input_a;
endmodule