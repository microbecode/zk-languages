# Noir language from Aztec

Noir is a ZK language used in the [Aztec](https://aztec.network/) L2 blockchain. It enables full privacy for transactions.

Stand-alone usage is supported, but it's also possible to use Noir to interface with the Aztec blockchain.

## Stand-alone usage

1. Follow the official installation instructions to install [Nargo](https://noir-lang.org/docs/getting_started/quick_start/), which is Noir's command line utility. Install also the Barretenberg proving backend.
1. Go to the `standalone` folder.
1. Generate the witness: `nargo execute`. This generates a witness file (`multiply.gz`) in the "target" folder.
1. Run `bb prove -b ./target/multiply.json -w ./target/multiply.gz -o ./target`. This generates needed proof in the `target` folder.
1. Run `bb write_vk -b ./target/multiply.json -o ./target` to generate a verification key.
1. Run `bb verify -k ./target/vk -p ./target/proof`. This verifies the proof with the verifier inputs. Using incorrect proof fails the verification.
1. If you wish, you can also generate a Solidity verifier program by `bb write_solidity_verifier -k ./target/vk -o ./target/Verifier.sol`. This gets generated in the `target` folder as `Verifier.sol`. Note that this verifier is program-specific, and will not work with any other Noir program.

## Contract usage

1. Go to the `contract` folder.
1. Install and run Docker
1. Install the required Aztec tooling by following the instructions in [this chapter](https://docs.aztec.network/developers/getting_started).
1. Follow the instructions at https://docs.aztec.network/developers/guides/getting_started_on_testnet until Step 1 is completed. These prepare your wallet for contract deployments.
1. Compile the contract with `aztec-nargo build`
1. Deploy the contract to testnet with `aztec-wallet deploy --node-url $NODE_URL --from accounts:my-wallet --payment method=fpc-sponsored,fpc=contracts:sponsoredfpc --no-wait ./target/multiply-Multiply.json`
1. You can interact with the deployed contract by running: `aztec-wallet send multiply --node-url https://aztec-alpha-testnet-fullnode.zkv.xyz --from accounts:my-wallet --no-wait --contract-address 0x2d299d46a68b4a442dc580d62a6e4fb174ce5f685c3b5d54f692dcda1ea4d756 --args 2 3 --contract-artifact` . Remember to replace your contract address and that it may take half an hour for any transaction to be finalized.

## Stand-alone program overview

### ZK program

The program itself is in the "src" folder.

#### Intermediary format

The original Noir program is first compiled into an intermediary format. In this case, the format is ACIR. That is not explicitly generated in the project folder.

### Inputs

Inputs (both public and private) are given to the 'main' function through the file `Prover.toml`.

### Outputs

Outputs and public inputs are displayed in the file `./target/proof_fields`. The first value is the public input, the second value is the public output. The rest of the values are for internal usage.

### Proof

The proof string itself is generated in the `target` folder as file `proof`. The `proof_fields.json` file is for inspecting the inputs and outputs visually.
