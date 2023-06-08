void main() {
  String str1 = 'Grab';
  String str2 = '';

  for (int i = str1.length - 1; i >= 0; i--) {
    str2 = str2 + str1[i];
  }
  print(str2);
}
