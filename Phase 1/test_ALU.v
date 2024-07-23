`timescale 1ns / 1ps

module test_ALU;
  reg [31:0] in1;
  reg [31:0] in2;
  reg [3:0] operation;
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
    in1 = 32'hA5A5A5A5;
    in2 = 32'h5A5A5A5A;
    operation = 4'b0000;
    #10;
    operation = 4'b0001;
    #10;
    in1 = 32'd10;
    in2 = 32'd15;
    operation = 4'b0010;
    #10;
    operation = 4'b0110;
    #10;
    operation = 4'b0111;
    #10;
    in1 = 32'hFFFF0000;
    in2 = 32'h0000FFFF;
    operation = 4'b1100;
    #10;
    in1 = 32'd0;
    in2 = 32'd0;
    operation = 4'b0010;
    #10;
    in1 = 32'd1;
    in2 = 32'd1;
    operation = 4'b1111;
    #10;
  end
endmodule
