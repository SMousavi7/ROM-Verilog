`include "ALU.v"
`include "rom1.v"
`include "rom2.v"
`include "rom3.v"
`include "rom4.v"
`include "rom5.v"
`include "rom6.v"
`include "mux1.v"
`include "mux2.v"


module main(
    input[3:0] Rom_1,
    input[1:0] Rom_2,
    input[1:0] Rom_3,
    input[1:0] Rom_4,
    input[1:0] Rom_5,
    input[2:0] Rom_6,
    output [31:0] SID
);
    wire[5:0] out_rom1;
    wire[31:0] out_rom2, out_rom3, out_rom4, out_rom5, out_rom6;
    wire[31:0] out_mux1, out_mux2;
    wire[31:0] out_ALU;
    reg[31:0] temp_for_if_ALU;
    reg[31:0] temp_for_if_rom6;
    


    rom_1 r1(Rom_1, out_rom1);
    rom_2 r2(Rom_2, out_rom2);
    rom_3 r3(Rom_3, out_rom3);
    rom_4 r4(Rom_4, out_rom4);
    rom_5 r5(Rom_5, out_rom5);
    rom_6 r6(Rom_6, out_rom6);
    mux_1 m1(out_rom2, out_rom3, out_rom1[5], out_mux1);
    mux_2 m2(out_rom4, out_rom5, out_rom1[4], out_mux2);
    ALU alu(out_mux1, out_mux2, out_rom1[3:0], out_ALU, Cout);
    
    always @(*) begin
        if(out_ALU[2:0] == 12'h000) begin
            temp_for_if_ALU = 32'hzzzzzzzz;
        end 
        else if(out_ALU[31] == 1'b1) begin
            temp_for_if_ALU = ~out_ALU + 32'h00000001;
        end
        else begin
          temp_for_if_ALU = out_ALU;
        end
        if(Cout == 1) begin
            temp_for_if_rom6 = out_rom6 + 32'h01000000;
        end       
        else begin
            temp_for_if_rom6 = out_rom6;
        end
    end

    assign SID = out_ALU + out_rom6;  
endmodule
