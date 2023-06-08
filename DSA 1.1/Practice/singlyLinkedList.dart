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

  void display() {
    if (head == null) {
      print('Its empty');
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
  list.addNode(10);
  list.addNode(15);
  list.addNode(12);

  list.display();
}
