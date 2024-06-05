`timescale 1ns / 1ps

module test_PC;
  reg [31:0] in;
  reg clk;
  reg startin;
  wire [31:0] out;

  PC u1 (
      .in(in),
      .clk(clk),
      .startin(startin),
      .out(out)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 1;
    in = 32'b0;
    startin = 1'b1;
    #20;
    startin = 1'b0;
    #10;
    in = 32'd1;
    #10;
    in = 32'd2;
    #10;
    in = 32'd3;
    #10;
    in = 32'd4;
    #10;
  end
endmodule
