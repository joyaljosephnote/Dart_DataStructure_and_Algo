class MaxHeap {
  List maxHeap = [];

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  void insert(int index) {
    maxHeap.add(index);
    shiftUp(maxHeap.length - 1);
  }

  void shiftUp(int index) {
    int parentIndex = parent(index);
    while (index > 0 && maxHeap[parentIndex] < maxHeap[index]) {
      swap(maxHeap, parentIndex, index);
      index = parentIndex;
      parentIndex = parent(index);
    }
  }

  void swap(List arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  void display() {
    maxHeap.forEach((element) => print(element));
  }
}

void main() {
  List arr = [10, 80, 40, 30, 90];
  MaxHeap heap = MaxHeap();
  arr.forEach((element) => heap.insert(element));
  heap.display();
}
