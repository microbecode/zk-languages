machine Multiply {

    degree 16;

    // this simple machine does not have submachines

    reg pc[@pc];
    reg X[<=];
    reg Y[<=];
    reg Z[<=];

    reg A;
    reg B;
    reg C;
    reg D;

    instr mul X, Y -> Z {
        Z = X * Y
    }

    instr assert_equal X, Y {
        X = Y
    }

    function main {
        A <=X= ${ ("input", 0) };
        B <=X= ${ ("input", 1) };
        C <=X= ${ ("input", 2) };

        D <== mul(A, B);
        assert_equal C, D;

        return;
    }
}