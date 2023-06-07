List findSum(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length; j++) {
      if (arr[i] + arr[j] == target) {
        return [arr[i], arr[j]];
      }
    }
  }
  return [];
}

void main() {
  List<int> arr = [6, 4, 5, 2, 6, 5, 6, 6, 7, 8];
  int target = 10;

  List<dynamic> arr1 = findSum(arr, target);
  print(arr1);
}
