class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class SlinkedList {
  Node? head, tail;
  void addNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
    }
    tail = newNode;
  }

  void delete(int data) {
    Node? temp = head, prev = null;
    if (temp != null && temp.data == data) {
      head = temp.next;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == null) {
      print('value note found');
      return;
    }
    if (temp == tail) {
      tail = prev;
      tail?.next = null;
    }
    prev?.next = temp.next;
  }

  void insertAfter(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      temp.next = newNode;
      tail = newNode;
    }
    newNode.next = temp.next;
    temp.next = newNode;
  }

  void display() {
    if (head == null) {
      print("Eroor");
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  SlinkedList s = SlinkedList();
  s.addNode(10);
  s.addNode(20);
  s.addNode(30);
  s.display();
  print('');
  s.delete(10);
  print('');
  s.insertAfter(20, 10);
  s.display();
}
