import 'dart:io';

class Node {
  late int data;
  Node? left, right;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;
  void insert(int data) {
    Node? newNode = Node(data);
    if (root == null) {
      root = Node(data);
      return;
    }
    Node? currentNode = root;
    while (true) {
      if (data < currentNode!.data) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          break;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  bool contains(int data) {
    if (root != null) {
      Node? currentNode = root;
      if (currentNode!.data == data) {
        return true;
      }
      while (currentNode != null) {
        if (data < currentNode.data) {
          currentNode = currentNode.left;
        } else if (data > currentNode.data) {
          currentNode = currentNode.right;
        } else {
          return true;
        }
      }
    }
    return false;
  }

  void delete(int data) {
    _deleteHelper(data, null, root);
  }

  void _deleteHelper(int data, Node? parentNode, Node? currentNode) {
    while (currentNode != null) {
      if (data < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left == null && currentNode.right == null) {
          if (parentNode == null) {
            root = null;
            return;
          } else if (parentNode.left == currentNode) {
            parentNode.left = null;
            return;
          } else if (parentNode.right == currentNode) {
            parentNode.right = null;
            return;
          }
        } else if (currentNode.right == null) {
          currentNode.data = _findTheLargest(currentNode.right);
          _deleteHelper(currentNode.data, currentNode, currentNode.right);
        } else {
          currentNode.data = _findTheSmallest(currentNode.left);
          _deleteHelper(currentNode.data, currentNode, currentNode.left);
        }
      }
    }
  }

  int _findTheLargest(Node? currentNode) {
    if (currentNode?.right == null) {
      return currentNode!.data;
    } else {
      return _findTheLargest(currentNode!.right);
    }
  }

  int _findTheSmallest(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data;
    } else {
      return _findTheSmallest(currentNode!.left);
    }
  }

  void inOrder() {
    _inOrderHelper(root);
    print('');
  }

  void _inOrderHelper(Node? temp) {
    if (temp != null) {
      _inOrderHelper(temp.left);
      stdout.write("${temp.data}  --> ");
      _inOrderHelper(temp.right);
    }
  }
}

void main() {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(10);
  tree.insert(20);
  tree.insert(30);

  print(tree.contains(30));
  tree.inOrder();
}
