void main() {
  List<List<int>> graph = List.generate(4, (_) => List.filled(4, 0));

  void insert(int v1) {
    if (v1 > graph.length - 1 || v1 < 0) {
      print("The node is out of bounds");
    } else if (graph[v1][v1] != 0) {
      print("The node is already present in the graph");
    } else {
      graph[v1][v1] = v1;
    }
  }

  void add_edge(int v1, int v2) {
    if (v1 > graph.length - 1 || v1 < 0) {
      print("$v1 is not present in the graph");
    } else if (v2 > graph.length - 1 || v2 < 0) {
      print("$v2 is not present in the graph");
    } else {
      graph[v1][v2] = 1;
      graph[v2][v1] = 1;
    }
  }

  void add_edge_weighted(int v1, int v2, int weight) {
    if (v1 > graph.length - 1 || v1 < 0) {
      print("$v1 is not present in the graph");
    } else if (v2 > graph.length - 1 || v2 < 0) {
      print("$v2 is not present in the graph");
    } else {
      graph[v1][v2] = weight;
      graph[v2][v1] = weight;
    }
  }

  void print_graph() {
    for (int i = 0; i < graph.length; i++) {
      String row = '';
      for (int j = 0; j < graph[i].length; j++) {
        row += '${graph[i][j]} ';
      }
      print(row);
    }
  }

  insert(0);
  insert(1);
  insert(2);
  insert(3);
  add_edge(0, 1);
  add_edge(1, 2);
  add_edge(2, 3);
  add_edge_weighted(0, 2, 8);
  add_edge_weighted(0, 1, 4);
  add_edge_weighted(1, 2, 3);
  add_edge_weighted(3, 2, 5);
  add_edge_weighted(3, 0, 7);
  print_graph();
}
