# Cairo language from Starkware

Cairo is a ZK language used in the [Starknet](https://www.starknet.io/en) L2 blockchain. It does not support privacy.

Cairo can be used as stand-alone locally (without proofs), or for Starknet smart contracts.

## Stand-alone usage

1. Follow the official installation instructions to install [Scarb](https://docs.swmansion.com/scarb/download.html), which is Cairo's unofficial package manager
1. Run `scarb build`. This builds the program
1. Run `scarb cairo-run`. This runs the program. The inputs are inside the program, since Cairo currently doesn't support inputting parameters directly

## Contract usage

This works the same as stand-alone usage, except that you can't run the program directly.

### Deployment

1. Install the required tooling (starkli and scarb): https://book.starknet.io/ch02-05-testnet-deployment.html
1. Install a wallet with ArgentX: https://docs.starknet.io/documentation/quick_start/set_up_an_account/
1. Get testnet tokens: https://blastapi.io/faucets/starknet-sepolia-eth
1. Transfer tokens to some other address to get your account contract deployed
1. Export your wallet's private key. You'll need it in the next step
1. Prepare your account locally. Here's an example I used: `starkli account fetch 0xPUBLIC_KEY_OF_YOUR_WALLET --output ~/.starkli-wallets/deployer/account.json --rpc https://starknet-sepolia.public.blastapi.io`
1. Declare your contract to the network. Here's an example I used: `starkli declare --account ~/.starkli-wallets/deployer/account.json --keystore ~/.starkli-wallets/deployer/keystore.json --rpc https://starknet-sepolia.public.blastapi.io ./target/dev/multiply_Multiply.contract_class.json`
1. Deploy your contract. Here's an example I used: `starkli deploy --account /home/laurip/.starkli-wallets/deployer/account.json --keystore ~/.starkli-wallets/deployer/keystore.json --rpc https://starknet-goerli.g.alchemy.com/v2/MYKEY CLASSHASH`

An example deployment can be found [here](https://sepolia.starkscan.co/contract/0x0067560bce438b6464423ba1b0d97b291b14c699856e2b59ce2760554154fe45).

Note that at some point Starknet deployments will require STRK tokens, but at the time of writing one can use Eth as well.

## Overview

### ZK program

The program itself is in the "src" folder.

### Inputs

All inputs are given inside the program itself. All inputs are public, since Cairo does not support privacy.

### Outputs

Outputs are logged in the console.

### Proof

Unfortunately, stand-alone usage and local contract usage don't generate proofs. Proofs are generated only for Cairo program executions inside the Starknet blockchain. There is no local prover available currently.
