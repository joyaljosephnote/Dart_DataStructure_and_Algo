void main() {
  List<int> arr = [10, 12, 45, 75, 8, 9, 15];

  int maximum = arr[0];
  int minimum = arr[0];

  for (int i = 0; i < arr.length; i++) {
    if (arr[i] > maximum) {
      maximum = arr[i];
    }
    if (arr[i] < minimum) {
      minimum = arr[i];
    }
  }
  print('Maxima = $maximum');
  print('Minima = $minimum');
}
