machine Multiply with degree: 8 {
    reg pc[@pc];
    reg X[<=];
    reg Y[<=];
    reg Z[<=];
    
    reg A;
    reg B;
    reg C;

    // Expose the register value of A in the last time step
    public N = C(7);

    instr mul X, Y -> Z {
        Z = X * Y
    }
    
    function main {
        A <=X= ${ std::prelude::Query::Input(0, 1) };
        B <=X= ${ std::prelude::Query::Input(0, 2) };
        C <== mul(A, B);
    }
}