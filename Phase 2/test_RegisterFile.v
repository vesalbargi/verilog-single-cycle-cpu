`timescale 1ns / 1ps

module test_RegisterFile;
  reg [4:0] Read1;
  reg [4:0] Read2;
  reg [4:0] WriteReg;
  reg [31:0] WriteData;
  reg RegWrite;
  reg startin;
  reg clk;
  reg [4:0] regNo;
  wire [31:0] Data1;
  wire [31:0] Data2;
  wire [31:0] val;

  RegisterFile u1 (
      .Read1(Read1),
      .Read2(Read2),
      .WriteReg(WriteReg),
      .WriteData(WriteData),
      .RegWrite(RegWrite),
      .startin(startin),
      .clk(clk),
      .regNo(regNo),
      .Data1(Data1),
      .Data2(Data2),
      .val(val)
  );

  always #10 clk = ~clk;

  initial begin
    clk = 1;
    startin = 1;
    RegWrite = 0;
    Read1 = 0;
    Read2 = 0;
    WriteReg = 0;
    WriteData = 0;
    #10;
    startin   = 0;
    WriteReg  = 5'd1;
    WriteData = 32'hAAAA_AAAA;
    RegWrite  = 1;
    #20;
    RegWrite = 0;
    Read1 = 5'd1;
    #10;
    WriteReg  = 5'd2;
    WriteData = 32'h5555_5555;
    RegWrite  = 1;
    #10;
    RegWrite = 0;
    Read2 = 5'd2;
    #10;
    regNo = 5'd1;
    #10;
  end
endmodule
