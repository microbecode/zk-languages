# Noir language from Aztec

Noir is a ZK language used in the [Aztec](https://aztec.network/) L2 blockchain. It enables full privacy for transactions.

At the time of writing, interoperability for Noir smart contracts is under construction. A local sandbox is available, but no testnets.

## Stand-alone usage

1. Follow the official installation instructions to install [Nargo](https://noir-lang.org/getting_started/nargo_installation), which is Noir's command line utility.
1. Run `nargo prove`. This generates a `proofs` folder with the actual proof for the program execution, and `Verifier.toml` which has inputs for the verifier.
1. Run `nargo verify`. This verifies the proof with the verifier inputs. Using incorrect verifier inputs, outputs or wrong proof fails the verification.
1. If you wish, you can also generate a Solidity verifier program by `nargo codegen-verifier`. This gets generated in the `contract` folder. Note that this verifier is program-specific, and will not work with any other Noir program than the one you used when generating the verifier.

## Contract usage

1. Install and run Docker
1. Install the Sandbox by following the instructions at https://docs.aztec.network/dev_docs/getting_started/quickstart
1. Go to `contract` folder and execute `aztec-cli compile contracts`
1. You can deploy locally by `aztec-cli deploy contracts/target/Multiply.json --salt 0`

If you want, you can even interact with the contract by adjusting the instructions at https://docs.aztec.network/dev_docs/getting_started/quickstart#call-a-contract-with-the-cli

## Stand-alone program overview

### ZK program

The program itself is in the "src" folder.

#### Intermediary format

The original Noir program is first compiled into an intermediary format. In this case, the format is ACIR. That is not explicitly generated in the project folder.

### Inputs

Inputs (both public and private) are given to the 'main' function through the file `Prover.toml`.

### Outputs

Outputs and public inputs are displayed in the file `Verifier.toml`. This is the input file used when verifying a proof.

### Proof

The proof string itself is generated in the `proofs` folder.

## Contract program overview

The program includes a lot of stuff which is bound to disappear, once the ecosystem matures. There are a lot of definitions and files which seem superfluous. The main logic is in one function in `main.nr`, but a lot of weird stuff is required around it.
