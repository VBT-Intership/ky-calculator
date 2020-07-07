/*

  bool _isNotInfix(String infix) {
    RegExp ex = new RegExp(r"[a-zA-Z]");
    if (ex.allMatches(infix).isNotEmpty) {
      return true;
    }
    return false;
  }
  */
import "src/converter.dart";
void main() {
  Converter c = new Converter("4*2+5");
  c.process();
  print(c.postfix);
}