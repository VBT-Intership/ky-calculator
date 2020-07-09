import 'dart:collection';
import 'base_util.dart';

class Calculator extends Base {
  List postfix_arr;
  Queue q;
  Calculator(List postfix) {
    this.postfix_arr = postfix;
    this.q = new Queue();
  }
  double add(double a, double b) {
     return a+b;
  }
  
  double sub(double a, double b) {
    return a - b;
  }
  
  double div(double a, double b) {
    return a / b;
  }

  double mul(double a, double b) {
    return a * b;
  }
  double calculate() {
    for (var c in postfix_arr) { // Fill stack.
      if (this.isOperand(c)) {
        this.q.add(double.parse(c));
      }
      if (this.isOperator(c)) { // Operate last two values.
        double temp1 = this.pop(this.q); double temp2 = this.pop(this.q);
        if (c == "+") {
          this.q.add(this.add(temp1, temp2));
        }
        if (c == "-") {
          this.q.add(this.sub(temp1, temp2));
        }
        if (c == "/") {
          this.q.add(this.div(temp1, temp2));
        }
        if (c == "*") {
          this.q.add(this.mul(temp2, temp1));
        }
      }
    }
    return this.pop(this.q);
  }

}