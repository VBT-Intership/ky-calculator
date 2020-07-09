import 'src/base_util.dart';
/*
void main() {

  Base base = new Base();
  String t = "25*5+7";
  List a = new List();
  var l = t.split("");
  StringBuffer buffer = new StringBuffer();
  for (var i in l) {
    if(!base.isOperator(i)) {
      buffer.write(i);
    } else {
      String num = buffer.toString();
      print(num);
      a.add(double.parse(num));
      a.add(i);
      buffer.clear();
    }
  }
  a.add(double.parse(buffer.toString()));
  print(a);
}*/
void main() {
  List<String> l = new List();
  l.add("1");
  l.add("2");
  print(l);
}