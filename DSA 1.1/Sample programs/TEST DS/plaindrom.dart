import 'dart:io';

void main() {
  print("Enter a number");
  int number = int.parse(stdin.readLineSync()!);

  int temp = number, sum = 0, reverce;

  while (number > 0) {
    reverce = number % 10;
    sum = (sum * 10) + reverce;
    number = number ~/ 10;
  }

  bool output;
  if (sum == temp) {
    output = true;
  } else {
    output = false;
  }
  print(output);
}
