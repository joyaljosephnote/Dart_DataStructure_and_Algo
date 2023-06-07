// void main() {
//   List<int> arr = [1, 2, 3, 4, 5, 6];
//   int largest = 0;

//   for (int i = 0; i < arr.length; i++) {
//     if (arr[i] > largest) {
//       largest = arr[i];
//     }
//   }
//   print(largest);
// }

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6];
  int largest = arr[0];
  int second = arr[0];

  for (int i = 0; i < arr.length; i++) {
    if (arr[i] > largest) {
      second = largest;
      largest = arr[i];
    } else if (arr[i] > second && arr[i] != largest) {
      second = arr[i];
    }
  }
  print(second);
}
