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

  void display() {
    if (head == null) {
      print('Its Empty');
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

  void addAtBiging(int data) {
    Node newNode = Node(data);
    newNode.next = head;
    head = newNode;
  }

  void addAtEnd(int data) {
    Node newNode = Node(data);
    Node? temp = tail;
    temp?.next = newNode;
    tail = newNode;
  }

  void delete(int data) {
    Node? temp = head, prev = null;
    if (temp == null) {
      print('Value note found');
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

  void findTheMidElement() {
    Node? temp = head;
    if (head == null) {
      print('LinkedList is empty');
      return;
    }
    int i = 1;
    while (temp != null) {
      if (i == (1 + Node.count) / 2) {
        print(temp.data);
      }
      i++;
      temp = temp.next;
    }
  }

  void insertAtBegining(int prevTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;
    if (head == null) {
      return;
    }
    if (temp?.data == prevTo) {
      head = newNode;
      newNode.next = temp;
    }
    while (temp != null && temp.next?.data != prevTo) {
      temp = temp.next;
    }
    if (temp != null && temp.next?.data == prevTo) {
      newNode.next = temp.next;
      temp.next = newNode;
    }
  }

  void deleteTheDuplicate() {
    Node? current = head, temp = null, index = null;

    if (head == null) {
      return;
    } else {
      while (current != null) {
        temp = current;
        index = current.next;

        while (index != null) {
          if (current.data == index.data) {
            temp?.next = index.next;
          } else {
            temp = index;
          }
          index = index.next;
        }
        current = current.next;
      }
    }
  }
}

void main() {
  SinglyLinkedList List = SinglyLinkedList();
  List.addNode(1);
  List.insertAfter(1, 2);
  List.addNode(3);
  List.addNode(4);
  List.addNode(5);
  List.insertAfter(5, 6);
  List.addAtBiging(0);
  List.addAtEnd(7);
  List.addAtEnd(8);
  // List.delete(0);
  // List.delete(1);
  // List.delete(2);
  // List.delete(3);
  List.insertAtBegining(0, 10);
  List.insertAtBegining(5, 12);
  List.addAtEnd(8);
  List.deleteTheDuplicate();

  List.display();
  print('');
  List.findTheMidElement();
}
