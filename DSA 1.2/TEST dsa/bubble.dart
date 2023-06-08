List<int> bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = 1; j < arr.length - 1; j++) {
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
  List<int> arr = [5, 2, 8, 5, 7, 21];
  List<int> result = bubbleSort(arr);
  print(result);
}
