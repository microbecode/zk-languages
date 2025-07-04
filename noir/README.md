# Noir language from Aztec

Noir is a ZK language used in the [Aztec](https://aztec.network/) L2 blockchain. It enables full privacy for transactions.

Stand-alone usage is supported, but it's also possible to use Noir to interface with the Aztec blockchain.

## Stand-alone usage

1. Follow the official installation instructions to install [Nargo](https://noir-lang.org/docs/getting_started/quick_start/), which is Noir's command line utility. Install also the Barretenberg proving backend.
1. Generate the witness: `nargo execute`. This generates a witness file (`multiply.gz`) in the "target" folder.
1. Run `bb prove -b ./target/multiply.json -w ./target/multiply.gz -o ./target`. This generates needed proof in the `target` folder.
1. Run `bb write_vk -b ./target/multiply.json -o ./target` to generate a verification key.
1. Run `bb verify -k ./target/vk -p ./target/proof`. This verifies the proof with the verifier inputs. Using incorrect proof fails the verification.
1. If you wish, you can also generate a Solidity verifier program by `bb write_solidity_verifier -k ./target/vk -o ./target/Verifier.sol`. This gets generated in the `target` folder as `Verifier.sol`. Note that this verifier is program-specific, and will not work with any other Noir program.

## Contract usage

1. Go to the `contracts/multiply` folder.
1. Compile the contract: `aztec-nargo compile`
1. Install and run Docker
1. Follow the instructions at https://docs.aztec.network/dev_docs/getting_started/quickstart . Install and run the sandbox, then create an account 
1. In te same folder, execute `aztec-wallet deploy ./target/multiply-Multiply.json --from accounts:my-wallet -a multiply` to deploy the contract in the sandbox
1. Execute the contract function with a transaction: `aztec-wallet send multiply --from accounts:my-wallet --contract-address multiply --args 2 3`. If you want to to see the returned value, it's easiest to just simulate the transaction: replace `send` with `simulate` in the command.


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

## Contract program overview

The program includes a lot of stuff which is bound to disappear, once the ecosystem matures. There are a lot of definitions and files which seem superfluous. The main logic is in one function in `main.nr`, but a lot of weird stuff is required around it.
