int binarySearch(List<int> arr, int target) {
  int left = 0, right = arr.length - 1;
  while (left <= right) {
    int mid = (left + right) ~/ 2;

    if (arr[mid] == target) {
      if (mid - 1 >= 0 && arr[mid] == arr[mid - 1]) {
        right = mid - 1;
      } else {
        arr[mid] = arr[mid] * mid;
        return mid;
      }
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6];
  int target = 5;
  int index = binarySearch(arr, target);

  if (index == -1) {
    print('Target not found');
  } else {
    print('Target $target is found at $index');
  }
  print(arr);
}
