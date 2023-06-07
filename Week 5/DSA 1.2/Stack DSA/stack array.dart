import 'dart:io';

push(List stack) {
  stdout.write("->>");
  stack.add(int.parse(stdin.readLineSync()!));
}

pop(List stack) {
  if (stack.isEmpty) {
    print("The stack is empty!");
    return;
  }
  stack.removeLast();
}

top(List stack) {
  if (stack.isEmpty) {
    print("The stack is empty!");
    return;
  }
  return stack[0];
}

print_stack(List stack) {
  print(stack);
}

void main() {
  List stack = [];

  while (true) {
    print(
        "Enter 1: to push\nEnter 2: to pop\nEnter 3: to quit\nEnter 4: to print the stack");
    print("Enter your input");
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      push(stack);
    } else if (choice == 2) {
      pop(stack);
    } else if (choice == 3) {
      break;
    } else if (choice == 4) {
      print_stack(stack);
    } else {
      print("Invalid choice, kindly enter again!");
    }
  }
}
