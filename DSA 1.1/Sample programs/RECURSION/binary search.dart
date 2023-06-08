class BinarySearch {
  void searcher() {
    List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int target = 8;
    int? result = search(array, target, 0, array.length - 1);
    if (result == -1) {
      print('element not found');
    } else {
      print('$target is at position $result');
    }
  }
}

int search(List array, int element, int start, int end) {
  int mid = start + (end - start) ~/ 2;
  if (array[mid] == element) {
    return mid;
  } else if (start >= end) {
    return -1;
  }
  if (element > array[mid]) {
    return search(array, element, mid + 1, end);
  } else {
    return search(array, element, start, mid - 1);
  }
}

void main() {
  BinarySearch b = BinarySearch();
  b.searcher();
}
