`timescale 1ns / 1ps

module test_Main;
  reg clk;
  reg startin;
  reg [4:0] regNo;
  wire [31:0] pc_out;
  wire [31:0] instruction;
  wire [31:0] alu_result;
  wire [31:0] mem_data;
  wire zero_flag;
  wire [31:0] val;

  Main u1 (
      .clk(clk),
      .startin(startin),
      .regNo(regNo),
      .pc_out(pc_out),
      .instruction(instruction),
      .alu_result(alu_result),
      .mem_data(mem_data),
      .zero_flag(zero_flag),
      .val(val)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 0;
    startin = 1;
    regNo = 5'd1;
    #100;
    startin = 0;
    #10;
    startin = 1;
    #200;
  end
endmodule
