void main() {
  List arr = [10, 20, 30, 50, 60];
  int size = arr.length;
  for (int i = (size ~/ 2) - 1; i >= 0; i--) {
    heapfiy(arr, size, i);
  }

  print(arr);
  for (int i = arr.length - 1; i >= 0; i--) {
    swap(arr, 0, i);
    heapfiy(arr, i, 0);
  }
  print(arr);
}

void heapfiy(List heap, int size, int i) {
  int largest = i;
  int leftChild = (2 * i) + 1;
  int rightChild = (2 * i) + 2;

  while (leftChild < size && heap[leftChild] > heap[largest]) {
    largest = leftChild;
  }
  while (rightChild < size && heap[rightChild] > heap[largest]) {
    largest = rightChild;
  }
  if (largest != i) {
    swap(heap, i, largest);
    heapfiy(heap, size, largest);
  }
}

void swap(List heap, int i, int largest) {
  int temp = heap[largest];
  heap[largest] = heap[i];
  heap[i] = temp;
}
