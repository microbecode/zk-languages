import { Field, SmartContract, method } from 'o1js';

export class Multiply extends SmartContract {
  init() {
    super.init();
  }

  @method multiply(a: Field, b: Field): Field {
    return a.mul(b);
  }
}
