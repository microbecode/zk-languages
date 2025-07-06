# Zirgen language from Risc0

Zirgen is a ZK language created by [Risc Zero](https://github.com/risc0/zirgen/blob/main/README.md). In theory, it enables full privacy for operations.

The language is used internally for generating proofs for Risc0, but can be utilized also in a stand-alone fashion.

## Stand-alone usage

1. Download and install [Bazelisk](https://github.com/bazelbuild/bazelisk/blob/master/README.md). I downloaded the binary to this folder as `bazelisk-linux-amd64` - these instructions are written accordingly.
1. Clone the repo: `git clone https://github.com/risc0/zirgen.git`. Enter the `zirgen` folder.
1. Run the project with `./bazelisk-linux-amd64 run //zirgen/dsl:zirgen -- $(pwd)/../multiply.zir --test --test-cycles=1`.
    1. Note that if your `/tmp` folder is restricted, it will cause the run to fail. You can remove this requirement by modifying the cloned folder's `.bazelrc` and commenting out line `build:linux --sandbox_add_mount_pair=/tmp`.

## Stand-alone program overview

### ZK program

The program itself is in the "multiply.zir" file.

### Inputs

Inputs (both public and private) are given in the test function written in the program file.

### Outputs

Outputs are currently not visible anywhere. Function return values are only validated in the test function.

### Proof

The generated proof is not visible.