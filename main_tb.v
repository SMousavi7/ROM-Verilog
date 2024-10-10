`include "main.v"

module main_tb();
  reg[3:0] Rom_1;
  reg[2:0] Rom_6;
  reg[1:0] Rom_2, Rom_3, Rom_4, Rom_5;
  wire [31:0] out;
  main main1(Rom_1, Rom_2, Rom_3, Rom_4, Rom_5, Rom_6, out);

  initial begin
    Rom_2 = 2'b00;
    Rom_3 = 2'b00;
    Rom_4 = 2'b00;
    Rom_5 = 2'b00;
    Rom_6 = 3'd3;
    Rom_1 = 4'd1;
    $display("%h", out);
    #20
     Rom_2 = 2'b11;
    Rom_3 = 2'b11;
    Rom_4 = 2'b11;
    Rom_5 = 2'b11;
    Rom_6 = 3'd1;
    Rom_1 = 4'd7;
    $display("%h", out);
    #20; 
    Rom_2 = 2'b00;
    Rom_3 = 2'b10;
    Rom_4 = 2'b01;
    Rom_5 = 2'b11;
    Rom_6 = 3'd2;
    Rom_1 = 4'd4;
    $display("%h", out);
    #20; 
    Rom_2 = 2'b10;
    Rom_3 = 2'b10;
    Rom_4 = 2'b10;
    Rom_5 = 2'b10;
    Rom_6 = 3'd2;
    Rom_1 = 4'd6;
    $display("%h", out);
    #20;
    Rom_2 = 2'b01;
    Rom_3 = 2'b01;
    Rom_4 = 2'b01;
    Rom_5 = 2'b01;
    Rom_6 = 3'd1;
    Rom_1 = 4'd11;
    $display("%h", out);
    #20;
  end

endmodule