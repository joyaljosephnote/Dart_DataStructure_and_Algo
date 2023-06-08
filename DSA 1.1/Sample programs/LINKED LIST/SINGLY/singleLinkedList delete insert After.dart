class Node {
  int? data;
  Node? next;
  static int count = 0;
  int? id;

  Node(int data) {
    this.data = data;
    Node.count++;
  }
}

class SLinkedList {
  Node? head;
  Node? tail;

  void addNode(int data) {
    Node newNode = Node(data);
    newNode.id = Node.count;

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

  void insertAfter(int nextTo, int data) {
    Node newNode = Node(data);
    Node? temp = head;

    while (temp != null && temp.data != nextTo) {
      temp = temp.next;
    }
    if (temp == null) {
      print("value not found");
      return;
    }
    if (temp == tail) {
      tail?.next = newNode;
      tail = newNode;
      return;
    }

    newNode.next = temp.next;
    temp.next = newNode;
  }

  void find_mid(int pos) {
    Node? temp = head;
    while (temp != null) {
      if (Node.count < pos) {
        print("Not enough nodes");
        return;
      }
      if (temp.id == pos) {
        print("Node at $pos is: ${temp.data}");
        break;
      }
      temp = temp.next;
    }
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
  list.insertAfter(10, 12);
  list.addNode(20);
  list.addNode(30);
  list.addNode(40);
  list.addNode(50);
  list.display();
  print(" ");
  list.find_mid(1);
  // print("");
  // list.delete(50);
  // list.display();
  // print('');
  // list.insertAfter(10, 30);
  // list.insertAfter(30, 40);
  // list.display();
}
