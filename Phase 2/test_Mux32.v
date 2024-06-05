`timescale 1ns / 1ps

module test_Mux32;
  reg [31:0] input1;
  reg [31:0] input2;
  reg op;
  wire [31:0] out;

  Mux32 u1 (
      .input1(input1),
      .input2(input2),
      .op(op),
      .out(out)
  );

  initial begin
    input1 = 32'hAAAA_AAAA;
    input2 = 32'h5555_5555;
    op = 0;
    #10;
    input1 = 32'hAAAA_AAAA;
    input2 = 32'h5555_5555;
    op = 1;
    #10;
    input1 = 32'hFFFF_FFFF;
    input2 = 32'h0000_0000;
    op = 0;
    #10;
    input1 = 32'hFFFF_FFFF;
    input2 = 32'h0000_0000;
    op = 1;
    #10;
  end
endmodule
