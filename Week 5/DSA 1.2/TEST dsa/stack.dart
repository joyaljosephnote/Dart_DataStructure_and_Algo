class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class Stack {
  Node? top = null;
  void push(int data) {
    Node newNode = Node(data);
    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  void pop() {
    if (top == null) {
      print('Stack Underflow');
    }
    top = top?.next;
  }

  void display() {
    Node? current = top;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  Stack node = Stack();
  node.push(10);
  node.push(20);
  node.push(30);
  node.push(40);
  node.push(50);
  node.display();

  node.pop();
  node.display();
}
