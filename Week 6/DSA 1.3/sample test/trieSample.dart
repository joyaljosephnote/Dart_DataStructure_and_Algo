import 'dart:collection';

class TrieNode {
  Map<String, TrieNode?> children = HashMap();
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = '**';

  void insert(String str) {
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
    displayHelper(root, '');
  }

  void displayHelper(TrieNode node, String prefix) {
    if (node.children.containsKey(endSymbol)) {
      print(prefix);
    }
    node.children.forEach((key, value) {
      if (key != endSymbol) {
        displayHelper(value!, prefix + key);
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
    return deleteHelper(str, root, 0);
  }

  bool deleteHelper(String str, TrieNode node, int index) {
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
    bool shouldDelete = deleteHelper(str, childNode, index + 1);
    if (shouldDelete) {
      node.children.remove(letter);
      return node.children.isEmpty;
    }
    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert('joyal');
  trie.display();
}
