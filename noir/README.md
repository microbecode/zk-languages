# Noir language from Aztec

Noir is a ZK language used in the [Aztec](https://aztec.network/) L2 blockchain. It enables full privacy for transactions.

At the time of writing, a local sandbox is available, but no public testnet.

## Stand-alone usage

1. Follow the official installation instructions to install [Nargo](https://noir-lang.org/docs/getting_started/installation/), which is Noir's command line utility.
1. Install a [Barretenberg proving backend] with bbup: (https://github.com/AztecProtocol/aztec-packages/blob/master/barretenberg/bbup/README.md).
1. At the time of writing, `bb` wasn't added to PATH with the installation. Running `bbup` gives you the installation folder - add that to your PATH manually.
1. Generate the witness: `nargo execute witness-multiply`. This generates a witness file in the "target" folder.
1. Run `bb prove_output_all -b ./target/multiply.json -w ./target/witness-multiply.gz -o ./target`. This generates needed proof and verification files in the `target` folder.
1. Run `bb verify -k ./target/vk -p ./target/proof`. This verifies the proof with the verifier inputs. Using incorrect proof fails the verification.
1. If you wish, you can also generate a Solidity verifier program by `bb contract`. This gets generated in the `target` folder as `contract.sol`. Note that this verifier is program-specific, and will not work with any other Noir program than the one you used when generating the verifier.

## Contract usage

1. Go to the `contracts/multiply` folder.
1. Compile the contract: `aztec-nargo compile`
1. Install and run Docker
1. Follow the instructions at https://docs.aztec.network/dev_docs/getting_started/quickstart . Install and run the sandbox, then create an account 
1. Open a new terminal. Go to `contract/contracts/counter` folder and execute `aztec-cli compile contracts`
1. In te same folder, execute `aztec-wallet deploy ./target/counter-Counter.json --from accounts:my-wallet --args 1 accounts:my-wallet accounts:last -a counter` to deploy the contract in the sandbox


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
