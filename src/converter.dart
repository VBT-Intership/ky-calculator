/**
* Converts infix notation to Reverse-Polish Notation.
* https://en.wikipedia.org/wiki/Reverse_Polish_notation
* Order of Operations and RPN, Appendix A 
https://digitalcommons.unl.edu/cgi/viewcontent.cgi?article=1045&context=mathmidexppap
*/

// library converter;

class Converter {
  bool leftParanthesis(String c) {
    if (c == "(") {
      return true;
    }
    return false;
  }
  
  bool rightParanthesis(String c) {
    if (c == ")") {
      return true;
    }
    return false;
  }
  bool isInfixOperator(String c) {
    if (c == "+" || c == "-" || c == "/" || c == "*" || c == "(" || c == ")") {
      return true;
    }
    return false;
  }
}