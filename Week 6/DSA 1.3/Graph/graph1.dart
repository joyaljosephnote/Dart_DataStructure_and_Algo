import 'dart:collection';
import 'dart:io';

class Graph<K> {
  Map<K, List<K>> map = HashMap();

  void insert(K vertex, K edge, bool direction) {
    map.putIfAbsent(vertex, () => []);
    map.putIfAbsent(edge, () => []);
    connect(vertex, edge);
    if (direction) {
      connect(edge, vertex);
    }
  }

  void connect(K vertex, K edge) {
    List<K>? edges = map[vertex];
    edges!.add(edge);
    map[vertex] = edges;
  }

  void display() {
    map.forEach((key, value) => print('$key : $value'));
  }

  void display2() {
    for (var vertex in map.keys) {
      print('$vertex : ${map[vertex]}');
    }
  }

  void remove(K vertex) {
    map.remove(vertex);
    map.forEach((key, value) {
      value.remove(vertex);
    });
  }

  void bfs(K start) {
    Queue<K> queue = Queue();
    Set<K> set = Set();
    bfsHelper(start, queue, set);
  }

  void bfsHelper(K start, Queue<K> queue, Set<K> set) {
    queue.add(start);
    set.add(start);
    while (queue.isNotEmpty) {
      K vertex = queue.removeFirst();
      stdout.write('$vertex ');
      List<K>? temp = map[vertex];
      temp!.forEach((element) {
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

  void dfs(K start) {
    List<K> stack = [];
    Set<K> set = {};
    dfsHelper(start, stack, set);
  }

  void dfsHelper(K start, List<K> stack, Set<K> set) {
    stack.add(start);
    set.add(start);
    while (stack.isNotEmpty) {
      K vertex = stack.removeLast();
      stdout.write('$vertex ');
      List<K>? temp = map[vertex];
      temp!.forEach((element) {
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
}

void main() {
  Graph g = Graph();
  g.insert('A', 'B', true);
  g.insert('B', 'C', true);
  g.insert('D', 'C', true);
  g.insert('E', 'D', true);
  g.insert('D', 'F', true);

  print('');
  g.bfs('D');
  g.display();
}
