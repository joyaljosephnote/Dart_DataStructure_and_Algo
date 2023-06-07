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
      return;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    if (temp == null) {
      print("The value not found");
      return;
    }
    if (temp == tail) {
      tail = prev;
      tail?.next = null;
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
}

void main() {
  SLinkedList list = SLinkedList();
  // list.display();

  list.addNode(10);
  list.addNode(20);
  list.addNode(50);
  list.display();
  print("");
  list.delete(50);
  list.display();
}
