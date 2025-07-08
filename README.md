## Building and running QEMU with Fault Injection support

When you're ready, start the container as daemon:
`docker compose up --build -d`.

Enter a shell with:
`docker exec -it <CONTAINER_NAME> /bin/bash`.

You can now run `qemu-system-riscv32` from the shell.

## Examples
**NOTE:** Examples and instructions will follow.