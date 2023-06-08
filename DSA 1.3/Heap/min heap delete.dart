class MinHeap {
  List minHeap = [];

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChildIdx(int i) {
    return (2 * i) + 1;
  }

  int rightChildIdx(int i) {
    return (2 * i) + 2;
  }

  void insert(int index) {
    minHeap.add(index);
    shiftUp(minHeap.length - 1);
  }

  void display() {
    minHeap.forEach((element) => print(element));
  }

  void shiftUp(int index) {
    int parentIndex = parent(index);
    while (index > 0 && minHeap[parentIndex] > minHeap[index]) {
      swap(minHeap, parentIndex, index);
      index = parentIndex;
      parentIndex = parent(index);
    }
  }

  void shiftDown(int index) {
    int endIndex = minHeap.length - 1;
    int leftIndex = leftChildIdx(index);
    while (leftIndex <= endIndex) {
      int rightIndex = rightChildIdx(index);
      int shift;
      if (rightIndex < endIndex && minHeap[rightIndex] < minHeap[leftIndex]) {
        shift = rightIndex;
      } else {
        shift = leftIndex;
      }
      if (minHeap[shift] > minHeap[index]) {
        swap(minHeap, shift, index);
        index = shift;
        leftIndex = leftChildIdx(index);
      }
    }
  }

  void remove() {
    swap(minHeap, 0, minHeap.length - 1);
    minHeap.removeLast();
    shiftDown(0);
  }

  void swap(List arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main() {
  List arr = [70, 10];
  MinHeap heap = MinHeap();
  arr.forEach((element) => heap.insert(element));
  heap.display();
  heap.remove();
  print('');
  heap.display();
}
