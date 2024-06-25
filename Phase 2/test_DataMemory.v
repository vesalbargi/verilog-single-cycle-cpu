`timescale 1ns / 1ps

module test_DataMemory;
  reg [31:0] Address;
  reg [31:0] WriteData;
  reg MemWrite;
  reg MemRead;
  reg Startin;
  wire [31:0] ReadData;
  reg clk;

  DataMemory u1 (
      .Address(Address),
      .WriteData(WriteData),
      .MemWrite(MemWrite),
      .MemRead(MemRead),
      .Startin(Startin),
      .ReadData(ReadData),
      .clk(clk)
  );

  always #10 clk = ~clk;

  initial begin
    Startin = 1;
    clk = 1;
    Address = 0;
    WriteData = 0;
    MemWrite = 0;
    MemRead = 0;
    #10;
    Address   = 32'h0000_0004;
    WriteData = 32'hAAAA_AAAA;
    MemWrite  = 1;
    #20;
    Startin  = 0;
    MemWrite = 0;
    Address  = 32'h0000_0004;
    MemRead  = 1;
    #10;
  end
endmodule

