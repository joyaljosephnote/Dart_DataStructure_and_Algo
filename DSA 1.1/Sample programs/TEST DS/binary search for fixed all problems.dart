int binarySearch(List<int> arr, int target) {
  int left = 0, right = arr.length - 1;
  while (left <= right) {
    int mid = (left + right) ~/ 2;
    if (arr[mid] == target) {
      if (mid - 1 >= 0 && target == arr[mid - 1]) {
        right = mid - 1;
      } else {
        return mid;
      }
    } else if (target > arr[mid]) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

void main() {
  List<int> arr = [1, 2, 3, 3, 5, 5];
  int target = 5;
  int index = binarySearch(arr, target);
  if (index == -1) {
    print('Target $target is not find');
  } else {
    print('Target $target is find at the ${index} index');
  }
}
