int binarySearch(List<int> arr, int target) {
  int left = 0;
  int right = arr.length - 1;
  while (left <= right) {
    int mid = (left + right) ~/ 2;

    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5];
  int target = 4;

  int result = binarySearch(arr, target);

  if (result == -1) {
    print('Value not found');
  } else {
    print('Tharget $target find at $result');
  }
}
