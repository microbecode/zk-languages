# Various ZK languages

This repository introduces various ZK languages (DSLs) via a simple program, which is as similar as possible for each language.

The aim is to demonstrate the syntax of each language, how it can be utilized and whether there is an ecosystem for smart contracts around it.

The used stand-alone program has the following characteristics:

- It has two inputs: `a` and `b`. Of these, `a` is a private input (if the language supports privacy) and `b` is public
- It has one public output, which is the multiple of `a` and `b`.

The program, therefore, demonstrates how to write a ZK program where you can prove that you know a private `a` so that `a * b = c`.

## Stand-alone and contracts

ZK languages can usually be used at least as stand-alone. Proofs for the program execution are then generated locally, and possibly verification happens also locally.

Some languages (or the ecosystems around them) support also ZK smart contracts (or zkApps). In this case, the same multiplication code is also expressed in a contract format, which typically differs from the stand-alone version.

Do note that especially the contract format evolves rapidly in all ecosystems. Anything written here may be outdated already the day after it's written.

## Languages at a glance

| Language | Stand-alone supported | Contracts supported | Privacy supported |
| -------- | --------------------- | ------------------- | ----------------- |
| Cairo    | ✅                    | ✅                  | ❌                |
| Circom   | ✅                    | ❌                  | ✅                |
| Compact  | ❌                    | ✅                  | ✅                |
| Leo      | ✅                    | ✅                  | ✅                |
| Lurk     | ✅                    | ❌                  | ✅                |
| Noir     | ✅                    | ✅                  | ✅                |
| Noname   | ✅                    | ❌                  | ✅                |
| o1js     | ✅                    | ✅                  | ✅                |
| Polylang | ✅                    | ❌                  | ❌                |
| Powdr    | ✅                    | ❌                  | ✅                |
| Zirgen   | ✅                    | ❌                  | ✅                |
| ZoKrates | ✅                    | ❌                  | ✅                |

### Folder structure

All folders under the root folder are based on the language's name. Under that, there is a README and one or both of the folders `standalone` and `contract`.

The README for each language explains how to run the given program and other details.

## Contact

Questions? Wanna see some language here? Other issues? Feel free to [get in touch](https://linktr.ee/lauripeltonen) or just open an issue / PR here.
