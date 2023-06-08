import 'dart:collection';

class TrieNode {
  Map<String, TrieNode?> children = HashMap<String, TrieNode>();
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = "*";

  void insertData(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      String letter = str[i];
      if (!node.children.containsKey(letter)) {
        TrieNode newNode = TrieNode();
        node.children[letter] = newNode;
      }
      node = node.children[letter]!;
    }
    node.children[endSymbol] = TrieNode();
  }

  void display() {
    _displayHelper(root, '');
  }

  void _displayHelper(TrieNode node, String prefix) {
    if (node.children.containsKey(endSymbol)) {
      print(prefix);
    }
    node.children.forEach((key, value) {
      if (key != endSymbol) {
        _displayHelper(value!, prefix + key);
      }
    });
  }

  bool contains(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      String letter = str[i];
      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children[letter]!;
    }
    return node.children.containsKey(endSymbol);
  }

  bool delete(String str) {
    return _deleteHelper(str, root, 0);
  }

  bool _deleteHelper(String str, TrieNode node, int index) {
    if (index == str.length) {
      if (!node.children.containsKey(endSymbol)) {
        return false;
      }
      node.children.remove(endSymbol);
      return node.children.isEmpty;
    }
    String letter = str[index];
    if (!node.children.containsKey(letter)) {
      return false;
    }
    TrieNode childNode = node.children[letter]!;
    bool shouldDelte = _deleteHelper(str, childNode, index + 1);
    if (shouldDelte) {
      node.children.remove(letter);
      return node.children.isEmpty;
    }
    return false;
  }
}

void main() {
  Trie t = Trie();
  t.insertData('Joyal');
  t.insertData('Jobin');
  t.contains('Jobin');
  t.delete('Joyal');
  print(t.contains('obin'));
  t.display();
}
