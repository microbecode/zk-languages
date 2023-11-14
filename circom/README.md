# Circom language

Circom is a stand-alone ZK language, with no explicit network or blockchain. It enables full privacy for operations.

Circom is the first mainstream ZK language. Its development started around 2018.

Using Circom includes a lot of intermediary steps, which make learning its usage a bit more tedious, but helps understand the needed steps in general.

## Usage

1. Follow the official installation instructions to install [Circom tooling](https://docs.circom.io/getting-started/installation/#important-deprecation-note). Install everything, including the snarkjs.
1. Run `circom multiply.circom --r1cs --wasm --sym --c` in the `multiply` folder. This generates most of the intermediary data needed for proofs.
1. Run `node generate_witness.js multiply.wasm ../input.json witness.wtns` in the `multiply_js` folder. This generates the rest of the intermediary data (witness), utilizing the inputs.

Next, you will need to run a trusted setup ceremony, to generate some common secret data for the prover and verifier(s).

### Trusted setup

1. Run `snarkjs powersoftau new bn128 12 pot12_0000.ptau -v` to start a trusted setup ceremony, in folder `multiply_js`
1. Run `snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v` to contribute to the trusted setup ceremony
1. Run `snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v` in folder `multiply_js`
1. Run `snarkjs groth16 setup ../multiply.r1cs pot12_final.ptau multiply_0000.zkey` in folder `multiply_js`
1. Run `snarkjs zkey contribute multiply_0000.zkey multiply_0001.zkey --name="1st Contributor Name" -v` in folder `multiply_js`
1. Run `snarkjs zkey export verificationkey multiply_0001.zkey verification_key.json` in folder `multiply_js`

### Generate and verify a proof

1. Run `snarkjs groth16 prove multiply_0001.zkey witness.wtns proof.json public.json` in folder `multiply_js` to generate a proof
1. Run `snarkjs groth16 verify verification_key.json public.json proof.json` in folder `multiply_js` to verify a proof
1. If you want, you can also generate a Solidity verifier with `snarkjs zkey export solidityverifier multiply_0001.zkey verifier.sol` in folder `multiply_js`. The file will be called `verifier.sol`.

## Overview

### ZK program

The program itself is in the "src" folder.

### Inputs

Inputs (both public and private) are given to the 'main' function through the file `input.json`. The 'main' function's declaration states what is public and what is private.

### Outputs

Outputs are displayed in the file `multiply_js/public.json`. This is the input file used when verifying a proof.

### Proof

The proof itself is generated in the `multiply_js/proof.json` file
