# o1js language from O(1) Labs

o1js is a ZK framework used in the [Mina](https://minaprotocol.com/) L1 blockchain. It enables full privacy for transactions.

The language can be used as stand-alone or in Mina smart contracts.

Unfortunately, most documentation and examples are for utilizing the language as part of a Mina smart contract: stand alone usage is poorly documented. Most stand-alone usage docs can be found through the [recursion example](https://docs.minaprotocol.com/zkapps/tutorials/recursion).

## Stand-alone usage

1. Go to folder `multiply`
1. Install packages with `npm i`
1. Build the project with `npx tsc`
1. Run `node build/src/zkProgram.js`. This generates a proof and verifies it. All data is output to console.

At the time of writing, the only available verifier is the JS verifier from O(1) Labs.

## Contract usage

The contract version is located in folder `contract`. 
To follow the contract:
1. Make sure you have the o1js ZKApp CLI installed.
1. In general, follow the instructions at https://docs.minaprotocol.com/zkapps/how-to-deploy-a-zkapp .
    1. Give name `multiply`
    1. Choosen testnet
    1. As GraphQL API, you can use https://api.minascan.io/node/devnet/v1/graphql
    1. As transaction fee, use 0.1
    1. Choose to create a new fee payer
    1. Call the payer `mina`
1. Click the provided faucet link to get some tokens. Wait for a few minutes.
1. Deploy with `zk deploy`

An example deployment can be seen at https://minascan.io/devnet/tx/5JuFaNv4X3t3g31YU9UFH2WiFhjFHWuokprLNFiJACTdGFMEgbnV?type=zk-tx

## Overview

### Stand-alone ZK program

The program itself is in the "src" folder.

#### Intermediary format

There is no intermediary format. The JS/TS itself is the ZK program.

### Inputs

Inputs (both public and private) are given to the program in a bit weird way and it is difficult to figure out in which order they are utilized in the program.

### Outputs

The outputs are defined also in a bit weird way, but they are readily available from the proof object.

### Proof

The proof string itself is generated in the script.
