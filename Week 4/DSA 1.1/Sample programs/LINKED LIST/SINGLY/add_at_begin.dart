import 'dart:io';

class Node {
  int? data;
  Node? next;

  Node(int data) {
    this.data = data;
    this.next = null;
  }
}

class SLinkedList {
  Node? head;
  SLinkedList() {
    this.head = null;
  }

  void add_at_begin(int data) {
    Node newNode = Node(data);

    newNode.next = head;
    head = newNode;
  }

  void display() {
    if (head == null) {
      print("empty");
      return;
    }
    Node? temp = head;
    while (temp != null) {
      stdout.write(
        "${temp.data} ---> ",
      );
      temp = temp.next;
    }
  }
}

void main() {
  SLinkedList ll1 = SLinkedList();
  ll1.add_at_begin(20);
  ll1.add_at_begin(230);
  ll1.add_at_begin(2489);

  ll1.display();
}
