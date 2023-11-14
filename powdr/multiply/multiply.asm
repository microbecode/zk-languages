machine Multiply {

    degree 8;

    // this simple machine does not have submachines

    reg pc[@pc];
    reg X[<=];
    reg Y[<=];
    reg Z[<=];
    reg O[<=];
    reg A;
    reg B;

    instr mul X, Y -> Z {
        Z = X * Y
    }

    function main -> A {
        A <=X= ${ ("input", 0) };
        B <=X= ${ ("input", 1) };

        A <== mul(A, B);
        // not really returning anything, maybe the language doesn't support outputs yet?
        return A;
    }
}