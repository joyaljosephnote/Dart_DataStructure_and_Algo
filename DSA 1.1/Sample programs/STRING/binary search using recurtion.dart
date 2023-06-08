void main() {
  List<int> arr = [1, 2, 3, 4, 5, 9];
  int find = 9;
  int result = binarySearch(arr, find, 0, arr.length - 1);
  if (result == -1) {
    print("Element not found");
  } else {
    print('$result');
  }
}

int binarySearch(List<int> arr, int find, int start, int end) {
  if (start > end) {
    return -1;
  }
  int mid = ((start + end) ~/ 2);
  if (arr[mid] == find) {
    return mid;
  } else if (arr[mid] < find) {
    return binarySearch(arr, find, mid + 1, end);
  } else {
    return binarySearch(arr, find, start, mid - 1);
  }
}
