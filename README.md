# Various ZK languages

This repository introduces various ZK languages via a simple program, which is as similar as possible for each language.

The used program has the following characteristics:

- It has two inputs: `a` and `b`. Of these, `a` is a private input (if the language supports privacy) and `b` is public
- It has one public output, which is the multiple of `a` and `b`.

The program, therefore, demonstrates how to write a ZK program where you can prove that you know a private `a` so that `a * b = c`.

## Differences

The languages folders have at least the following possible differences:

- Different technologies, so different required files and instructions
- Some languages generate proofs explicitly, some do things more in the background
- Some languages support privacy, while others don't
