int binarySearch(List<int> arr, int target, int left, int right) {
  while (left <= right) {
    int mid = ((left + right) ~/ 2);
    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      return binarySearch(arr, target, mid + 1, right);
    } else {
      return binarySearch(arr, target, left, mid - 1);
    }
  }
  return -1;
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6];
  int target = 6;
  int result = binarySearch(arr, target, 0, arr.length - 1);

  if (result == -1) {
    print("target not found");
  } else {
    print(result);
  }
}
