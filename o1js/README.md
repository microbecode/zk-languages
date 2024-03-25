# o1js language from O(1) Labs

o1js is a ZK framework used in the [Mina](https://minaprotocol.com/) L1 blockchain. It enables full privacy for transactions.

The language can be used as stand-alone or in Mina smart contracts.

Unfortunately, most documentation and examples are for utilizing the language as part of a Mina smart contract: stand alone usage is poorly documented.

## Stand-alone usage

1. Go to folder `multiply`
1. Install packages with `npm i`
1. Run `node src/zkProgram.js`. This generates a proof and verifies it. All data is output to console.

At the time of writing, the only available verifier is the JS verifier from O(1) Labs.

## Contract usage

The contract version is located in folder `contract`. It can be deployed by following the instructions at https://docs.minaprotocol.com/zkapps/how-to-deploy-a-zkapp .

An example deployment can be seen at https://minascan.io/berkeley/tx/5JvNvMQstQWg5xN21n4BNTuT92t5yL3RW13yBovxoz27kZDReW2s?type=zk-tx .

## Overview

### Stand-alone ZK program

The program itself is in the "src" folder.

#### Intermediary format

There is no intermediary format. The JS itself is the ZK program.

### Inputs

Inputs (both public and private) are given to the program in a bit weird way and it is difficult to figure out in which order they are utilized in the program.

### Outputs

The outputs are defined also in a bit weird way, but they are readily available from the proof object.

### Proof

The proof string itself is generated in the script.
