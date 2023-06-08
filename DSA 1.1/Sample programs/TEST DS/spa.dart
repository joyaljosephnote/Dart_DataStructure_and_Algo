void display(int n) {
  print(n);
  if (n == 5) {
    return;
  }
  display(n + 1);
}

void main() {
  display(1);
}
// sample recurtion