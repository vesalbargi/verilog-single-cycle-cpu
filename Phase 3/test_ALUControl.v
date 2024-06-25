`timescale 1ns / 1ps

module test_ALUControl;
  reg  [5:0] Func;
  reg  [1:0] Aluop;
  wire [3:0] Alucontrol;

  ALUControl u1 (
      .Func(Func),
      .Aluop(Aluop),
      .Alucontrol(Alucontrol)
  );

  initial begin
    Aluop = 2'b00;
    Func  = 6'bxxxxxx;
    #10;
    Aluop = 2'b01;
    Func  = 6'bxxxxxx;
    #10;
    Aluop = 2'b10;
    Func  = 6'b100000;
    #10;
    Aluop = 2'b10;
    Func  = 6'b100010;
    #10;
    Aluop = 2'b10;
    Func  = 6'b100100;
    #10;
    Aluop = 2'b10;
    Func  = 6'b100101;
    #10;
    Aluop = 2'b10;
    Func  = 6'b101010;
    #10;
  end

endmodule

