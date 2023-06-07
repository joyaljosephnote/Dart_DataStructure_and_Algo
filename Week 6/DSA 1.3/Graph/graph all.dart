import 'dart:collection';
import 'dart:io';

Map<int, List<dynamic>> graph = HashMap();
void insert(int v1) {
  if (graph.containsKey(v1)) {
    print('The node is already present in the graph');
  } else {
    graph[v1] = [];
  }
}

void add_edge(int vertexFrom, int vertexTo) {
  if (!graph.containsKey(vertexFrom)) {
    print('$vertexFrom is not present in the graph');
  } else if (!graph.containsKey(vertexTo)) {
    print('$vertexTo is not in the graph');
  } else {
    graph[vertexFrom]!.add(vertexTo);
    graph[vertexTo]!.add(vertexFrom);
  }
}

void add_edge_weighted(int vertex1, int vertex2, int weight) {
  if (!graph.containsKey(vertex1)) {
    print("$vertex1 not in the graph");
  } else if (!graph.containsKey(vertex2)) {
    print('$vertex2 not in the graph');
  } else {
    graph[vertex1]!.add([vertex1, weight]);
    graph[vertex2]!.add([vertex1, weight]);
  }
}

bool vertexConnection(int vertex1, int vertex2) {
  if (!graph.containsKey(vertex1)) {
    print("$vertex1 is not in the graph");
    return false;
  } else if (!graph.containsKey(vertex2)) {
    print("$vertex2 is not in the graph");
    return false;
  }
  if (graph[vertex1]!.contains(vertex2)) {
    return true;
  } else if (graph[vertex2]!.contains(vertex1)) {
    return true;
  }
  print('$vertex1 and $vertex2 are not connceted');
  return false;
}

void DFS(int vertex) {
  if (!graph.containsKey(vertex)) {
    print('Vertex not in the graph');
    return;
  }
  Map<int, bool> visited = {};
  for (int v in graph.keys) {
    visited[v] = false;
  }
  _DFS(vertex, visited);
}

void _DFS(int vertex, Map<int, bool> visited) {
  visited[vertex] = true;
  stdout.write('$vertex --> ');
  for (int n in graph[vertex]!) {
    if (!visited[n]!) {
      _DFS(n, visited);
    }
  }
}

void BFS(int vertex) {
  Map<int, bool> visited = {};
  for (int v in graph.keys) {
    visited[v] = false;
  }

  Queue queue = new Queue();
  visited[vertex] = true;
  queue.add(vertex);

  while (queue.isNotEmpty) {
    int node = queue.removeFirst();
    stdout.write("$node --> ");
    List<dynamic>? connections = graph[node];
    if (connections != null) {
      for (var connection in connections) {
        if (!visited[connection]!) {
          visited[connection] = true;
          queue.add(connection);
        }
      }
    }
  }
}

void print_graph() {
  graph.forEach((key, value) => print("$key : $value"));
}

void main() {
  insert(10);
  insert(20);
  insert(30);
  add_edge(10, 20);
  add_edge(30, 10);
  print_graph();
  print(vertexConnection(10, 20));
  DFS(10);
  print('');
  BFS(10);
}
