import 'dart:collection';

Map<int, List<dynamic>> graph = HashMap();
void insert(int v1) {
  if (graph.containsKey(v1)) {
    print("The node is already present in the graph");
  } else {
    graph[v1] = [];
  }
}

void add_edge(int v1, int v2) {
  if (!graph.containsKey(v1)) {
    print("$v1 is not present in the graph");
  } else if (!graph.containsKey(v2)) {
    print("$v2 is not present in the graph");
  } else {
    graph[v1]!.add(v2);
    graph[v2]!.add(v1);
  }
}

void add_edge_weighted(int v1, int v2, int weight) {
  if (!graph.containsKey(v1)) {
    print("$v1 is not present in the graph");
  } else if (!graph.containsKey(v2)) {
    print("$v2 is not present in the graph");
  } else {
    graph[v1]!.add([v1, weight]);
    graph[v2]!.add([v1, weight]);
  }
}

void print_graph() {
  graph.forEach((key, value) => print("$key : $value"));
}

void main() {
  insert(10);
  insert(30);
  insert(190);
  add_edge(10, 30);
  add_edge(30, 190);
  add_edge(190, 10);
  add_edge_weighted(10, 30, 8);
  add_edge_weighted(30, 190, 9);
  add_edge_weighted(190, 10, 4);
  print_graph();
}
