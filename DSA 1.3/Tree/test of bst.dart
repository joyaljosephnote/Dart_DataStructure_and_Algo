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
      root = newNode;
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

  void remove(int data) {
    _removeHelper(data, null, root);
  }

  void _removeHelper(int target, Node? parentNode, Node? currentNode) {
    while (currentNode != null) {
      if (target < currentNode.data) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (target > currentNode.data) {
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
          currentNode.data = _findLargest(currentNode.left);
          _removeHelper(currentNode.data, currentNode, currentNode.right);
        } else {
          currentNode.data = _findSmallest(currentNode.right);
          _removeHelper(currentNode.data, currentNode, currentNode.left);
        }
      }
    }
  }

  int _findLargest(Node? currentNode) {
    if (currentNode?.right == null) {
      return currentNode!.data;
    } else {
      return _findLargest(currentNode!.right);
    }
  }

  int _findSmallest(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data;
    } else {
      return _findSmallest(currentNode!.left);
    }
  }

  void inOrder() {
    print('Printed the inOrder');
    _inOrderHelper(root);
    print('');
  }

  void _inOrderHelper(Node? temp) {
    if (temp != null) {
      _inOrderHelper(temp.left);
      stdout.write('${temp.data} --> ');
      _inOrderHelper(temp.right);
    }
  }

  void preOrder() {
    print('Printed the preOrder');
    _preOrderHelper(root);
    print('');
  }

  void _preOrderHelper(Node? temp) {
    if (temp != null) {
      stdout.write('${temp.data} --> ');
      _preOrderHelper(temp.left);
      _preOrderHelper(temp.right);
    }
  }

  void postOrder() {
    print('Printed the postOrder');
    _postOrderHelper(root);
    print('');
  }

  void _postOrderHelper(Node? temp) {
    if (temp != null) {
      _postOrderHelper(temp.left);
      _postOrderHelper(temp.right);
      stdout.write('${temp.data} --> ');
    }
  }

  void closest(int data) {
    if (root == null) {
      print('Tree is empty');
      return;
    }
    int close = root!.data;
    Node? currentNode = root;
    while (currentNode != null) {
      if (data == currentNode.data) {
        print('Closeset value is ${currentNode.data}');
        return;
      } else if (data < currentNode.data) {
        if ((currentNode.data - data).abs() < (close - data).abs()) {
          close = currentNode.data;
        }
        currentNode = currentNode.left;
      } else {
        if ((currentNode.data - data).abs() < (close - data).abs()) {
          close = currentNode.data;
        }
        currentNode = currentNode.right;
      }
    }
    print('The closest value is $close');
    return;
  }

  void prime(Node? temp) {
    if (temp != null) {
      prime(temp.left);
      if (primeNo(temp.data)) {
        print(temp.data);
      }
      prime(temp.right);
    }
  }

  bool primeNo(int data) {
    for (int i = 2; i < data; i++) {
      if (data % i == 0) {
        return false;
      }
    }
    return true;
  }

  void proveDisplay() {
    _proveTheIntNumber(root);
  }

  void _proveTheIntNumber(Node? temp) {
    if (temp != null) {
      _proveTheIntNumber(temp.left);
      print(the_number_is_int(temp.data));
      _proveTheIntNumber(temp.right);
    }
  }

  bool the_number_is_int(var data) {
    if (data is int) {
      return true;
    }
    return false;
  }
}

void main() {
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(10);
  tree.insert(8);
  tree.insert(7);
  tree.insert(11);
  tree.insert(13);
  tree.insert(12);
  print('');
  print(tree.contains(13));

  print('');
  tree.inOrder();
  tree.preOrder();
  tree.postOrder();

  print('');
  tree.closest(15);
  print('');
  tree.proveDisplay();
}
