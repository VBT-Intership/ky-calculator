import 'dart:collection';


class Base {
  /*
  Queue q;
  var char_arr;
  StringBuffer buffer;

  Base(String operation) {
    this.char_arr = operation.split("");
    this.q = new Queue();
    this.buffer = new StringBuffer();
  }
  */
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
      double.parse(c);
      return true;
    } catch (FormatException) {
      return false;
    }
  } 
}