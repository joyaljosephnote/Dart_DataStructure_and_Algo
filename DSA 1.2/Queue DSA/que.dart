class Node {
  int? data;
  Node? next;

  Node(this.data);
}

class Queue {
  Node? front, rear;

  void enqueue(int data) {
    Node newNode = new Node(data);
    if (rear == null) {
      front = rear = newNode;
      return;
    }
    rear?.next = newNode;
    rear = newNode;
  }

  void dequeue() {
    if (front == null) {
      print('The queue is empty');
    }

    front = front?.next;
    if (front == null) {
      rear = null;
    }
  }

  void display() {
    Node? current = front;

    if (front == null) {
      print('List is empty');
      return;
    }
    while (current != null) {
      print(current.data);
      current = current.next;
    }
    print('');
  }
}

void main() {
  Queue queue = Queue();
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.enqueue(50);

  print('');
  queue.dequeue();

  queue.display();
}
