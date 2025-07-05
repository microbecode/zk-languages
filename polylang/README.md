# Polylang language from Polybase Labs

Polylang is a ZK language used to generate intermediary format suitable for the [MidenVM](https://github.com/0xPolygonMiden/miden-vm) ZK-VM. It's used in [Polybase](https://polybase.xyz/).

The language does not support privacy, but it should be possible to have private data somehow in MidenVM.

There is no native ecosystem/network/blockchain around Polylang. Therefore, no ZK smart contracts are supported even if the program is called a _contract_.

## Stand-alone usage

Unfortunately, there's no convenient way to store a Polylang program in a stand-alone file. It's possible, but somewhat [impractical](https://polylang.dev/docs/getting-started/polylang-lib).

Therefore we'll use the option to provide the program as command line parameters.

1. Build the Polylang [from source](https://polylang.dev/docs/getting-started/building-from-source)
1. Go to the `polylang` folder where you cloned the repository
1. Run the language, provide the program as input and give the program some inputs:

```
cargo run --bin compile -- contract:Multiply function:multiply <<< 'contract Multiply { result: number; multiply(a: number, b: number) { this.result = a * b; }}' | cargo run -p miden-run -- --this-json '{ "result": 0 }' --advice-tape-json '[2, 3]' --proof-output ../proof
```

1. You'll see result 6, as expected. The proof is saved in file `proof` and is in binary format.
1. To verify the proof, you may have luck trying [Miden verifier](https://crates.io/crates/miden-verifier).

## Stand-alone program overview

### ZK program

The program itself is given as command line parameters

#### Intermediary format

The intermediary format is format suited for the MidenVM. You can see how it works [here](https://0xpolygonmiden.github.io/examples/).

### Inputs

Inputs are given as command line parameters.

### Outputs

Outputs are printed to the console.

### Proof

The proof string itself is generated in the `proof` file.
