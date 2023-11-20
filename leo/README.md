# Leo language from Aleo

Leo is a ZK language used in the [Aleo](https://aleo.org/) L1 blockchain. It enables full privacy for transactions. The programs themselves are public.

Leo can be used as stand-alone locally, or for Aleo smart contracts.

## Stand-alone usage

1. Follow the official installation instructions to install [Leo](https://developer.aleo.org/leo/installation)
1. Run `leo run main` to execute the program without proofs
1. Run `leo execute main` to generate and verify proofs for the program execution

## Contract usage

Some of the documentation is a bit outdated and you'll probably need to search their Discord for answers.

Remember that all Aleo programs need to have a unique name. Rename this program if you want to redeploy it.

An example deployment has been done at https://explorer.aleo.org/transaction/at1v3k0wqg3s4zdwg9whede30u2npcs55gzyj0e2rf743f73mz5tvgs3rshvk

How to deploy your own version:

1. Figure out how to get testnet tokens. Faucet only gives them to people living in the States.
1. Install Leo according to the instructions above
1. Install SnarkOS according to the instructions at https://github.com/AleoHQ/snarkos
1. Follow instructions at https://developer.aleo.org/testnet/getting_started/deploy_execute_demo

## Stand-alone program overview

### ZK program

The program itself is in the "src" folder.

#### Intermediary format

The original Leo program is first compiled into an intermediary format. In this case, the format is Aleo. That's generated in the "build" folder.

The intermediary format code is public, once deployed to the blockchain. An example can be found [here](https://explorer.aleo.org/program/aleoswap06.aleo).

### Inputs

Inputs (both public and private) are given to the 'main' function through the file in folder "inputs".

### Outputs

Outputs are displayed in the command line. There is also folder "outputs", but nothing gets generated there - unsure what is its function.
