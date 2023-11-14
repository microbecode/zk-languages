# Powdr language

Powdr is a stand-alone ZK language. It enables full privacy for operations.

Powdr utilizes a ZK Virtual Machine. When generating proofs, the proof is generated for the whole program.

Unfortunately, the language itself is quite much work in progress. Unsure if, for example, program outputs are currently supported at all. Also unsure if data is private or public.

## Usage

1. Follow the official installation instructions to install [Powdr](https://docs.powdr.org/installation.html).
1. Run `powdr pil multiply.asm --field gl --force --inputs 0 +--prove-with estark` in folder `multiply`. This generates all of the needed files, including proofs.

Unfortunately, no built-in verifier generation is provided with Powdr. One could generate a verifier with some other tooling, by utilizing the generated intermediary files.

## Overview

### ZK program

The program itself is in the `multiply.asm` file.

### Inputs

The inputs are provided as command-line arguments.

### Outputs

Outputs are not supported by the language yet.

### Proof

The proof string itself is generated in the `proof.bin` file.
