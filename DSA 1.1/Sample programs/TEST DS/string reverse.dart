void main() {
  String str = 'Joyal';
  String reverce = '';

  for (int i = str.length - 1; i >= 0; i--) {
    reverce = reverce + str[i];
  }
  print(reverce);
}
