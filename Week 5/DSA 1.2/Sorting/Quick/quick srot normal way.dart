void quick(List<int> arr) {
  quickSortHelper(arr, 0, arr.length - 1);
}

void quickSortHelper(List<int> arr, int start, int end) {
  if (start >= end) {
    return;
  }
  int pivot = start;
  int left = start + 1;
  int right = end;
  while (left <= right) {
    if (arr[left] > arr[pivot] && arr[right] < arr[pivot]) {
      swap(arr, left, right);
    }
    if (arr[left] <= arr[pivot]) {
      left++;
    }
    if (arr[right] >= arr[pivot]) {
      right--;
    }
  }
  swap(arr, pivot, right);
  quickSortHelper(arr, start, right - 1);
  quickSortHelper(arr, right + 1, end);
}

void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

void main() {
  List<int> arr = [24, 9, 29, 14, 19, 27];
  quick(arr);
  print(arr);
}
