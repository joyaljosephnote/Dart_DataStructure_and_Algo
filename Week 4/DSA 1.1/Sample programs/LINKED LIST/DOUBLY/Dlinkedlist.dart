class Node {
  int? data;
  Node? next;
  Node? prev;

  Node(this.data);
}

class DLinkedList {
  Node? head;
  Node? tail;

  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      tail?.next = newNode;
      newNode.prev = tail;
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
      print('Value note found');
      return;
    }
    if (temp == tail) {
      tail = prev;
      temp.next = null;
      return;
    }
    prev?.next = temp.next;
  }

  void display() {
    if (head == null) {
      print("empty");
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  void displayReverse() {
    if (head == tail) {
      print("empty");
      return;
    }
    Node? temp = tail;
    while (temp != null) {
      print(temp.data);
      temp = temp.prev;
    }
  }
}

void main() {
  DLinkedList list = DLinkedList();

  list.addNode(10);
  list.addNode(20);
  list.addNode(30);
  list.addNode(40);
  list.display();
  print("");
  list.delete(30);
  print('');
  list.display();
}
