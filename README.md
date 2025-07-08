## Building and running QEMU with Fault Injection support

When you're ready, start the container as daemon:
`docker compose up --build -d`

Enter a shell with:
`docker exec -it <CONTAINER_NAME> /bin/bash`

You can now run `qemu-system-riscv32` from the shell.

## Running an example

To run one of the test programs, run the following command:

`qemu-system-riscv32 -M sifive_e -kernel /files/C-ADD.elf -nographic`.

Note, that the program will stay in a "while(true)" loop. To terminate QEMU, press Ctrl+a and then x.

### Auto-terminate execution

To automate this, you can spawn a virtual "terminator" device at a specific memory location. It will kill the QEMU simulation when this address is written to by the target. Thus, the command

`qemu-system-riscv32 -M sifive_e -kernel /files/C-ADD.elf -nographic -device terminator,address=0x80000000`

will stop execution on any write to memory location 0x80000000.

### Register, Memory and Instruction Coverage Analysis

To get a summary of all accessed registers and memory locations and the executes instructions, you can issue the following command:

`qemu-system-riscv32 -M sifive_e -kernel /files/C-ADD.elf -device terminator,address=0x80000000 -d in_asm,goldenrun`

### Fault Injection

TBD: Fault injection, fault coverage analysis, etc.