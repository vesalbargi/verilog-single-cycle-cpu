`timescale 1ns / 1ps

module test_ALU;
  reg [31:0] in1;
  reg [31:0] in2;
  reg [2:0] operation;
  wire [31:0] out;
  wire zero;

  ALU u1 (
      .in1(in1),
      .in2(in2),
      .operation(operation),
      .out(out),
      .zero(zero)
  );

  initial begin
    in1 = 32'd0;
    in2 = 32'd0;
    operation = 3'b000;
    #10;
    in1 = 32'd10;
    in2 = 32'd15;
    operation = 3'b000;
    #10;
    operation = 3'b001;
    #10;
    operation = 3'b010;
    #10;
    operation = 3'b011;
    #10;
    in1 = 32'd0;
    in2 = 32'd0;
    operation = 3'b000;
    #10;
  end
endmodule

