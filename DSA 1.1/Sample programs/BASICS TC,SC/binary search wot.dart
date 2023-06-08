int binarySearch(List<int> arr, int target) {
  int left = 0;
  int right = arr.length - 1;

  while (left <= right) {
    int mid = (left + right) ~/ 2;

    if (arr[mid] == target) {
      return mid; // found the target at index mid
    } else if (arr[mid] < target) {
      left = mid + 1; // continue searching on the right half
    } else {
      right = mid - 1; // continue searching on the left half
    }
  }

  return -1; // target not found in array
}

void main() {
  List<int> arr = [1, 3, 5, 7, 9];
  int target = 5;

  int index = binarySearch(arr, target);

  if (index == -1) {
    print("Target $target not found in array");
  } else {
    print("Target $target found at index $index");
  }
}
