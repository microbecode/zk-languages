machine Multiply with degree: 16 {
    // this simple machine does not have submachines

    reg pc[@pc];
    reg X[<=];
    reg Y[<=];
    reg Z[<=];

    reg A;
    reg B;
    reg C;
    reg D;

    // Expose the register value of A in the last time step
    public N = D(8);

    instr mul X, Y -> Z {
        Z = X * Y
    }

    instr assert_equal X, Y {
        X = Y
    }

    function main {
        A <=X= ${ std::prelude::Query::Input(0) };
        B <=X= ${ std::prelude::Query::Input(1) };
        C <=X= ${ std::prelude::Query::Input(2) };

        D <== mul(A, B);
        assert_equal C, D;

        return;
    }
}