`timescale 1ns / 1ps

module test_Shift26to28;
  reg  [25:0] in;
  wire [27:0] out;

  Shift26to28 u1 (
      .in (in),
      .out(out)
  );

  initial begin
    in = 26'b000000000000000000000001;
    #10;
    in = 26'b111111111111111111111111;
    #10;
  end
endmodule
