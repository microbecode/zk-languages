# Aleo's Leo language

Leo is a ZK language used in the [Aleo](https://aleo.org/) L1 blockchain. It enables full privacy for transactions. The programs themselves are public.

Leo can be used as stand-alone locally, or for Aleo smart contracts.

## Usage

1. Follow the official installation instructions to install [Leo](https://developer.aleo.org/leo/installation)
1. Run `leo run multiply`

## Overview

### ZK program

The program itself is in the "src" folder.

#### Intermediary format

The original Leo program is first compiled into an intermediary format. In this case, the format is Aleo. That's generated in the "build" folder.

The intermediary format code is public, once deployed to the blockchain. An example can be found [here](https://explorer.aleo.org/program/aleoswap06.aleo).

### Inputs

Inputs (both public and private) are given to the 'main' function through the file in folder "inputs".

### Outputs

Outputs are displayed in the command line. There is also folder "outputs", but nothing gets generated there - unsure what is its function.
