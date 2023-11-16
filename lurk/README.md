# Lurk language

Lurk is a ZK language and a dialect of Lisp. It should enable full privacy for operations, but not 100% certain of this.

Lurk is, according to the writer's experience, by far the weirdest ZK language out there. In theory, it supports "traditional" ZK concepts, but everything is just weird.

There is no native ecosystem/network/blockchain around Lurk. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

These instructions are adapted from https://github.com/lurk-lab/lurk-rs .

1. Run `git clone https://github.com/lurk-lab/lurk-rs.git` in this folder to clone the repository
1. Init the git submodules in the `lurk-rs` folder by `git submodule update --init --recursive`
1. Run `cargo run --release` to start the Lurk prompt

There is probably some way to input a program from a file, but could not figure out how to do it. So we'll input it all by hand. This example is modified from https://github.com/lurk-lab/lurk-rs/blob/main/demo/functional-commitment.lurk . In the Lurk prompt:

1. Create the function: `!(def f (lambda (x y) (* x y)))`
1. Create a commitment to our function: `!(commit f)`
1. Evaluate an input to the function: `!(call 0x3648a5533f3447eb306055fbb8aa86819178b181050fa896bace88791fb1bb22 2 3)`
1. Generate a proof for the commitment: `!(prove)`
1. Verify the proof: `!(verify "Nova_Pallas_10_1e5dabae7e58aef62d8fcf460360faf500c3102f664b9221930e774ee2e8d7a4")`

The above creates a cryptographic commitment, which is in the heart of all ZK proofs. In this case the commitment phase is just very explicit.
