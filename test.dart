import 'main.dart';

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