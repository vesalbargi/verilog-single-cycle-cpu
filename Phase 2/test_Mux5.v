`timescale 1ns / 1ps

module test_Mux5;
  reg [4:0] input1;
  reg [4:0] input2;
  reg op;
  wire [4:0] out;

  Mux5 u1 (
      .input1(input1),
      .input2(input2),
      .op(op),
      .out(out)
  );

  initial begin
    input1 = 5'b00001;
    input2 = 5'b00010;
    op = 0;
    #10;
    input1 = 5'b00001;
    input2 = 5'b00010;
    op = 1;
    #10;
    input1 = 5'b11111;
    input2 = 5'b00000;
    op = 0;
    #10;
    input1 = 5'b11111;
    input2 = 5'b00000;
    op = 1;
    #10;
  end
endmodule
