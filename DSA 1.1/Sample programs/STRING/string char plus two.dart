void main() {
  String value = "Joyal";
  print(change(value, 2));
}

String change(String str, int key) {
  int newKey = key % 26;
  var charArray = List.filled(str.length, '');

  for (int i = 0; i < str.length; i++) {
    int letterPosition = str.codeUnitAt(i) + newKey;
    if (letterPosition <= 122) {
      charArray[i] = String.fromCharCode(letterPosition);
    } else {
      charArray[i] = String.fromCharCode(96 + letterPosition % 122);
    }
  }
  return charArray.join();
}
