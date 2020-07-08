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
  var help = "Enter the arithmetic operation.\nExample: 5*(5+2)-6\nCTRL+C to quit.";
  print(help);
  while (true) {
    String op = stdin.readLineSync();
    if (isNotInfix(op)) {
      print("Not a valid operation.");
      continue;
    }
    Converter c = new Converter();
    c.set_infix = op;
    c.process(); // Convert to RPN.  
    print(c.get_postfix);
    // TODO: Calculate...
  }
}