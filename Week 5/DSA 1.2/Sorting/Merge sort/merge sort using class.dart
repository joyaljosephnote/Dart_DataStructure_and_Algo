void main() {
  List arr = [10, 2, 5, 45, 8, 2, 1];
  List? sortedArray = mergeSort(arr);
  print(sortedArray);
}

List? mergeSort(List arr) {
  if (arr.length <= 1) {
    return arr;
  }
  int start = 0;
  int end = arr.length;
  int mid = (start + end) ~/ 2;
  List firstHalf = arr.sublist(start, mid);
  List secondHalf = arr.sublist(mid, end);
  firstHalf = mergeSort(firstHalf)!;
  secondHalf = mergeSort(secondHalf)!;
  return join(firstHalf, secondHalf);
}

List? join(List firsthalf, List secondHalf) {
  int i = 0, j = 0;
  List newArray = [];
  while (i < firsthalf.length && j < secondHalf.length) {
    if (firsthalf[i] <= secondHalf[j]) {
      newArray.add(firsthalf[i++]);
    } else {
      newArray.add(secondHalf[j++]);
    }
  }
  while (i < firsthalf.length) {
    newArray.add(firsthalf[i++]);
  }
  while (j < secondHalf.length) {
    newArray.add(secondHalf[j++]);
  }
  return newArray;
}
