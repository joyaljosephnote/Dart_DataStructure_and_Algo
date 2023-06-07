class HashTable {
  late List<List<dynamic>> table;
  late int size;

  HashTable(int size) {
    this.table = List<List<dynamic>>.filled(size, []);
    this.size = size;
  }

  int hash(String key) {
    int total = 0;
    for (int i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % this.size;
  }

  void set(String key, dynamic value) {
    int index = this.hash(key);
    List<dynamic> bucket = this.table[index];
    if (bucket.isEmpty) {
      this.table[index] = [
        [key, value]
      ];
    } else {
      dynamic sameKeyItem = bucket.firstWhere(
        (item) => item[0] == key,
        orElse: () => null,
      );
      if (sameKeyItem != null) {
        sameKeyItem[1] = value;
      } else {
        bucket.add([key, value]);
      }
    }
  }

  dynamic get(String key) {
    int index = this.hash(key);
    List<dynamic> bucket = this.table[index];
    if (bucket.isNotEmpty) {
      dynamic sameKeyItem = bucket.firstWhere(
        (item) => item[0] == key,
        orElse: () => null,
      );
      if (sameKeyItem != null) {
        return sameKeyItem[1];
      }
    }
    return null;
  }

  void remove(String key) {
    int index = this.hash(key);
    List<dynamic> bucket = this.table[index];
    if (bucket.isNotEmpty) {
      dynamic sameKeyItem = bucket.firstWhere(
        (item) => item[0] == key,
        orElse: () => null,
      );
      if (sameKeyItem != null) {
        bucket.remove(sameKeyItem);
      }
    }
  }

  void display() {
    for (int i = 0; i < size; i++) {
      if (this.table[i].isNotEmpty) {
        print("$i ${this.table[i]}");
      }
    }
  }
}

void main() {
  HashTable table = HashTable(10);
  table.set("Name", "Joyal");
  table.set("age", 25);
  table.display();
  print(table.get('Name'));
  table.set("Name", "Jobin");
  print(table.get("appu"));
  table.remove("Name");
  table.display();
}
