class MinHeap {
  List minHeap = [];
  void insert(int index) {
    minHeap.add(index);
    shiftUp(minHeap.length - 1);
  }

  int parentIdx(int i) {
    return (i - 1) ~/ 2;
  }

  void display() {
    minHeap.forEach((element) => print(element));
  }

  void shiftUp(int index) {
    int parentIndex = parentIdx(index);
    while (index > 0 && minHeap[parentIndex] > minHeap[index]) {
      swap(minHeap, parentIndex, index);
      index = parentIndex;
      parentIndex = parentIdx(index);
    }
  }

  void swap(List arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main() {
  List arr = [70, 10, 30, 5, 50];
  MinHeap heap = MinHeap();
  arr.forEach((element) => heap.insert(element));
  heap.display();
}
