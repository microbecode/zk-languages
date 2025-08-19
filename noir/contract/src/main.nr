use dep::aztec::macros::aztec;

#[aztec]
pub contract Multiply {
    use aztec::macros::{functions::{initializer, public}};

    #[public]
    #[initializer]
    fn constructor() {

    }

    #[public]
    fn multiply(x: pub Field, y: Field) -> pub Field {
        x * y
    }
}