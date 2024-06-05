module DataMemory (
    input [31:0] Address,
    input [31:0] WriteData,
    input MemWrite,
    input MemRead,
    output [31:0] ReadData,
    input clk
);
  reg [31:0] memory[0:1023];

  assign ReadData = (MemRead) ? memory[Address[11:2]] : 32'b0;

  always @(posedge clk) begin
    if (MemWrite) begin
      memory[Address[11:2]] <= WriteData;
    end
  end
endmodule
