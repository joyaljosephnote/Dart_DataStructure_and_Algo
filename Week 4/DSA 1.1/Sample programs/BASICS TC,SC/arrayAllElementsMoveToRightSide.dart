void main() {
  List<int> arr = [6, 1, 6, 8, 10, 4, 15, 6, 3, 9, 6];
  int? target = 6;
  for (int j = 0; j < arr.length; j++) {
    if (arr[j] == target) {
      for (int i = arr.length - 1; i > j; i--) {
        var temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  print(arr);
}
