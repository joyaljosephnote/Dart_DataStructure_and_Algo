import 'dart:io';

int fibonacci(int n) {
  if (n == 0) {
    return 0;
  } else if (n == 1) {
    return 1;
  } else {
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

void main() {
  //print('Enter a limit');
  //var limit = int.parse(stdin.readLineSync()!);
  int limit = 5;

  print("Figonacci of $limit");
  for (int i = 0; fibonacci(i) <= limit; i++) {
    print(fibonacci(i));
  }
}
