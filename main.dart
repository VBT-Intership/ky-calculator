import 'dart:collection';
import "src/tree.dart";

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
  var ops = ["(", ")", "+", "-", "/", "*"];
  //TODO: May there be given two equivalent precedence?
  if (ops.indexOf(top) >= ops.indexOf(given)) { // greater or equal.
    return true;
  }
  return false;
}

void main() {
  Queue q = new Queue(); // As a stack.
  var postfix = new StringBuffer();
  String test = "(2+5)*3+1";
  //String test = "8*((3 + 4) − 5)";
  var char_arr = test.split("");
  
  for (int i = 0; i < char_arr.length; i++) {
    var cur = char_arr[i];
    if (isOperand(cur)) { // Operand?
      postfix.write(cur);
    }
    else if (isOperator(cur)) { // Operator?
      if (q.isEmpty) {
        q.add(cur);
      } else { // Other operators in the stack, need to check precedence
        if (check_precedence(q.last, cur)) {

          postfix.write(q.last); // Remove last from queue, append to postfix.
          q.removeLast();
        } else { // Lower precedence
          q.add(cur);
        }
      }
    }
    else if (left_parentheses(cur)) {
      q.add(cur);
    }
    else if (right_parentheses(cur)) {
      print(q.toList());
      while (q.last == "(" || q.isEmpty) {
        postfix.write(q.last);
        q.removeLast();
      }
    }
  }
  while (q.isNotEmpty) {
    postfix.write(q.last);
    q.removeLast();
  }
  print(postfix);
}