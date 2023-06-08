class Sample {
  List<int> ValuesArrToLast(List<int> arr, int target) {
    for (int j = 0; j < arr.length; j++) {
      if (arr[j] == target) {
        for (int i = arr.length - 1; i > j;) {
          var temp = arr[i];
          arr[i] = arr[j];
          arr[j] = temp;
          return arr;
        }
      }
    }
    return [];
  }
}

void main() {
  Sample a = Sample();
  List<int> arr = [6, 5, 4, 8, 1, 6, 6, 2];
  int target = 6;
  List<int> result = a.ValuesArrToLast(arr, target);
  print(result);
}
