class MaxHeap {
  List maxHeap = [];

  int parentIndex(int i) {
    return (i - 1) ~/ 2;
  }

  int leftIndex(int i) {
    return (2 * i) + 1;
  }

  int rightIndex(int i) {
    return (2 * i) + 2;
  }

  void insert(int index) {
    maxHeap.add(index);
    shiftUp(maxHeap.length - 1);
  }

  void remove(int data) {
    swap(maxHeap, 0, maxHeap.length - 1);
    maxHeap.removeLast();
    shiftDown(0);
  }

  void shiftUp(int index) {
    int parentIndx = parentIndex(index);
    while (index > 0 && maxHeap[parentIndx] < maxHeap[index]) {
      swap(maxHeap, parentIndx, index);
      index = parentIndx;
      parentIndx = parentIndex(index);
    }
  }

  void shiftDown(int index) {
    int endIndex = maxHeap.length - 1;
    int leftChildIdx = leftIndex(index);
    while (leftChildIdx < endIndex) {
      int rightChildIdx = rightIndex(index);
      int shift;
      if (leftChildIdx < endIndex &&
          maxHeap[leftChildIdx] > maxHeap[rightChildIdx]) {
        shift = leftChildIdx;
      } else {
        shift = rightChildIdx;
      }
      if (maxHeap[shift] > maxHeap[index]) {
        swap(maxHeap, shift, index);
        index = shift;
        leftChildIdx = leftIndex(index);
      }
    }
  }

  void swap(List arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }

  void display() {
    maxHeap.forEach((element) => print("$element"));
  }
}

void main() {
  List arr = [10, 50, 80, 3, 45];
  MaxHeap heap = MaxHeap();
  arr.forEach((element) => heap.insert(element));
  heap.remove(80);
  heap.display();
}
