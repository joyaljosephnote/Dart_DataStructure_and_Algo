class MaxHeap {
  List maxHeap = [];
  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return (i * 2) + 1;
  }

  int rightChild(int i) {
    return (i * 2) + 2;
  }

  void insert(int currentIdx) {
    maxHeap.add(currentIdx);
    shiftUp(maxHeap.length - 1);
  }

  void shiftUp(int currentIdx) {
    int parentIdx = parent(currentIdx);
    while (currentIdx > 0 && maxHeap[parentIdx] < maxHeap[currentIdx]) {
      swapX(maxHeap, parentIdx, currentIdx);
      currentIdx = parentIdx;
      parentIdx = parent(currentIdx);
    }
  }

  void shiftDo(int currentIdx) {
    int endIdx = maxHeap.length - 1;
    int leftChildIdx = leftChild(currentIdx);
    while (leftChildIdx <= endIdx) {
      int rightChildIdx = rightChild(currentIdx);
      int shif;
      if (rightChildIdx < endIdx &&
          maxHeap[rightChildIdx] > maxHeap[leftChildIdx]) {
        shif = rightChildIdx;
      } else {
        shif = leftChildIdx;
      }
      if (maxHeap[shif] > maxHeap[currentIdx]) {
        swapX(maxHeap, shif, currentIdx);
        currentIdx = shif;
        leftChildIdx = leftChild(currentIdx);
      } else {
        return;
      }
    }
  }

  void swapX(List a, int i, int j) {
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
  }

  void remove() {
    swapX(maxHeap, 0, maxHeap.length - 1);
    maxHeap.removeAt(maxHeap.length - 1);
    shiftDo(0);
  }

  void disp() {
    maxHeap.forEach((element) => print(element));
  }
}

void main() {
  List a = [100, 210, 600, 800, 250, 900, 2000];
  MaxHeap x = MaxHeap();
  a.forEach((element) => x.insert(element));
  x.remove();
  x.disp();
}
