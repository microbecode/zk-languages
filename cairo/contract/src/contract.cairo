#[starknet::interface]
trait IMultiply<ContractState> {
    fn multiply(self: @ContractState, a: felt252, b: felt252) -> felt252;
}

#[starknet::contract]
mod Multiply {

    // Each contract has to have storage setup - even if it's not used
    #[storage]
    struct Storage {
    }

    // Implementing this trait exposes the function as a public function inside the contract
    #[abi(embed_v0)]
    impl PublicFunctions of super::IMultiply<ContractState> {
        fn multiply(self: @ContractState, a: felt252, b: felt252) -> felt252 {
            a * b
        }
    }
}