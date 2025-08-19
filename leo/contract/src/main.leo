
// The 'multiply' program.
program multiply3453451.aleo {
    @noupgrade // This contract can't be upgraded
    async constructor() {
        // The Leo compiler automatically generates the constructor logic.
    }

    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a * b;
        return c;
    }
}
