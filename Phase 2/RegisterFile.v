module RegisterFile (
    input [4:0] Read1,
    input [4:0] Read2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    input RegWrite,
    output [31:0] Data1,
    output [31:0] Data2,
    input clk,
    input [4:0] regNo,
    output [31:0] val
);
  reg [31:0] registers[31:0];

  assign Data1 = registers[Read1];
  assign Data2 = registers[Read2];
  assign val   = registers[regNo];

  always @(posedge clk) begin
    if (RegWrite) begin
      registers[WriteReg] <= WriteData;
    end
  end
endmodule
