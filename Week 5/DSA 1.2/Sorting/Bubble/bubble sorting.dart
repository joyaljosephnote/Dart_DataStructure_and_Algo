void main() {
  List<int> arr = [5, 2, 3, 7, 15, 1, 4];
  for (int i = 0; i < arr.length; i++) {
    for (int j = 1; j < arr.length; j++) {
      if (arr[j - 1] > arr[j]) {
        int temp = arr[j];
        arr[j] = arr[j - 1];
        arr[j - 1] = temp;
      }
    }
  }
  print(arr);
}
