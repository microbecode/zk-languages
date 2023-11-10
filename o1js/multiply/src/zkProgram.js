import { Field, verify, Experimental } from "o1js";

const MyProgram = Experimental.ZkProgram({
  publicInput: Field,
  publicOutput: Field,
  methods: {
    multiply: {
      privateInputs: [Field],
      method(a, b) {
        // This is just to make sure that the fields are read in the correct order
        a.assertEquals(Field(2));
        return a.mul(b);
      },
    },
  },
});

// compile the program

// verificationKey is a special feature found in some ZK systems:
// it's basically extra (public) data that is shared between Prover and Verifier
const { verificationKey } = await MyProgram.compile();

// produce proof
const proof = await MyProgram.multiply(Field(2), Field(3));

// verify proof
const proofValid = await verify(proof.toJSON(), verificationKey);

console.log("Proof:", JSON.stringify(proof.toJSON()));
console.log("Public output", proof.publicOutput.value);
console.log("Public inputs", proof.publicInput.value);
console.log("Verified successfully:", proofValid);

export { MyProgram };
