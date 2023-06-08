void main() {
  List<int> arr = [6, 1, 6, 8, 10, 4, 15, 6, 3, 9, 6];
  int target = 6;

  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      for (int j = arr.length - 1; i > j; i--) {
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  print(arr);
}
