List selectionSort(List arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int small = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[small]) {
        small = j;
      }
    }
    int temp = arr[i];
    arr[i] = arr[small];
    arr[small] = temp;
  }
  return arr;
}

void main() {
  List<int> arr = [5, 2, 585, 5, 414, 52, 156, 34, 9];
  List sortedArr = selectionSort(arr);
  print(sortedArr);
}
