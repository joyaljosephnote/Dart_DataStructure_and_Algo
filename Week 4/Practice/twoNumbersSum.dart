class Sample {
  List<int> twoNumberSum(List<int> array, int target) {
    for (int i = 0; i < array.length; i++) {
      for (int j = 0; j < array.length; j++) {
        if (array[i] + array[j] == target) {
          return [array[i], array[j]];
        }
      }
    }
    return [];
  }
}

void main() {
  List<int> array = [1, 2, 3, 4, 5, 6];
  Sample s = Sample();
  List<int> result = s.twoNumberSum(array, 10);
  for (int i = 0; i < result.length; i++) {
    print(result[i]);
  }
}
