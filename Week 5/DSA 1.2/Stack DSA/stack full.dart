import 'dart:io';

class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class Stack {
  Node? top;

  void push(int data) {
    Node newNode = Node(data);
    if (top != null) newNode.next = top;
    top = newNode;
  }

  void pop() {
    if (top == null)
      print('underflow');
    else {
      print('pop ${top!.data}');
      top = top!.next;
    }
  }

  void display() {
    if (top == null) {
      print('empty stack');
    } else {
      Node? current = top;
      while (current != null) {
        stdout.write('${current.data} ');
        current = current.next;
      }
      print('');
    }
  }

  void deleteMiddle() {
    if (top == null) {
      print('Stack is empty');
      return;
    }

    Node? a = top;
    Node? b = top;
    Node? prev = null;

    while (b != null && b.next != null) {
      b = b.next!.next;
      prev = a;
      a = a!.next;
    }
    if (prev == null) {
      top = top!.next;
    } else {
      prev.next = a!.next;
    }
  }
}

void main() {
  Stack s = Stack();
  s.push(1);
  s.push(2);
  s.push(3);
  s.push(4);
  s.push(5);
  s.push(3);
  s.push(4);
  s.push(5);
  s.push(6);
  s.display();
  // s.pop();
  s.pop();
  s.deleteMiddle();
  s.display();
}
