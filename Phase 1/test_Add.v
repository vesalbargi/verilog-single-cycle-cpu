`timescale 1ns / 1ps

module test_Add;
  reg  [31:0] digit1;
  reg  [31:0] digit2;
  wire [31:0] result;

  Add u1 (
      .digit1(digit1),
      .digit2(digit2),
      .result(result)
  );

  initial begin
    digit1 = 32'd0;
    digit2 = 32'd0;
    #10;
    digit1 = 32'd10;
    digit2 = 32'd15;
    #10;
    digit1 = 32'd20;
    digit2 = 32'd30;
    #10;
    digit1 = 32'd100;
    digit2 = 32'd200;
    #10;
  end
endmodule

