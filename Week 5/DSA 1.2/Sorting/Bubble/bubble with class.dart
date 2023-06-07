class BubbleSort {
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
}

void main() {
  BubbleSort sort = BubbleSort();
  List<int> arr = [5, 2, 5, 9, 1, 5, 49];
  List<int> SortedArray = sort.bubbleSort(arr);
  print(SortedArray);
}
