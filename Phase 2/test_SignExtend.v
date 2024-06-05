`timescale 1ns / 1ps

module test_SignExtend;
  reg  [15:0] in;
  wire [31:0] result;

  SignExtend u1 (
      .in(in),
      .result(result)
  );

  initial begin
    in = 16'h0001;
    #10;
    in = 16'hFFFF;
    #10;
  end
endmodule
