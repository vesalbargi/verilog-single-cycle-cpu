`timescale 1ns / 1ps

module test_Main;
  reg clk;
  reg startin;
  wire [4:0] regNo;
  wire [31:0] val;

  Main u1 (
      .clk(clk),
      .startin(startin),
      .regNo(regNo),
      .val(val)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    startin = 0;
    #10;
    startin = 1;
    #10;
    startin = 0;
    #100;
  end
endmodule

