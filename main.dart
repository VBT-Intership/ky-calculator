import 'src/calculator.dart';
import 'src/converter.dart';
import "dart:io";

bool isNotInfix(String infix) {
  RegExp ex = new RegExp(r"[a-zA-Z]");
  if (ex.allMatches(infix).isNotEmpty) {
    return true;
  }
  return false;
}

void main() {
  var help = "\nEnter the arithmetic operation.\nExample: 5*(5+2)-6\nCTRL+C to quit.\n";
  while (true) {
    print(help);
    Converter c = new Converter();
    String op = stdin.readLineSync();
    //String op = "5+2";
    if (isNotInfix(op)) {
      print("Not a valid operation.");
      continue;
    }
    c.set_infix = op;
    c.process(); // Convert to RPN. 

    Calculator calculator = new Calculator(c.get_postfix);
    double result = calculator.calculate();
    print("Result: $result\n");    
  }
}