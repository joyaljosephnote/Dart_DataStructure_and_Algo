class Node {
  int? data;
  Node? next;
  static int count = 0;
  Node(this.data) {
    Node.count++;
  }
}

class SinglyLinkedList {
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
    if (head == null) {
      return;
    }
    if (temp?.data == data) {
      head = temp?.next;
      return;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == tail) {
      tail = prev;
      tail?.next = null;
    }
    prev?.next = temp?.next;
  }

  void insertAfter(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    if (head == null) {
      return;
    }
    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == tail) {
      tail?.next = newNode;
      tail = newNode;
    }
    newNode.next = temp?.next;
    temp?.next = newNode;
  }

  void findMidElement() {
    Node? temp = head;
    if (head == null) {
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

  void addBigining(int data) {
    Node newNode = Node(data);
    if (head == null) {
      return;
    }
    if (head != null) {
      newNode.next = head;
      head = newNode;
    }
  }

  void addEnd(int data) {
    Node newNode = Node(data);
    if (tail == null) {
      return;
    }
    if (tail != null) {
      tail?.next = newNode;
      tail = newNode;
    }
  }

  void insertBefore(int befor, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    if (head == null) {
      return;
    }
    if (temp?.data == befor) {
      newNode.next = head;
      head = newNode;
    }
    while (temp != null && temp.next?.data != befor) {
      temp = temp.next;
    }
    if (temp != null && temp.next?.data == befor) {
      newNode.next = temp.next;
      temp.next = newNode;
    }
  }

  void disply() {
    if (head == null) {
      print('Empty');
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
  SinglyLinkedList list = SinglyLinkedList();
  list.addNode(10);
  list.addNode(20);
  list.addNode(30);
  list.addNode(40);
  list.addNode(50);
  list.addNode(60);
  list.delete(60);
  list.insertAfter(20, 5);
  list.addBigining(1);
  list.addEnd(2);
  list.insertBefore(10, 7);

  list.disply();
  //list.findMidElement();
}
