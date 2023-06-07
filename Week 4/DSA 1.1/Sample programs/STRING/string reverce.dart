void main() {
  String name = 'JOYAL';
  String reverse = '';
  for (int i = name.length - 1; i >= 0; i--) {
    reverse = reverse + name[i];
  }
  print(reverse);
}
