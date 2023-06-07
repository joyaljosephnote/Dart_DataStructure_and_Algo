class Node {
  int? data;
  Node? next;

  Node(this.data);
}

class SLinkedList {
  Node? head;
  Node? tail;

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
      print("Empty");
      return;
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.next);
      temp = temp.next;
    }
  }
}

void main() {
  SLinkedList list = SLinkedList();

  list.addNode(10);
  list.addNode(20);
  list.addNode(30);
  list.addNode(40);
  list.addNode(50);

  list.display();
}
