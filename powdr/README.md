# Powdr language

Powdr is a stand-alone ZK language. It enables full privacy for operations.

Powdr utilizes a ZK Virtual Machine. When generating proofs, the proof is generated for the whole program.

Unfortunately, the language itself is quite much work in progress. Unsure if, for example, program outputs are currently supported at all. Also unsure if data is private or public.

There is no native ecosystem/network/blockchain around Powdr. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

1. Follow the official installation instructions to install [Powdr](https://docs.powdr.org/installation.html).
1. Run a trusted setup: `powdr setup 16 --backend halo2 --field bn254`
1. Generate witness: `powdr pil multiply.asm --field gl --force --inputs 2,3,6`
1. Calculate a verification key: `powdr verification-key multiply.asm --field bn254 --backend halo2 --params params.bin`
1. Generate the proof: `powdr prove multiply.asm --field bn254 --backend halo2 --params params.bin --vkey vkey.bin`

TODO: verification.

## Overview

### ZK program

The program itself is in the `multiply.asm` file.

### Inputs

The inputs are provided as command-line arguments.

### Outputs

Outputs are not supported by the language yet(?). Therefore, the expected output is given as the third input, and its correctness is asserted inside the program.

### Proof

The proof string itself is generated in the `proof.bin` file.
