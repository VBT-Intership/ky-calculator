import 'main.dart';
/*
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
 */
bool isOperand(String c ) {
  try {
    int.parse(c);
    return true;
  } catch (FormatException) {
    return false;
  }
}
void main() {
  String a = "123";
  print(isOperand(a));
}