import 'dart:collection';

class TrieNode {
  Map<String, TrieNode?> children = HashMap();
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = "**";

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
}

void main() {
  Trie t = Trie();
  t.insertData('joyal');
  print(t.contains('Joyal'));
  print(t.contains('joyal'));
  t.insertData('jobin');
  print(t.contains('jobin'));
}
