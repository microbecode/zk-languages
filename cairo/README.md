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

Note that these instructions are bound to be deprecated fast. Starknet testnet is switching to Sepolia and the syntax of all tooling changes rapidly.

1. Install the required tooling: https://docs.starknet.io/documentation/quick_start/deploy_a_smart_contract/
1. Install a wallet with ArgentX: https://docs.starknet.io/documentation/quick_start/set_up_an_account/
1. Get testnet tokens: https://www.argent.xyz/learn/how-to-get-testnet-eth-for-starknet/
1. Transfer tokens to some other address to get your account contract deployed
1. Setup an Alchemy RPC node
1. Prepare your account. Here's an example I used: `starkli account fetch 0xPUBLIC_ADDRESS --output ~/.starkli-wallets/deployer/account.json --rpc https://starknet-goerli.g.alchemy.com/v2/MYKEY`
1. Declare your contract. Here's an example I used: `starkli declare --account /home/laurip/.starkli-wallets/deployer/account.json ./target/dev/multiply_Multiply.contract_class.json --keystore ~/.starkli-wallets/deployer/keystore.json --rpc https://starknet-goerli.g.alchemy.com/v2/MYKEY`
1. Deploy your contract. Here's an example I used: `starkli deploy --account /home/laurip/.starkli-wallets/deployer/account.json --keystore ~/.starkli-wallets/deployer/keystore.json --rpc https://starknet-goerli.g.alchemy.com/v2/MYKEY CLASSHASH`

An example deployment can be found [here](https://testnet.starkscan.co/contract/0x07524c59c4d1f248397a0aa68e8a1bd3ae207bc5645c6851e5992ff2bea640bb#class-code-history).

## Overview

### ZK program

The program itself is in the "src" folder.

### Inputs

All inputs are given inside the program itself. All inputs are public, since Cairo does not support privacy.

### Outputs

Outputs are logged in the console.

### Proof

Unfortunately, stand-alone usage and local contract usage don't generate proofs. Proofs are generated only for Cairo program executions inside the Starknet blockchain. There is no local prover available currently.
