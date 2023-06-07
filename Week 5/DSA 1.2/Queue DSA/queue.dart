class Node {
  int? data;
  Node? back;
  Node(int data) {
    this.data = data;
  }
}

class Queue {
  Node? front;
  Node? rear;

  void enQue(int data) {
    if (rear == null)
      front = rear = Node(data);
    else {
      rear!.back = Node(data);
      rear = rear!.back;
    }
  }

  void deQue() {
    if (front == null) {
      print('empty queue');
      return;
    } else {
      print(front!.data);
      front = front?.back;
    }
  }

  void display() {
    if (front == null)
      print('empty queue');
    else {
      Node? temp = front;
      while (temp != null) {
        print(temp.data);
        temp = temp.back;
      }
    }
  }

  void peek() {
    if (front == null)
      print('empty queue');
    else
      print(front!.data);
  }
}

void main() {
  Queue q = Queue();
  q.enQue(1);
  q.enQue(2);
  q.enQue(3);
  q.peek();
  q.deQue();
  q.display();
}
