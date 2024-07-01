module Main (
    input clk,
    input startin,
    input [4:0] regNo,
    output [31:0] val
);
  wire [31:0] instruction;
  wire [31:0] pc_out, pc_next, pc_plus_4, branch_target;
  wire [31:0] sign_ext_imm, sign_ext_shifted;
  wire [31:0] reg_data1, reg_data2, alu_operand2, write_data;
  wire [ 4:0] write_reg;
  wire [ 3:0] alu_ctrl;
  wire [31:0] alu_out;
  wire [31:0] mem_read_data;
  wire reg_dst, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write, zero;
  wire [1:0] alu_op;
  wire [31:0] branch_mux_out;
  wire [27:0] jump_address_shifted;
  wire [31:0] jump_address;
  wire jump;

  PC pc (
      .in(pc_next),
      .clk(clk),
      .startin(startin),
      .out(pc_out)
  );

  InstructionMemory instruction_memory (
      .address(pc_out),
      .startin(startin),
      .instruction(instruction)
  );

  Add pc_adder (
      .digit1(pc_out),
      .digit2(32'd4),
      .result(pc_plus_4)
  );

  SignExtend sign_extend (
      .in(instruction[15:0]),
      .result(sign_ext_imm)
  );

  ShiftLeft2 shift_left2 (
      .in (sign_ext_imm),
      .out(sign_ext_shifted)
  );

  Add branch_adder (
      .digit1(pc_plus_4),
      .digit2(sign_ext_shifted),
      .result(branch_target)
  );

  RegisterFile register_file (
      .Read1(instruction[25:21]),
      .Read2(instruction[20:16]),
      .WriteReg(write_reg),
      .WriteData(write_data),
      .RegWrite(reg_write),
      .startin(startin),
      .clk(clk),
      .regNo(regNo),
      .Data1(reg_data1),
      .Data2(reg_data2),
      .val(val)
  );

  ALUControl alu_control (
      .Func(instruction[5:0]),
      .Aluop(alu_op),
      .Alucontrol(alu_ctrl)
  );

  ALU alu (
      .in1(reg_data1),
      .in2(alu_operand2),
      .operation(alu_ctrl),
      .out(alu_out),
      .zero(zero)
  );

  DataMemory data_memory (
      .Address(alu_out),
      .WriteData(reg_data2),
      .MemWrite(mem_write),
      .MemRead(mem_read),
      .Startin(startin),
      .clk(clk),
      .ReadData(mem_read_data)
  );

  Control control_unit (
      .instruction31_26(instruction[31:26]),
      .regdst(reg_dst),
      .jump(jump),
      .branch(branch),
      .memread(mem_read),
      .memtoreg(mem_to_reg),
      .aluop(alu_op),
      .memwrite(mem_write),
      .alusrc(alu_src),
      .regwrite(reg_write)
  );

  Mux5 reg_dst_mux (
      .input1(instruction[20:16]),
      .input2(instruction[15:11]),
      .op(reg_dst),
      .out(write_reg)
  );

  Mux32 alu_src_mux (
      .input1(reg_data2),
      .input2(sign_ext_imm),
      .op(alu_src),
      .out(alu_operand2)
  );

  Mux32 mem_to_reg_mux (
      .input1(alu_out),
      .input2(mem_read_data),
      .op(mem_to_reg),
      .out(write_data)
  );

  Shift26to28 shift_jump (
      .in (instruction[25:0]),
      .out(jump_address_shifted)
  );

  assign jump_address = {pc_plus_4[31:28], jump_address_shifted};

  Mux32 branch_mux (
      .input1(pc_plus_4),
      .input2(branch_target),
      .op(branch & zero),
      .out(branch_mux_out)
  );

  Mux32 jump_mux (
      .input1(branch_mux_out),
      .input2(jump_address),
      .op(jump),
      .out(pc_next)
  );
endmodule
