import { Field, SmartContract } from 'o1js';
export declare class Multiply extends SmartContract {
    init(): void;
    multiply(a: Field, b: Field): Field;
}
