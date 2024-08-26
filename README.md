# Single-Cycle CPU Project

This is a ModelSim project that implements a MIPS single-cycle CPU using Verilog.

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

- Control Unit: The Control module is the brain of the single-cycle MIPS CPU. It generates all the control signals that regulate the datapath based on the current instruction.
- ALU Control: The ALUControl module is responsible for determining the specific operation the ALU should perform for the current instruction.
- Main: The Main module is the top-level module that instantiates the various datapath components (PC, instruction memory, register file, ALU, data memory, etc.) and the Control Unit. It connects the control signals from the Control Unit to the appropriate datapath elements.

## Datapath

![Datapath](https://i.imgur.com/rW6Smwh.jpeg)

## Requirements

- ModelSim
- Verilog compiler
- A basic understanding of Verilog and digital logic

## Running the Project

Clone the project

```bash
git clone https://github.com/vesalbargi/verilog-single-cycle-cpu.git
```

Open ModelSim and load the project

```bash
ModelSim> project open Single_Cycle_Phase_3.mpf
```

Compile all Verilog files

```bash
ModelSim> vlog *.v
```

Run the simulation

```bash
ModelSim> vsim test_Main
ModelSim> run -all
```

## Testing

- Testbenches are provided for each module.
- Ensure all testbenches pass before running the full CPU simulation.

## License

This project is licensed under the MIT License.

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
