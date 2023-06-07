int findSum(int n) {
  if (n <= 1) {
    return n;
  }
  return n + findSum(-1);
}

void main() {
  print(findSum(10));
}
