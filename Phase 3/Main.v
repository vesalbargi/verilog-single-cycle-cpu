module Main (
    input clk,
    input startin,
    output reg [4:0] regNo,
    output reg [31:0] val
);

  wire [31:0] instruction;
  wire [5:0] opcode;
  wire [5:0] funct;
  wire [1:0] aluop;
  wire [3:0] alucontrol;

  reg [31:0] memory[0:10];
  reg [31:0] registers[0:31];

  wire regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite;

  assign opcode = instruction[31:26];
  assign funct  = instruction[5:0];

  Control control_unit (
      .instruction31_26(opcode),
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

  ALUControl alu_control_unit (
      .Func(funct),
      .Aluop(aluop),
      .Alucontrol(alucontrol)
  );

  integer i;

  always @(posedge clk) begin
    if (startin) begin
      val = 0;
      for (i = 0; i < 10; i = i + 1) begin
        val = val + memory[i];
      end
      memory[10] = val;
      regNo = 5'd11;
    end
  end
endmodule

