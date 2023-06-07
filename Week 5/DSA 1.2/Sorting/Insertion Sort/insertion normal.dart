void main() {
  List<int> arr = [1, 3, 5, 1, 2, 3, 8, 9, 15, 7];
  for (int i = 1; i < arr.length; i++) {
    int j = i - 1, temp = arr[i];
    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = temp;
  }
  print(arr);
}
