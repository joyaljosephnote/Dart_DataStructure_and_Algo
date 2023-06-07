import 'dart:io';

void main() {
  print("Enter a number");
  int number = int.parse(stdin.readLineSync()!);

  int sum = 0, reverce, temp;

  temp = number;

  while (number > 0) {
    reverce = number % 10;
    sum = (sum * 10) + reverce;
    number = number ~/ 10;
  }
  bool output;
  if (temp == sum) {
    output = true;
  } else {
    output = false;
  }
  print(output);
}
