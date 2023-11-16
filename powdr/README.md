# Powdr language

Powdr is a stand-alone ZK language. It enables full privacy for operations.

Powdr utilizes a ZK Virtual Machine. When generating proofs, the proof is generated for the whole program.

Unfortunately, the language itself is quite much work in progress. Unsure if, for example, program outputs are currently supported at all. Also unsure if data is private or public.

There is no native ecosystem/network/blockchain around Powdr. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

1. Follow the official installation instructions to install [Powdr](https://docs.powdr.org/installation.html).
1. Run `powdr pil multiply.asm --field gl --force --inputs 2,3,6 --prove-with estark` in folder `multiply`. This generates all of the needed files, including proofs.

Unfortunately, no built-in verifier generation is provided with Powdr. One could generate a verifier with some other tooling, by utilizing the generated intermediary files.

## Overview

### ZK program

The program itself is in the `multiply.asm` file.

### Inputs

The inputs are provided as command-line arguments.

### Outputs

Outputs are not supported by the language yet. Therefore, the expected output is given as the third input, and its correctness is asserted inside the program.

### Proof

The proof string itself is generated in the `proof.bin` file.
