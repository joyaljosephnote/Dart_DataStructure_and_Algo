push(List stack, int data) {
  stack.add(data);
}

pop(List stack) {
  if (stack.isEmpty) {
    print('Stack is empty');
    return;
  }
  return stack.removeLast();
}

void main() {
  List stack1 = [];
  List tempStack = [];
  push(stack1, 10);
  push(stack1, 20);
  push(stack1, 30);
  push(stack1, 40);
  push(stack1, 50);
  print(stack1);
  int mid = stack1.length ~/ 2;
  int i = stack1.length - 1;
  while (i >= mid) {
    if (i == mid) {
      pop(stack1);
      break;
    }
    push(tempStack, pop(stack1));
    i--;
  }

  i = 0;
  while (i <= tempStack.length) {
    push(stack1, pop(tempStack));
    i++;
  }
  print(stack1);
}
