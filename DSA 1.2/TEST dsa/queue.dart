class Node {
  int? data;
  Node? next;
  Node(this.data);
}

class Queue {
  Node? front, rear;

  void enqueue(int data) {
    Node newNode = Node(data);
    if (front == null) {
      front = newNode;
    } else {
      rear?.next = newNode;
    }
    rear = newNode;
  }

  void dequeue() {
    if (front == null) {
      print('underflow');
    } else {
      front = front!.next;
      if (front == null) rear = null;
    }
  }

  void display() {
    if (front == null) {
      print('Empty queue');
    }
    Node? current = front;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  Queue q = Queue();
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  q.enqueue(50);
  q.display();
  q.dequeue();
  q.display();
}
