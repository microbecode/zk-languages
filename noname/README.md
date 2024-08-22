# Noname language

Noname is a stand-alone ZK language. It enables full privacy for operations.

Noname is a brand new language (even if the lore of ZK languages). It's lacking quite a bit of features, but seems interesting.

There is no native ecosystem/network/blockchain around Noname. Therefore, no ZK smart contracts are supported.

## Stand-alone usage

1. Follow the official installation instructions to install [Noname](https://github.com/zksecurity/noname?tab=readme-ov-file#quick-start).

1. Run `noname test --path src/main.no --private-inputs '{"yy": "3"}' --public-inputs '{"xx": "2"}' --backend kimchi-vesta` in the `multiply` folder. This compiles the source code, generates a proof for it and verifies the proof.

## Overview

### ZK program

The program itself is in the "src" folder.

### Inputs

Inputs (both public and private) are given to the 'main' function through the command line. The 'main' function's declaration states what is public and what is private.

### Outputs

Outputs are currently not really displayed easily. If you add the `--debug` flag, you can dig the output from the witness.

### Proof

The proof can be explicitly generated with: `noname prove --path . --private-inputs '{"yy": "3"}' --public-inputs '{"xx": "2"}' `
