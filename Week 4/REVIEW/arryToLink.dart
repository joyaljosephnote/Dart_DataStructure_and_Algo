class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head, tail;
  LinkedList(List<int> arr) {
    if (arr.isEmpty) {
      return;
    }
    head = Node(arr[0]);
    Node? temp = head;

    for (int i = 1; i < arr.length; i++) {
      Node newNode = Node(arr[i]);
      temp?.next = newNode;
      temp = newNode;
    }
  }

  void deleteDuplicate() {
    Node? current = head, index = null, temp = null;
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

  void display() {
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
  List<int> arr = [10, 20, 30, 40, 40, 50, 60];
  LinkedList list = LinkedList(arr);
  list.deleteDuplicate();
  list.display();
}
