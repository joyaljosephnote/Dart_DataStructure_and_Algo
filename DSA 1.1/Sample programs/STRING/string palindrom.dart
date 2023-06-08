bool isPlaindrom(String name) {
  int i = 0, j = name.length - 1;
  while (i < j) {
    if (name[i] != name[j]) {
      return false;
    }
    i++;
    j--;
  }
  return true;
}

void main() {
  print(isPlaindrom('malayalam'));
}
