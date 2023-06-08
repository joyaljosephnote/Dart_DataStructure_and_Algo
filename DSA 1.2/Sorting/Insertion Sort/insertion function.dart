List insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int current = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > current) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = current;
  }
  return arr;
}

void main() {
  List<int> arr = [64, 34, 25, 10, 2, 19];
  List result = insertionSort(arr);
  print(result);
}
