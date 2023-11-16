# Various ZK languages

This repository introduces various ZK languages via a simple program, which is as similar as possible for each language.

The used program has the following characteristics:

- It has two inputs: `a` and `b`. Of these, `a` is a private input (if the language supports privacy) and `b` is public
- It has one public output, which is the multiple of `a` and `b`.

The program, therefore, demonstrates how to write a ZK program where you can prove that you know a private `a` so that `a * b = c`.

## Stand-alone and contracts

ZK languages can usually be used at least as stand-alone. This means that proofs are generated locally and no network is utilized.

Some languages (or the ecosystems around them) support also ZK smart contracts. In this case, the same multiplication code is also expressed in a contract format, which typically differs a bit from the stand-alone version.

Do note that especially the contract format evolves rapidly in all ecosystems. Anything written here may be outdated already the day after it's written.

### Folder structure

All folders under the root folder are based on the language's name. Under that, there is a README and a `multiply` folder, which contains the stand-alone programs with that language.

If the language has smart contract capabilities, they are demonstrated in a `contract` folder.

## Differences

The languages folders have at least the following possible differences:

- Different technologies, so different required files and instructions
- Some languages generate proofs explicitly, some do things more in the background
- Some languages don't have local proving available at all, currently
- Some languages support privacy, while others don't
- Some languages require a trusted setup
- Some languages (or ecosystems around the language) support ZK smart contracts

## Contact

Questions? Wanna see some language here? Other issues? Feel free to [get in touch](https://linktr.ee/lauripeltonen) or just open an issue / PR here.
