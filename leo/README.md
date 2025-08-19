# Leo language from Aleo

Leo is a ZK language used in the [Aleo](https://aleo.org/) L1 blockchain. It enables full privacy for transactions. The programs themselves are public.

Leo can be used as stand-alone locally, or for Aleo smart contracts.

## Stand-alone usage

1. Follow the official installation instructions to install [Leo](https://docs.leo-lang.org/getting_started/installation)
1. Run `leo run main 2u32 3u32` to execute the program without proofs
1. Run `leo execute main 2u32 3u32 --print` to generate proofs for the program execution

Note that the private key used in `.env` is public and used by any developer.

## Contract usage

1. Go to the `contract` folder.
1. Deploy the contract with `leo deploy --broadcast`.

Note that the private key used in `.env` is public and used by any developer. Its corresponding account may or may not have (testnet) assets.

If you get issues regarding insufficient fees, you need to create your own account and find testnet tokens for it. Faucets can be found at https://developer.aleo.org/guides/introduction/quick_start/#2-seed-your-wallet-with-testnet-credits . Change the private key in `.env`.

An example deployment can be seen at https://explorer.provable.com/transaction/at1xm637u7hv0z3njfj5qkl52utxgj0254q7wjhs2ge4t8jytm8cv9sy7hm56 

## Stand-alone program overview

### ZK program

The program itself is in the "src" folder.

#### Intermediary format

The original Leo program is first compiled into an intermediary format. In this case, the format is Aleo. That's generated in the "build" folder.

### Inputs

Inputs (both public and private) are given to the 'main' function through the file in folder "inputs".

### Outputs

Outputs are displayed in the command line. There is also folder "outputs", but nothing gets generated there - unsure what is its function.
