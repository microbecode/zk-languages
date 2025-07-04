# Cairo language from Starkware

Cairo is a ZK language used in the [Starknet](https://www.starknet.io/en) L2 blockchain. It does not support privacy.

Cairo can be used as stand-alone locally, or for Starknet smart contracts.

## Stand-alone usage

1. Follow the official installation instructions to install Scarb with [starkup](https://docs.swmansion.com/scarb/download.html#install-via-starkup-installation-script). Scarb is Cairo's unofficial package manager
1. Run `scarb build`. This builds the program
1. Run `scarb execute --print-program-output --arguments 2,3`. This runs the program and generates an execution folder inside the `target` folder.
1. Run `scarb prove --execution-id 1` to generate a proof for the execution. This utilizes the [S-two](https://github.com/starkware-libs/stwo) prover.
1. Run `scarb verify --execution-id 1` to verify the generated proof.

## Contract usage

This works the same as stand-alone usage, except that you can't run the program directly.

### Deployment

1. Install the required tooling with starkup: https://docs.starknet.io/guides/quickstart/environment-setup/#installing_scarb_and_starknet_foundry
1. Generate a local wallet: `sncast account create --network=sepolia --name=sepolia`
1. Get testnet STRK tokens for the generated address: https://starknet-faucet.vercel.app/
1. Deploy the account: `sncast account deploy --network sepolia --name sepolia`
1. Declare your contract to the network: `sncast --account=sepolia declare --contract-name=Multiply --network=sepolia`. If you didn't make any changes in the contract, this should give an error, since a contract needs to be declared only once.
1. Deploy your contract: `sncast --account=sepolia deploy --class-hash=0x048d2cc3ec5c9d3de3a9f7626f49b080951e7e706fb314f045925a36a80123a5 --network=sepolia`

An example deployment can be found [here](https://sepolia.starkscan.co/contract/0x02adf1704c89117e67541b732eb98f573f13eced3d82f00fcc503db11618d887).

## Overview

### Standalone program

The program itself is in the "src" folder.

### Inputs

All inputs are given as command-line parameters. All inputs are public, since Cairo does not support privacy.

### Outputs

Outputs are logged in the console.

### Proof

Proofs are generated under the `target/executionX` folder, where `X` is the execution's index.
