# Compact language from Midnight

Compact is a ZK language used in the [Midnight](https://midnight.network/) L1 blockchain. It enables full privacy for transactions.

Midnight is tightly coupled to the Cardano ecosystem.

Stand-alone usage is not supported - only on-chain smart contracts.

## Contract usage

The contract can be found in the `contract` folder.

The syntax is straightforward, for a simple contract like this. One interesting aspect is that Compact tries to avoid overflows as much as possible (even if overflows are technically not possible in ZK) - multiplying two 64bit numbers by default returns a 128bit number.

Private function parameters can be supplied by a special *witness*  construct. Revealing that data (even if it's just used as a multiplier for a public value) has to be explicitly done through a *disclose* function.

### Deployment

Deploying a contract to the Midnight testnet involves a lot of steps and complicated logic. Luckily, a scaffold project has been built to ease the logic: https://github.com/kaleababayneh/create-midnight-app .

Follow the instructions in the scaffold project, but besides those, remember to do these steps first:

1. Install the [compiler](https://docs.midnight.network/develop/tutorial/building/) version 0.23.
    1. Remember to set it in your PATH, either permanently or just for the shell session.
1. Run a local [proof service](https://docs.midnight.network/quickstart/builder-quickstart#set-up-the-proof-server) version 3.0.7.

Note that it takes some 700 transactions for new faucet funds to get registered, via the scaffold scripts.

Unfortunately, I never got the deployment fully working - everything else worked but the deployment itself never completed.
