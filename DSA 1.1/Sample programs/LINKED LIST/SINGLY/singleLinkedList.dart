class Node {
  int? data;
  Node? next;

  Node(this.data);
}

class SLinkedList {
  Node? head;
  Node? taill;

  void addNode(int data) {
    Node newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      taill?.next = newNode;
    }
    taill = newNode;
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
}
