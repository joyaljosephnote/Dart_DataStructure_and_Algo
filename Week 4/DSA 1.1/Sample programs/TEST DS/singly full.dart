class Node {
  int? data;
  Node? next;
  //Node? prev;
  static int count = 0;
  Node(this.data) {
    Node.count++;
  }
}

class LinkedList {
  Node? head, tail;

  void addNode(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
      //newNode.prev = tail;
    }
    tail = newNode;
  }

  void delete(int data) {
    Node? temp = head, prev = null;
    if (temp == null) {
      print('Value not found');
      return;
    }
    if (temp.data == data) {
      head = temp.next;
      return;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == tail) {
      tail = prev;
      tail?.next = null;
      return;
    }
    prev?.next = temp?.next;
  }

  void findTheMidiElement() {
    Node? temp = head;
    if (temp == null) {
      return;
    }
    int i = 1;
    while (temp != null) {
      if (i == (1 + Node.count) ~/ 2) {
        print(temp.data);
      }
      i++;
      temp = temp.next;
    }
  }

  void display() {
    if (head == null) {
      print('Value note found');
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void insertAfter(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == tail) {
      tail?.next = newNode;
      tail = newNode;
      return;
    }
    newNode.next = newNode;
    temp?.next = newNode;
  }

  // void displayReverce() {
  //   if (tail == null) {
  //     print('Value note found');
  //     return;
  //   }
  //   Node? temp = tail;
  //   while (temp != null) {
  //     print(temp.data);
  //     temp = temp.prev;
  //   }
  // }
}

void main() {
  LinkedList list = LinkedList();
  list.addNode(10);
  list.addNode(20);
  list.addNode(30);
  list.addNode(40);
  list.addNode(50);

  print('');
  //list.findTheMidiElement();
  list.insertAfter(20, 5);

  list.display();
  // list.displayReverce();
}
