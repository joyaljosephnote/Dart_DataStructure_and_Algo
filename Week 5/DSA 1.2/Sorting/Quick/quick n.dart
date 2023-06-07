void main() {
  List<int> arr = [10, 2, 45, 6, 4];
  quickSort(arr, 0, arr.length - 1);
  print(arr);
}

void quickSort(List arr, int start, int end) {
  if (start >= end) {
    return;
  }
  int pivot = start;
  int left = start + 1;
  int right = end;
  while (left <= right) {
    if (arr[left] > arr[pivot] && arr[right] < arr[pivot]) {
      swap(arr, left++, right--);
    }
    if (arr[left] <= arr[pivot]) left++;
    if (arr[right] >= arr[pivot]) right--;
  }
  swap(arr, right, pivot);
  quickSort(arr, start, right - 1);
  quickSort(arr, right + 1, end);
}

void swap(List arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}
