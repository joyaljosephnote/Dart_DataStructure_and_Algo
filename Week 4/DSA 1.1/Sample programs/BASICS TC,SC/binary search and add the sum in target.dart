int binarySearch(List<int> arr, int target) {
  int left = 0, right = arr.length - 1;
  while (left <= right) {
    int mid = (left + right) ~/ 2;
    if (arr[mid] == target) {
      if (mid - 1 >= 0 && arr[mid - 1] == target) {
        right = mid - 1;
      } else {
        arr[mid] = target * mid;
        return mid;
      }
    } else if (left < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

void main() {
  List<int> arr = [1, 2, 3, 3, 3, 4];
  int target = 4;
  int result = binarySearch(arr, target);
  if (result == -1) {
    print('Value not found');
  } else {
    print('Value found at ${result + 1}');
  }
  print(arr);
}
