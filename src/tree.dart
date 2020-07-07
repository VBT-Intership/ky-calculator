// https://www.geeksforgeeks.org/expression-tree/

/**
* A tree node.
*/
// library tree;
class Node {
  String node;
  Node left;
  Node right;

  Node(String i) {
    this.node = i;
    this.left = this.right = null;
  }
}

/**
* An expression tree for the calculator.
*/ 
class ExpressionTree {
  
  /**
  * Checks whether the given char is an operator or not.
  * In this project, only four main operators are mandatory.
  */
  bool isOperator(String c) {
    if (c == "+" || c == "-" || c == "/" || c == "*") {
      return true;
    }
    return false;
  }


}