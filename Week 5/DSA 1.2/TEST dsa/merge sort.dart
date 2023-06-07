void main() {
  List arr = [10, 2, 4, 5, 12, 178, 1];
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
  int i = 0;
  int j = 0;
  List newArr = [];
  while (i < firstHalf.length && j < secondHalf.length) {
    if (firstHalf[i] <= secondHalf[j]) {
      newArr.add(firstHalf[i++]);
    } else {
      newArr.add(secondHalf[j++]);
    }
  }
  while (i < firstHalf.length) {
    newArr.add(firstHalf[i++]);
  }
  while (j < secondHalf.length) {
    newArr.add(secondHalf[j++]);
  }
  return newArr;
}
