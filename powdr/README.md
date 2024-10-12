# Powdr language

Powdr is a stand-alone ZK language. It enables full privacy for operations.

Powdr utilizes a ZK Virtual Machine. When generating proofs, the proof is generated for the whole program.

There is no native ecosystem/network/blockchain around Powdr. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

1. Follow the official installation instructions to install [Powdr](https://docs.powdr.org/installation.html).
1. Run a trusted setup: `powdr setup 8 --backend halo2 --field bn254`
1. Execute the program: `powdr pil multiply.asm --field bn254 --force --inputs 2,3`
1. Generate a verification key: `powdr verification-key multiply.asm --field bn254 --backend halo2 --params params.bin`
1. Generate proof: `powdr prove multiply.asm --field bn254 --backend halo2 --params params.bin --vkey vkey.bin`
1. Verify the proof: `powdr verify multiply.asm --field bn254 --backend halo2 --vkey "vkey.bin" --params "params.bin" --proof "multiply_proof.bin" --publics 6`


## Overview

### ZK program

The program itself is in the `multiply.asm` file.

### Inputs

The inputs are provided as command-line arguments.

### Outputs

Outputs are given to the program as command-line arguments. The system verifies that the given outputs match the real outputs.

### Proof

The proof string itself is generated in the `multiply_proof.bin` file.
