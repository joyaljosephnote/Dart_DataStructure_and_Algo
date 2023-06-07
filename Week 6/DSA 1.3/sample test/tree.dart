import 'dart:io';

class Node {
  late int data;
  Node? left, right;
  Node(this.data);
}

class BinaryTree {
  Node? root;

  void insertData(int data) {
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
    if (root == null) {
      return false;
    }
    if (data == root) {
      return true;
    }
    Node? currentNode = root;
    while (currentNode != null) {
      if (data < currentNode.data) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data) {
        currentNode = currentNode.right;
      } else {
        return true;
      }
    }
    return false;
  }

  void remove(int data) {
    removeHelper(data, null, root);
  }

  void removeHelper(int data, Node? parentNode, Node? currentNode) {
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
          currentNode.data = _findLargest(currentNode.left);
          removeHelper(currentNode.data, currentNode, currentNode.right);
        } else {
          currentNode.data = _findSmallest(currentNode.right);
          removeHelper(currentNode.data, currentNode, currentNode.left);
        }
      }
    }
  }

  int _findLargest(Node? currrentNode) {
    if (currrentNode?.right == null) {
      return currrentNode!.data;
    }
    return _findLargest(currrentNode?.right);
  }

  int _findSmallest(Node? currentNode) {
    if (currentNode?.left == null) {
      return currentNode!.data;
    }
    return _findSmallest(currentNode?.left);
  }

  bool isBST(Node? root, [var smallest, var largest]) {
    if (root == null) {
      return true;
    }
    if (smallest == null) {
      smallest = _findSmallest(root);
    }
    if (largest == null) {
      largest = _findLargest(root);
    }
    if (root.data < smallest || root.data > largest) {
      return false;
    }
    return isBST(root.left, smallest, root.data - 1) &&
        isBST(root.right, root.data + 1, largest);
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
        print("Closest value of $data is ${currentNode.data}");
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

  void traverseDisplay() {
    print('InOrder');
    _inOrderHelper(root);
    print('');
    print('PreOrder');
    _preOrderHelper(root);
    print('');
    print('PostOrder');
    _postOrderHelper(root);
    print('');
  }

  void _inOrderHelper(Node? temp) {
    if (temp != null) {
      _inOrderHelper(temp.left);
      stdout.write("${temp.data} --> ");
      _inOrderHelper(temp.right);
    }
  }

  void _preOrderHelper(Node? temp) {
    if (temp != null) {
      stdout.write("${temp.data} --> ");
      _preOrderHelper(temp.left);
      _preOrderHelper(temp.right);
    }
  }

  void _postOrderHelper(Node? temp) {
    if (temp != null) {
      _postOrderHelper(temp.left);
      _postOrderHelper(temp.right);
      stdout.write("${temp.data} --> ");
    }
  }
}

void main() {
  BinaryTree bst = BinaryTree();
  bst.insertData(50);
  bst.insertData(30);
  bst.insertData(60);
  bst.insertData(15);
  bst.insertData(35);
  bst.insertData(54);
  bst.insertData(80);
  // bst.traverseDisplay();
  // print(bst.contains(40));
  print("isBST${(bst.root)}");
}
