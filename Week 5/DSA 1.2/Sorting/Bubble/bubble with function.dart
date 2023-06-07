List<int> bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = 1; j < arr.length; j++) {
      if (arr[j - 1] > arr[j]) {
        int temp = arr[j];
        arr[j] = arr[j - 1];
        arr[j - 1] = temp;
      }
    }
  }
  return arr;
}

void main() {
  List<int> arr = [5, 2, 7, 15, 1, 4];
  List<int> result = bubbleSort(arr);
  print(result);
}
