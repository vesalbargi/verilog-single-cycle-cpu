`timescale 1ns / 1ps

module test_Control;
  reg [5:0] instruction31_26;
  wire regdst;
  wire jump;
  wire branch;
  wire memread;
  wire memtoreg;
  wire [1:0] aluop;
  wire memwrite;
  wire alusrc;
  wire regwrite;

  Control u1 (
      .instruction31_26(instruction31_26),
      .regdst(regdst),
      .jump(jump),
      .branch(branch),
      .memread(memread),
      .memtoreg(memtoreg),
      .aluop(aluop),
      .memwrite(memwrite),
      .alusrc(alusrc),
      .regwrite(regwrite)
  );

  initial begin
    instruction31_26 = 6'b000000;
    #10;
    instruction31_26 = 6'b100011;
    #10;
    instruction31_26 = 6'b101011;
    #10;
    instruction31_26 = 6'b000100;
    #10;
    instruction31_26 = 6'b000010;
    #10;
  end
endmodule

