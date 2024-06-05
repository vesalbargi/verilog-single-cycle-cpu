`timescale 1ns / 1ps

module test_InstructionMemory;
  reg [31:0] address;
  reg startin;
  reg clk;
  wire [31:0] instruction;

  InstructionMemory u1 (
      .address(address),
      .startin(startin),
      .clk(clk),
      .instruction(instruction)
  );

  always #10 clk = ~clk;

  initial begin
    address = 32'd0;
    clk = 1;
    startin = 1'b1;
    #20;
    startin = 1'b0;
    #10;
    address = 32'd0;
    #10;
    address = 32'd4;
    #10;
    address = 32'd8;
    #10;
    address = 32'd12;
    #10;
    address = 32'd16;
  end
endmodule

