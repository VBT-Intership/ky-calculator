import 'dart:collection';

import 'base_util.dart';

/**
* Converts infix notation to Reverse-Polish Notation.
* https://en.wikipedia.org/wiki/Reverse_Polish_notation
* Order of Operations and RPN, Appendix A 
https://digitalcommons.unl.edu/cgi/viewcontent.cgi?article=1045&context=mathmidexppap
*/

// We're using Queue as a stack, and this is the pop function of it.
Object pop(Queue q) {
  var r = q.last;
  q.removeLast();
  return r;
}

class Converter extends Base {
  String infix;
  var char_arr;
  Queue q;
  StringBuffer postfix;

  Converter() {
    this.q = new Queue();
    this.postfix = new StringBuffer();
  }
  void set set_infix(String infix) {
    this.infix = infix.replaceAll(new RegExp(r"\s+"), ""); // Remove whitespaces.
    this.char_arr = this.infix.split("");
  }

  String get get_infix {
    return this.infix;
  }

  String get get_postfix {
    return this.postfix.toString();
  }
  
  /**
  * Returns true if topStack operator have the higher precedence.
  */
  bool check_precedence(String top, String given) { 
    var high = ["/", "*"];
    var low = ["(", ")", "+", "-"];
    if (high.contains(top) && low.contains(given)) {
      return true;
    }
    return false;
  }

  /**
   * CHECK - 1: Operand?
   * CHECK - 2: Operator?
   * CHECK - 2b: Precedence?
   * CHECK - 3: Parentheses?
   */
  void process() {
    for (int i = 0; i < this.char_arr.length; i++) {
      var e = char_arr[i];
      if (this.isOperand(e)) {     // CHECK - 1
        this.postfix.write(e);
      }
      if (this.isOperator(e)) {     // CHECK - 2
        if (this.q.isEmpty) { // initial stack.
          this.q.add(e);
        } else { // Precedence check.
          if (this.check_precedence(q.last, e)) {     // CHECK - 2b
            this.postfix.write(pop(this.q));
          }
          this.q.add(e); // Finally, add current operator to stack.
        }
      }
      if (this.parentheses(e)) {     // CHECK - 3
        if (this.left_parentheses(e)) {
          this.q.add(e);
        } else { // Right parentheses
          while (this.q.isNotEmpty) {
            var p = pop(this.q);
            if (p == "(") {
              break;
            }
            this.postfix.write(p);
          }
        }
      }
    }
    while(this.q.isNotEmpty) { // End of the string, pop all operators.
      this.postfix.write(pop(this.q));
    }
  }

}