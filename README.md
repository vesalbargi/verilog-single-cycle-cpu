
# Single Cycle CPU Project

This is a ModelSim project that implements a single cycle CPU using Verilog.
## Phase 1

- PC (Program Counter): The program counter is responsible for keeping track of the current instruction being executed.
- ALU (Arithmetic Logic Unit): The ALU performs arithmetic and logical operations on the data.
- Adder: The adder is used to increment the program counter.
- Instruction Memory: The instruction memory stores the instructions to be executed.
## Phase 2

- Mux (Multiplexer): The multiplexer is used to select the correct data path for the instruction.
- Shift: The shift operation is used to shift the data.
- Register File: The register file stores the data.
- Sign Extend: The sign extend operation is used to extend the sign of the data.
- Data Memory: The data memory stores the data.
## Phase 3

### ALU Control:
- Operation Code Decoder: Interprets the function code from the instruction.
- ALU Operation Selector: Determines the specific ALU operation to be performed.
- Control Signal Generator: Produces control signals for the ALU based on the decoded instruction.
- Timing Coordinator: Ensures proper timing of ALU operations within the processor cycle.

### Control Unit:
- Instruction Decoder: Decodes the incoming instruction to determine required actions.
- State Machine: Manages the sequence of operations for each instruction cycle.
- Control Signal Generator: Produces control signals for various components of the processor.
- Pipeline Controller: Manages instruction pipelining (if applicable).
- Exception Handler: Manages interrupts and exceptional conditions.

### Main:
- Program Counter: Keeps track of the address of the next instruction to be executed.
- Instruction Fetch Unit: Retrieves instructions from memory.
- Instruction Decode Unit: Decodes fetched instructions.
- Execution Unit: Performs the actual computation or data manipulation.
- Memory Access Unit: Handles read/write operations to data memory.
- Write Back Unit: Writes results back to the register file.

## Requirements

- ModelSim
- Verilog compiler
- A basic understanding of Verilog and digital logic
## License

This project is licensed under the MIT License.
[MIT](https://choosealicense.com/licenses/mit/)