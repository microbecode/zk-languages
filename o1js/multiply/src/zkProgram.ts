import { Field, Struct, verify, ZkProgram } from "o1js";

class PublicInputs extends Struct({
  a: Field
}) {}

class PublicOutputs extends Struct({
  result: Field
}) {}

const MyProgram = ZkProgram({
  name: "multiply",
  publicInput: PublicInputs,
  publicOutput: PublicOutputs,
  methods: {
    multiply: {
      privateInputs: [Field],
      async method(publicInput: PublicInputs, b: Field) {
        return {
          publicOutput: new PublicOutputs({
            result: publicInput.a.mul(b)
          })
        };
      },
    },
  },
});

// compile the program

// verificationKey is a special feature found in some ZK systems:
// it's basically extra (public) data that is shared between Prover and Verifier
const { verificationKey } = await MyProgram.compile();

// produce proof
const proof = await MyProgram.multiply({a: Field(2)}, Field(3));

// verify proof
const proofValid = await verify(proof.proof.toJSON(), verificationKey);

console.log("Proof:", JSON.stringify(proof.proof.toJSON()));
console.log("Public output", proof.proof.publicOutput);
console.log("Public inputs", proof.proof.publicInput); 
console.log("Verified successfully:", proofValid);

export { MyProgram };
