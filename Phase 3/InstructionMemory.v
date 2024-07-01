module InstructionMemory (
    input [31:0] address,
    input startin,
    output [31:0] instruction
);
  reg [7:0] memory[0:79];

  always @(*) begin
    if (startin) begin
      {memory[0], memory[1], memory[2], memory[3]} <= 32'b10001110000010000000000000000000; // lw $t0, 0($s0)
      {memory[4], memory[5], memory[6], memory[7]} <= 32'b10001110000010010000000000000100; // lw $t1, 4($s0)
      {memory[8], memory[9], memory[10], memory[11]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[12], memory[13], memory[14], memory[15]} <= 32'b10001110000010010000000000001000; // lw $t1, 8($s0)
      {memory[16], memory[17], memory[18], memory[19]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[20], memory[21], memory[22], memory[23]} <= 32'b10001110000010010000000000001100; // lw $t1, 12($s0)
      {memory[24], memory[25], memory[26], memory[27]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[28], memory[29], memory[30], memory[31]} <= 32'b10001110000010010000000000010000; // lw $t1, 16($s0)
      {memory[32], memory[33], memory[34], memory[35]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[36], memory[37], memory[38], memory[39]} <= 32'b10001110000010010000000000010100; // lw $t1, 20($s0)
      {memory[40], memory[41], memory[42], memory[43]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[44], memory[45], memory[46], memory[47]} <= 32'b10001110000010010000000000011000; // lw $t1, 24($s0)
      {memory[48], memory[49], memory[50], memory[51]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[52], memory[53], memory[54], memory[55]} <= 32'b10001110000010010000000000011100; // lw $t1, 28($s0)
      {memory[56], memory[57], memory[58], memory[59]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[60], memory[61], memory[62], memory[63]} <= 32'b10001110000010010000000000100000; // lw $t1, 32($s0)
      {memory[64], memory[65], memory[66], memory[67]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[68], memory[69], memory[70], memory[71]} <= 32'b10001110000010010000000000100100; // lw $t1, 36($s0)
      {memory[72], memory[73], memory[74], memory[75]} <= 32'b00000001000010010100000000100000; // add $t0, $t0, $t1
      {memory[76], memory[77], memory[78], memory[79]} <= 32'b10101110000010000000000000101000; // sw $t0, 40($s0)
    end
  end
  assign instruction = {memory[address], memory[address+1], memory[address+2], memory[address+3]};
endmodule

/*
lw $t0, 0($s0)
lw $t1, 4($s0)
add $t0, $t0, $t1

lw $t1, 8($s0)
add $t0, $t0, $t1

lw $t1, 12($s0)
add $t0, $t0, $t1

lw $t1, 16($s0)
add $t0, $t0, $t1

lw $t1, 20($s0)
add $t0, $t0, $t1

lw $t1, 24($s0)
add $t0, $t0, $t1

lw $t1, 28($s0)
add $t0, $t0, $t1

lw $t1, 32($s0)
add $t0, $t0, $t1

lw $t1, 36($s0)
add $t0, $t0, $t1

sw $t0, 40($s0)
*/
