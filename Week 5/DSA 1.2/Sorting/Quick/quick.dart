void quick(List<int> arr, int start, int end) {
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
  quick(arr, start, right - 1);
  quick(arr, right + 1, end);
  return;
}

void swap(List arr, int i, int j) {
  if (i != j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}

void main() {
  List<int> arr = [98, 5, 2, 45, 25, 1, 55];
  quick(arr, 0, arr.length - 1);
  print(arr);
}
