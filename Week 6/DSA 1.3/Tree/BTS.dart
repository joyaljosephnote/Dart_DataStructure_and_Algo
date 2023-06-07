import 'dart:io';

class Node {
  late int data;
  Node? left, right;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  void insert(int data) {
    Node newNode = Node(data);
    if (root == null) {
      root = newNode;
    } else {
      Node? currentNode = root;
      while (true) {
        if (data < currentNode!.data) {
          if (currentNode.left == null) {
            currentNode.left = Node(data);
            break;
          } else {
            currentNode = currentNode.left;
          }
        } else {
          if (currentNode.right == null) {
            currentNode.right = Node(data);
            break;
          } else {
            currentNode = currentNode.right;
          }
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
          //when node have only left child
          currentNode.data = _findLargest(currentNode.left);
          _removeHelper(currentNode.data, currentNode, currentNode.left);
        } else {
          //if(currentNode.left == null) && current have left and right child
          currentNode.data = _findSmallest(currentNode.right);
          _removeHelper(currentNode.data, currentNode, currentNode.right);
        }
      }
    }
    return;
  }

  int _findSmallest(Node? currentNode) {
    if (currentNode?.left == null)
      return currentNode!.data;
    else
      return _findSmallest(currentNode!.left);
  }

  int _findLargest(Node? currentNode) {
    if (currentNode?.right == null)
      return currentNode!.data;
    else
      return _findLargest(currentNode!.right);
  }

  void closest(int data) {
    //to find the closest value in tree
    if (root == null) {
      print('empty tree');
      return;
    }
    int close = root!.data;
    Node? currenetNode = root;
    while (currenetNode != null) {
      if (currenetNode.data == data) {
        print('closest value is ${currenetNode.data}');
        return;
      } else if (data < currenetNode.data) {
        if ((currenetNode.data - data).abs() < (close - data).abs())
          close = currenetNode.data;
        currenetNode = currenetNode.left;
      } else {
        if ((currenetNode.data - data).abs() < (close - data).abs())
          close = currenetNode.data;
        currenetNode = currenetNode.right;
      }
    }
    print('closest vlue is $close');
    return;
  }

  void inOrder() {
    //inOrder display
    _inOrderHelper(root);
    print('');
  }

  void _inOrderHelper(Node? temp) {
    if (temp != null) {
      _inOrderHelper(temp.left);
      stdout.write('${temp.data} -> ');
      _inOrderHelper(temp.right);
    }
  }

  void preOrder() {
    //preOrder display
    _preOrderHelper(root);
    print('');
  }

  void _preOrderHelper(Node? temp) {
    if (temp != null) {
      stdout.write('${temp.data} -> ');
      _preOrderHelper(temp.left);
      _preOrderHelper(temp.right);
    }
  }

  void postOrder() {
    //postOrder display
    _postOrderHelper(root);
    print('');
  }

  void _postOrderHelper(Node? temp) {
    if (temp != null) {
      _postOrderHelper(temp.left);
      _postOrderHelper(temp.right);
      stdout.write('${temp.data} -> ');
    }
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
  // print(tree.contains(9));
  //tree.closest(15);
  tree.inOrder();
  print('');
  tree.preOrder();
  print('');
  tree.postOrder();
  print('');
  //print(tree.contains(7));
  // tree.remove(8);
  // print(tree.contains(8));
}
