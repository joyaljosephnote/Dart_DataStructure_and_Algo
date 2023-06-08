import 'dart:collection';

class Sample {
  List<int> twoNumbersofSum(List<int> array, int target) {
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

void main() {
  Sample a = Sample();
  List<int> array = [1, 2, 3, 4, 5, 6, 7];
  int target = 10;
  List<int> result = a.twoNumbersofSum(array, target);
  for (int i = 0; i < array.length; i++) {
    print(result[i]);
  }
}
