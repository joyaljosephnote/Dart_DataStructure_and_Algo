class SelectionSort {
  List? selectionSort(List arr) {
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
    return arr;
  }
}

void main() {
  SelectionSort sort = SelectionSort();
  List<int> arr = [10, 2, 151, 12, 457, 136, 1];
  List? sortedArr = sort.selectionSort(arr);
  print(sortedArr);
}
