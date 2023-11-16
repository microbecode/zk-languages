# Cairo language from Starkware

Cairo is a ZK language used in the [Starknet](https://www.starknet.io/en) L2 blockchain. It does not support privacy.

Cairo can be used as stand-alone locally (without proofs), or for Starknet smart contracts.

## Stand-alone usage

1. Follow the official installation instructions to install [Scarb](https://docs.swmansion.com/scarb/download.html), which is Cairo's unofficial package manager
1. Run `scarb build`. This builds the program
1. Run `scarb cairo-run`. This runs the program. The inputs are inside the program, since Cairo currently doesn't support inputting parameters directly

## Contract usage

This works the same as stand-alone usage, except that you can't run the program directly.

## Overview

### ZK program

The program itself is in the "src" folder.

### Inputs

All inputs are given inside the program itself. All inputs are public, since Cairo does not support privacy.

### Outputs

Outputs are logged in the console.

### Proof

Unfortunately, stand-alone usage and local contract usage don't generate proofs. Proofs are generated only for Cairo program executions inside the Starknet blockchain. There is no local prover available currently.
