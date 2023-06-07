class MaxHeap {
  List maxHeap = [];

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
    maxHeap.add(index);
    shiftUp(maxHeap.length - 1);
  }

  void display() {
    maxHeap.forEach((element) => print(element));
  }

  void shiftUp(int index) {
    int parentIndex = parent(index);
    while (index > 0 && maxHeap[parentIndex] < maxHeap[index]) {
      swap(maxHeap, parentIndex, index);
      index = parentIndex;
      parentIndex = parent(index);
    }
  }

  void shiftDown(int index) {
    int endIndex = maxHeap.length - 1;
    int leftChildIndex = leftChildIdx(index);
    while (leftChildIndex <= endIndex) {
      int rightChildIndex = rightChildIdx(index);
      int shift;
      if (rightChildIndex < endIndex &&
          maxHeap[rightChildIndex] > maxHeap[leftChildIndex]) {
        shift = rightChildIndex;
      } else {
        shift = leftChildIndex;
      }
      if (maxHeap[shift] > maxHeap[index]) {
        swap(maxHeap, shift, index);
        shift = index;
        leftChildIndex = leftChildIdx(index);
      } else {
        return;
      }
    }
  }

  void remove() {
    swap(maxHeap, 0, maxHeap.length - 1);
    maxHeap.removeLast();
    shiftDown(0);
  }

  void swap(List arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main() {
  List arr = [10, 80, 60];
  MaxHeap heap = MaxHeap();
  arr.forEach((element) => heap.insert(element));
  heap.display();
  heap.remove();
  print('');
  heap.display();
}
