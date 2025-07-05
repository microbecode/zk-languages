import { Field, SmartContract, method } from 'o1js';

export class Multiply extends SmartContract {
  init() {
    super.init();
  }

  @method.returns(Field) async multiply(a: Field, b: Field) {
    return a.mul(b);
  }
}
