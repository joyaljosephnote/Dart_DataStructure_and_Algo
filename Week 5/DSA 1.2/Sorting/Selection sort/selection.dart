void main() {
  List<int> arr = [5, 6, 43, 2, 3, 1, 8, 9, 11];
  for (int i = 0; i < arr.length; i++) {
    int small = i;
    for (int j = i; j < arr.length; j++) {
      if (arr[j] < arr[small]) {
        small = j;
      }
    }
    int temp = arr[i];
    arr[i] = arr[small];
    arr[small] = temp;
  }
  print(arr);
}
