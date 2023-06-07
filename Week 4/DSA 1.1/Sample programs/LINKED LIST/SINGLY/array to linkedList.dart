// class Node {
//   int? data;
//   Node? next;
//   Node(this.data, [this.next]);
// }

// Node? arrayToList(List<int> array) {
//   if (array.isEmpty) {
//     return null;
//   }
//   Node head = Node(array[0]);
//   Node current = head;

//   for (int i = 1; i < array.length; i++) {
//     current.next = Node(array[i]);
//     current = current.next!;
//   }
//   return head;
// }

// void main() {
//   List<int> array = [1, 2, 3, 4, 5];
//   Node? head = arrayToList(array);

//   while (head != null) {
//     print(head.data);
//     head = head.next;
//   }
// }

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
      print("List is empty");
    }
    Node? temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  List<int> array = [1, 2, 3, 4, 5];
  LinkedList l = LinkedList(array);
  l.display();
}
