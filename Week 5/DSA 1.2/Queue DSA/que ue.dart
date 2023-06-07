import 'dart:io';

class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class Queue {
  Node? front;
  Node? rear;

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
      print('dequeue ${front!.data}');
      front = front!.next;
    }
  }

  void display() {
    if (front == null) {
      print('empty Queue');
    }
    Node? current = front;
    while (current != null) {
      stdout.write('${current.data} ');
      current = current.next;
    }
    print('');
  }
}

void main() {
  Queue q = Queue();
  q.enqueue(1);
  q.enqueue(2);
  q.enqueue(3);
  q.enqueue(4);
  q.enqueue(5);
  q.enqueue(6);
  q.display();
  q.dequeue();
  q.dequeue();
  q.dequeue();
  q.display();
}
