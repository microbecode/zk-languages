# ZoKrates language

Zokrates is a stand-alone ZK language. It enables full privacy for operations.

There is no native ecosystem/network/blockchain around Zokrates. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

1. Follow the official installation instructions to install [Zokrates toolbox](https://zokrates.github.io/gettingstarted.html)
1. Run `zokrates compile -i root.zok`. This compiles your program
1. Run `zokrates setup`. This prepares the trusted setup ceremony.
1. Run `zokrates compute-witness -a 2 3`. This executes the program, generating witness files.
1. Run `zokrates generate-proof`. This generates a `proof.json` file with the actual proof for the program execution
1. Run `zokrates verify`. This verifies the proof with the verifier inputs. Using incorrect verifier inputs, outputs or wrong proof fails the verification.
1. If you wish, you can also generate a Solidity verifier program by `zokrates export-verifier`. This gets generated in the `verifier.sol` file. Note that this verifier is program-specific, and will not work with any other program than the one you used when generating the verifier.

## Overview

### ZK program

The program itself is in `root.zok`

#### Intermediary format

The original Noir program is first compiled into an intermediary format. In this case, the format is R1CS.

### Inputs

Inputs (both public and private) are given to the program via command line parameters

### Outputs

Unfortunately, the output is not visible in human-readable format.

### Proof

The proof string itself is generated in the `proof.json` file.
