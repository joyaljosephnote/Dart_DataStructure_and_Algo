class Sort {
  List insertionSort(List<int> arr) {
    for (int i = 1; i < arr.length - 1; i++) {
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
}

void main() {
  Sort sort = Sort();
  List<int> arr = [64, 34, 25, 12, 12, 11, 90];
  List result = sort.insertionSort(arr);
  print(result);
}
