push(List stack, int data) {
  stack.add(data);
}

pop(List stack) {
  if (stack.isEmpty) {
    print('The stack is empty');
    return;
  }
  return stack.removeLast();
}

top(List stack) {
  if (stack.isEmpty) {
    print('The stack is empty');
    return;
  }
  return stack[0];
}

stackPrint(List stack) {
  print(stack);
}

void main() {
  List stack1 = [];
  List tempStack = [];
  push(stack1, 10);
  push(stack1, 20);
  push(stack1, 30);
  push(stack1, 40);
  push(stack1, 50);

  stackPrint(stack1);
  int mid = stack1.length ~/ 2;
  print(mid);
  int i = stack1.length - 1;
  while (i >= mid) {
    if (i == mid) {
      pop(stack1);
      break;
    }
    push(tempStack, pop(stack1));
    i--;
  }
  stackPrint(stack1);
  print(tempStack);
  i = tempStack.length - 1;
  while (i >= 0) {
    push(stack1, pop(tempStack));
    i--;
  }
  stackPrint(stack1);
}
