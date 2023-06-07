import 'dart:collection';

void hashMap() {
  //creating an empty map
  Map<int, String> accounts = HashMap<int, String>();
  //adding multiple value to the map
  //accounts[1] = 'Joyal';
  accounts.addAll({1: 'Joyal', 2: 'John'});
  print(accounts);
  print(accounts.keys);
  print(accounts.values);
  print(accounts.length);
  print(accounts.entries);
  print(accounts.hashCode);
  accounts.remove(2);
  accounts.addAll({4: 'Hello', 5: 'man'});
  accounts.removeWhere((key, value) => key == 5);
  print(accounts);
  List newlist = accounts.keys.toList();
  print(newlist);
}

void main() {
  hashMap();
}
