WORK IN PROGRESS

1. Download and install (Bazelisk 6.0.0)[https://github.com/bazelbuild/bazelisk/blob/master/README.md]. I downloaded the binary to this folder as `bazelisk-linux-amd64` - these instructions are written accordingly.
1. Build the project with `./bazelisk-linux-amd64 build //:GenerateMultiplyIncs`
1. Run the project with `./bazelisk-linux-amd64 run @zirgen//zirgen/dsl:zirgen -- $(pwd)/multiply.zir --test --test-cycles=1`