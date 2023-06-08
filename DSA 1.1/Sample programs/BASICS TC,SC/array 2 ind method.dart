import 'dart:collection';

class Sample {
  List<int> twoNumberSum(List<int> array, int target) {
    Set<int> nums = HashSet<int>();
    for (int i = 0; i < array.length - 1; i++) {
      int num = array[i];
      int match = target - num;
      if (nums.contains(match)) {
        return [num, match];
      } else {
        nums.add(num);
      }
    }
    return [];
  }
}

void main(List<String> args) {
  Sample a = Sample();
  List<int> array = [6, 5, 7, 8, 9, 4, 0, 2];
  int target = 10;
  List<int> result = a.twoNumberSum(array, target);
  for (int i = 0; i < result.length; i++) {
    print(result[i]);
  }
}
