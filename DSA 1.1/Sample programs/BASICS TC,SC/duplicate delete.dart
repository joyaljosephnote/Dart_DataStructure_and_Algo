void main() {
  List<int> array = [1, 1, 2, 3, 5];
  Set<int> set = {};
  List<int> result = [];

  for (int i = 0; i < array.length; i++) {
    if (!set.contains(array[i])) {
      set.add(array[i]);
      result.add(array[i]);
    }
  }
  print(result);
}
