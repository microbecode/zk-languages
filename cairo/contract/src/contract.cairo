#[starknet::interface]
trait IMultiply<ContractState> {
  fn multiply(self: @ContractState, a: felt252, b: felt252) -> felt252;
}

#[starknet::contract]
mod MyFirstContract {
    #[storage]
    struct Storage {
    }


    #[external(v0)]
    impl PublicFunctions of super::IMultiply<ContractState> {
        fn multiply(self: @ContractState, a: felt252, b: felt252) -> felt252 {
            a * b
        }
    }
}