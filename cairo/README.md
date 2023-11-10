# Cairo language from Starkware

Cairo is a ZK language used in the [Starknet](https://www.starknet.io/en) L2 blockchain. It does not support privacy.

Cairo can be used as stand-alone locally, or for Starknet smart contracts.

## Usage

1. Follow the official installation instructions to install [Scarb](https://docs.swmansion.com/scarb/download.html), which is Cairo's unofficial package manager
1. Run `nargo prove`. This generates a `proofs` folder with the actual proof for the program execution, and `Verifier.toml` which has inputs for the verifier.
1. Run `nargo verify`. This verifies the proof with the verifier inputs. Using incorrect verifier inputs, outputs or wrong proof fails the verification.
1. If you wish, you can also generate a Solidity verifier program by `nargo codegen-verifier`. This gets generated in the `contract` folder. Note that this verifier is program-specific, and will not work with any other Noir program than the one you used when generating the verifier.

## Overview

### ZK program

The program itself is in the "src" folder.

#### Intermediary format

The original Noir program is first compiled into an intermediary format. In this case, the format is ACIR. That is not explicitly generated in the project folder.

### Inputs

Inputs (both public and private) are given to the 'main' function through the file `Prover.toml`.

### Outputs

Outputs and public inputs are displayed in the file `Verifier.toml`. This is the input file used when verifying a proof.

### Proof

The proof string itself is generated in the `proofs` folder.
