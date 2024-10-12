machine Multiply with degree: 8 {
    reg pc[@pc];
    reg X[<=];
    reg Y[<=];
    //reg Z[<=];
    
    reg A;
    reg B;

    // Expose the register value of A in the last time step
    public N = B(7);

    instr mul X, Y -> Y {
        Y = X * Y
    }
    
    function main {
        A <=X= ${ std::prelude::Query::Input(0, 1) };
        //B <=X= ${ std::prelude::Query::Input(0, 2) };
        B <=X= 3;
        B <== mul(A, B);
    }
}