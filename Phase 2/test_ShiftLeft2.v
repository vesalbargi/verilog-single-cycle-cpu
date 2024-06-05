`timescale 1ns / 1ps

module test_ShiftLeft2;
  reg  [31:0] in;
  wire [31:0] out;

  ShiftLeft2 u1 (
      .in (in),
      .out(out)
  );

  initial begin
    in = 32'h0000_0001;
    #10;
    in = 32'hFFFF_FFFF;
    #10;
  end
endmodule
