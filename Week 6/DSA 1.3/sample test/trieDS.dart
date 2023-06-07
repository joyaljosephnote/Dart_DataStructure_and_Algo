import 'dart:collection';

class TrieNode {
  Map<String, TrieNode> children = HashMap();
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = "**";

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
    return _deletHelper(str, root, 0);
  }

  bool _deletHelper(String str, TrieNode node, int index) {
    if (index == str.length) {
      if (!root.children.containsKey(endSymbol)) {
        return false;
      }
      node.children.remove(endSymbol);
      return node.children.isEmpty;
    }
    String letter = str[index];
    TrieNode childDelete = node.children[letter]!;
    bool shouldDelet = _deletHelper(str, childDelete, index + 1);
    if (shouldDelet) {
      node.children.remove(letter);
      return node.children.isEmpty;
    }
    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert('joyal');
  print(trie.contains('joyal'));
}
