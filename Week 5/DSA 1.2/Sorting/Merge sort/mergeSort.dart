void main() {
  List arr = [98, 12, 50, 58, 13, 32, 5];
  print(mergeSort(arr));
}

List? mergeSort(List arr) {
  if (arr.length <= 1) return arr;
  int start = 0;
  int end = arr.length;
  int mid = (start + end) ~/ 2;
  List firstHalf = arr.sublist(start, mid);
  List secondHalf = arr.sublist(mid, end);
  firstHalf = mergeSort(firstHalf)!;
  secondHalf = mergeSort(secondHalf)!;
  return join(firstHalf, secondHalf);
}

List? join(List firstHalf, List secondHalf) {
  int i = 0, j = 0;
  List newArray = [];
  while (i < firstHalf.length && j < secondHalf.length) {
    if (firstHalf[i] <= secondHalf[j]) {
      newArray.add(firstHalf[i++]);
    } else {
      newArray.add(secondHalf[j++]);
    }
  }

  while (j < secondHalf.length) {
    newArray.add(secondHalf[j++]);
  }
  while (i < firstHalf.length) {
    newArray.add(firstHalf[i++]);
  }
  return newArray;
}
