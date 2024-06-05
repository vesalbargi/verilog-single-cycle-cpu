module ALU (
    input [31:0] in1,
    input [31:0] in2,
    input [2:0] operation,
    output reg [31:0] out,
    output reg zero
);

  always @(*) begin
    case (operation)
      3'b000:  out <= in1 + in2;
      3'b001:  out <= in1 - in2;
      3'b010:  out <= in1 & in2;
      3'b011:  out <= in1 | in2;
      default: out <= 32'b0;
    endcase
    zero <= (out == 32'b0);
  end
endmodule
