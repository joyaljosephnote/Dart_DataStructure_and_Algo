import 'dart:collection';

void main() {
  Map account = HashMap();
  account[1] = 'joyal';
  print(account);
  account.addAll({2: 'Jobin', 3: 'Joseph'});
  print(account);
  account.forEach((key, value) => print('$key --> $value'));
  print(account.isEmpty);
  print(account.isNotEmpty);
  print(account.containsKey(2));
  print(account.containsValue('Jobin'));
  account.removeWhere((key, value) => key % 2 == 0);
  print(account);
  account.addAll({2: 'Vishnu', 4: 'John'});
  account.addAll({5: 'Jesto', 6: 'Kannan'});
  print(account);
  account.addAll({2: 'Vishunu Jith'});
  print(account);
}
