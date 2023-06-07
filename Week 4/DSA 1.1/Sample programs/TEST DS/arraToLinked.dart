class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head, tail;
  LinkedList(List<int> array) {
    if (array.isEmpty) {
      return;
    }
    head = Node(array[0]);
    Node? temp = head;

    for (int i = 1; i < array.length; i++) {
      Node newNode = Node(array[i]);
      temp!.next = newNode;
      temp = newNode;
    }
  }
  void display() {
    if (head == null) {
      print('List is Empty');
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
  List<int> array = [1, 2, 3, 4, 5, 6];
  LinkedList list = LinkedList(array);
  list.display();
}
