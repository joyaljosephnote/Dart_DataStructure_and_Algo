import 'dart:io';

void main() {
  int flag = 0;
  print('Enter a string');
  String word = stdin.readLineSync()!;
  for (int i = 0; i < word.length / 2; i++) {
    if (word[i] != word[word.length - i - 1]) {
      flag = 1;
      break;
    }
  }
  if (flag == 0) {
    print('Entered string is a palindrome');
  } else {
    print('Entered string is not a palindrome');
  }
}
