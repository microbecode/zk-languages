# Powdr language

Powdr is a stand-alone ZK language. It enables full privacy for operations.

Powdr utilizes a ZK Virtual Machine. When generating proofs, the proof is generated for the whole program.

There is no native ecosystem/network/blockchain around Powdr. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

1. Follow the official installation instructions to install [Powdr](https://docs.powdr.org/installation_sdk.html). Install the non-SIMD version (Plonky3).
1. Enter the `multiply` folder
1. Compile and generate witness: `powdr pil --inputs 2,3 multiply.asm`
1. Generate verification key: `powdr verification-key --backend plonky3 multiply.asm`
1. Generate proof: `powdr prove --vkey vkey.bin --backend plonky3  multiply.pil`
1. Verify the proof: `powdr verify --publics 6 --proof multiply_proof.bin --vkey vkey.bin --backend plonky3 multiply.pil`

## Overview

### ZK program

The program itself is in the `multiply.asm` file.

### Inputs

The inputs are provided as command-line arguments.

### Outputs

In theory, outputs should be given in the command line. However, I did not get public outputs working from the code. Instead, the verification command gives the public output as parameter.

### Proof

The proof string itself is generated in the `multiply_proof.bin` file.
