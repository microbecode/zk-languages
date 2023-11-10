# o1js language from O(1) Labs

o1js is a ZK language used in the [Mina](https://minaprotocol.com/) L1 blockchain. It enables full privacy for transactions.

The language is not often used as stand-alone; all documentation and examples are for utilizing it as part of a Mina smart contract. This folder demonstrates its use as stand-alone.

## Usage

1. Install packages with `npm i`
1. Run `node src/zkProgram.js`. This generates a proof and verifies it. All data is output to console.

Unfortunately, at the time of writing, the only available verifier is the JS verifier from O(1) Labs.

## Overview

### ZK program

The program itself is in the "src" folder.

#### Intermediary format

There is no intermediary format. The JS itself is the ZK program.

### Inputs

Inputs (both public and private) are given to the program in a bit weird way and it is difficult to figure out in which order they are utilized in the program.

### Outputs

The outputs are defined also in a bit weird way, but they are readily available from the proof object.

### Proof

The proof string itself is generated in the script.
