void main() {
  //Delete Duplicate
  List<int> arr = [1, 1, 2, 4, 5];
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] == arr[j]) {
        for (int k = j; k < arr.length - 1; k++) {
          arr[k] = arr[k + 1];
        }
        arr.length--;
        j--;
      }
    }
  }
  for (int i = 0; i < arr.length; i++) {
    print(arr[i]);
  }
}
