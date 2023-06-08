void main() {
  List arr = [10, 23, 7, 78, 9];
  List primeArr = [];
  List nonePrime = [];
  int flag = 0;
  num avgOfPrime = 0;
  num avgOfNonPrime = 0;
  for (int i = 0; i < arr.length; i++) {
    flag = 0;
    for (int j = 2; j < arr[i]; j++) {
      if (arr[i] % j == 0) {
        flag = 1;
        break;
      }
    }
    if (flag == 0) {
      primeArr.add(arr[i]);
      avgOfPrime += arr[i];
    } else if (flag == 1) {
      nonePrime.add(arr[i]);
      avgOfNonPrime += arr[i];
    }
  }
  print("Prime values are $primeArr");
  print('Average of Prime ${avgOfPrime / primeArr.length}');
  print("NonePrime values are $nonePrime");
  print('Average of nonPrime ${avgOfNonPrime / nonePrime.length}');
}
