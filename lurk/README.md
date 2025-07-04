# Lurk language

Lurk is a ZK language and a dialect of Lisp. It should enable full privacy for operations, but not 100% certain of this.

Lurk is, according to the writer's experience, by far the weirdest ZK language out there. In theory, it supports "traditional" ZK concepts, but everything is just weird.

There is no native ecosystem/network/blockchain around Lurk. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

These instructions are adapted from https://github.com/lurk-lab/lurk .

1. Run `git clone https://github.com/argumentcomputer/lurk-rs.git` in this folder to clone the repository
1. Compile the repo with `cargo install --path .`
1. Restart your terminal. Run `lurk` to start the Lurk prompt

There is probably some way to input a program from a file, but could not figure out how to do it. So we'll input it all by hand. This example is modified from https://github.com/argumentcomputer/lurk-rs/blob/main/demo/functional-commitment.lurk . In the Lurk prompt:

1. Create the function: `!(def f (lambda (x y) (* x y)))`
1. Create a commitment to our function: `!(commit f)`
1. Evaluate an input to the function: `!(call 0x0eadbd0bcc9d37486ce36426aaf25c9ba313fefd7a3d11bd62c8095a02f0020f 2 3)`
1. Generate a proof for the commitment: `!(prove)`
1. Verify the proof: `!(verify "supernova_bn256_10_01e752b4ccaf9972e3499f586cc7b78a1ded47ea3648a0cd07bba1845220b794")`
1. Close the prompt by ctrl+c (couldn't figure out how to exit peacefully)

The above creates a cryptographic commitment, which is in the heart of all ZK proofs. In this case the commitment phase is just very explicit.
