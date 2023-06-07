import 'dart:collection';
import 'dart:io';

class Graph {
  Map<int, List<int>> map = HashMap<int, List<int>>();

  void insert(int vertex, int edge, bool direction) {
    if (!map.containsKey(vertex)) map[vertex] = [];
    if (!map.containsKey(edge)) map[edge] = [];
    connect(vertex, edge);
    if (direction) connect(edge, vertex);
  }

  void connect(int vertex, int edge) {
    List<int>? edges = map[vertex];
    edges!.add(edge);
    map[vertex] = edges;
  }

  void remove(int vertex) {
    map.remove(vertex);
    map.forEach((key, value) {
      value.remove(vertex);
    });
  }

  void bfs(int start) {
    Queue<int> queue = Queue();
    Set<int> set = Set();
    bfsHelper(start, queue, set);
  }

  void bfsHelper(int start, Queue<int> queue, Set<int> set) {
    queue.add(start);
    set.add(start);
    while (queue.isNotEmpty) {
      int vertex = queue.removeFirst();
      stdout.write('$vertex ');
      List<int>? edges = map[vertex];
      edges?.forEach((element) {
        if (!set.contains(element)) {
          queue.add(element);
          set.add(element);
        }
      });
    }

    if (set.length < map.length) {
      map.forEach((key, value) {
        if (!set.contains(key)) {
          start = key;
        }
      });
      bfsHelper(start, queue, set);
    }
    return;
  }

  void dfs(int start) {
    List<int> stack = [];
    Set<int> set = Set();
    dfsHelper(start, stack, set);
  }

  void dfsHelper(int start, List<int> stack, Set<int> set) {
    stack.add(start);
    set.add(start);
    while (stack.isNotEmpty) {
      int vertex = stack.removeLast();
      stdout.write("$vertex ");
      List<int>? edges = map[vertex];
      edges?.forEach((element) {
        if (!set.contains(element)) {
          stack.add(element);
          set.add(element);
        }
      });
    }
    if (set.length < map.length) {
      map.forEach((key, value) {
        if (!set.contains(key)) {
          start = key;
        }
      });
      dfsHelper(start, stack, set);
    }
    return;
  }

  void display() {
    map.forEach((key, value) => print('$key : $value'));
  }
}

void main() {
  Graph g = Graph();
  g.insert(5, 6, false);
  g.insert(8, 5, true);
  g.insert(8, 7, true);
  g.insert(7, 1, false);
  g.insert(7, 5, false);
  g.insert(6, 1, false);
  g.insert(9, 2, false);
  g.insert(4, 7, false);

  g.display();
  print('');
  // g.bfs(5);
  print('');
  g.dfs(9);
}
