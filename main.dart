import 'dart:collection';
import "src/tree.dart";

Object pop(Queue q) {
  var r = q.last;
  q.removeLast();
  return r;
}
bool parentheses(String c) {
  if (c == "(" || c ==")") {
    return true;
  }
  return false;
}
bool left_parentheses(String c) {
  if (c == "(") {
    return true;
  }
  return false;
}

bool right_parentheses(String c) {
  if (c == ")") {
    return true;
  }
  return false;
}

bool isOperator(String c) {
  if (c == "+" || c == "-" || c == "/" || c == "*") {
    return true;
  }
  return false;
}
bool isOperand(String c) {
  try {
    int.parse(c);
    return true;
  } catch (FormatException) {
    return false;
  }
}
/**
 * Returns true if topStack operator have higher precedence.
 */
bool check_precedence(String top, String given) { 
  var high = ["/", "*"];
  var low = ["(", ")", "+", "-"];
  //TODO: May there be given two equivalent precedence?
  if (high.contains(top) && low.contains(given)) {
    return true;
  }
  return false;
}

void main() {
  Queue q = new Queue(); // As a stack.
  var postfix = new StringBuffer();
  //String test = "(2+5)*3+1";
  String test = "8 *((3+4) - 5)";
  //String test = "(3 - 4)+2";
  test = test.replaceAll(new RegExp(r"\s+"), "");
  var char_arr = test.split("");
  /**
   * CHECK - 1: Operand?
   * CHECK - 2: Operator?
   * CHECK - 2b: Precedence?
   * CHECK - 3: Parentheses?
   */
  for (int i = 0; i < char_arr.length; i++) {
    var e = char_arr[i];
    if (isOperand(e)) {     // CHECK - 1
      postfix.write(e);
    }
    if (isOperator(e)) {     // CHECK - 2
      if (q.isEmpty) { // initial stack.
        q.add(e);
      } else { // Precedence check.
        if (check_precedence(q.last, e)) {     // CHECK - 2b
          postfix.write(pop(q));
        }
        q.add(e); // Finally, add current operator to stack.
      }
    }
    if (parentheses(e)) {     // CHECK - 3
      if (left_parentheses(e)) {
        q.add(e);
      } else { // Right parentheses
        while (q.isNotEmpty) {
          var p = pop(q);
          if (p == "(") {
            break;
          }
          postfix.write(p);
        }
      }
    }
  }
  while(q.isNotEmpty) {
    postfix.write(pop(q));
  }
  print(postfix);
}