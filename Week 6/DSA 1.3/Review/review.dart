import 'dart:collection';
import 'dart:io';

Map<int, List<dynamic>> graph = HashMap();
void insert(int vertex) {
  if (graph.containsKey(vertex)) {
    print('The node is already present in the graph');
  } else {
    graph[vertex] = [];
  }
}

void add_edge(int vertex1, int vertex2) {
  if (!graph.containsKey(vertex1) && !graph.containsKey(vertex2)) {
    print("The vertex is not in the graph, Plz update the vertices first");
  } else {
    graph[vertex1]!.add(vertex2);
    graph[vertex2]!.add(vertex1);
  }
}

void add_edge_weight(int vertex1, int vertex2, int weight) {
  if (!graph.containsKey(vertex1) && !graph.containsKey(vertex2)) {
    print("The vertex is not in the graph, Plz update the vertices first");
  } else {
    graph[vertex1]!.add([vertex2, weight]);
    graph[vertex2]!.add([vertex1, weight]);
  }
}

bool connections(int vertex1, int vertex2) {
  if (!graph.containsKey(vertex1) && !graph.containsKey(vertex2)) {
    print("The vertex is not in the graph, Plz update the vertices first");
    return false;
  }
  if (graph[vertex1]!.contains(vertex2)) {
    return true;
  } else if (graph[vertex2]!.contains(vertex1)) {
    return true;
  }
  print('$vertex1 and $vertex2 are not connected');
  return false;
}

void DFS(int vertex) {
  if (!graph.containsKey(vertex)) {
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
    stdout.write('$node --> ');
    List<dynamic>? connections = graph[node];
    if (connections != null) {
      for (var connection in connections) {
        if (!visited[vertex]!) {
          visited[connection] = true;
          queue.add(connection);
        }
      }
    }
  }
}

// void remove(int vertex) {
//   graph.remove(vertex);
//   graph.map((key, value) {
//     value.remove(vertex);
//   });
// }
// void shortestPath(int startVertex, int endVertex) {
//   if (!graph.containsKey(startVertex) || !graph.containsKey(endVertex)) {
//     print('The vertex is not in the graph, Plz update the vertices first');
//     return;
//   }

//   Queue queue = new Queue();
//   Map<int, bool> visited = {};
//   Map<int, int?> distances = {};

//   // initialize all vertices as unvisited and their distance as null
//   for (int v in graph.keys) {
//     visited[v] = false;
//     distances[v] = null;
//   }

//   visited[startVertex] = true;
//   distances[startVertex] = 0;
//   queue.add(startVertex);

//   while (queue.isNotEmpty) {
//     int node = queue.removeFirst();
//     List<dynamic>? connections = graph[node];
//     if (connections != null) {
//       for (var connection in connections) {
//         if (!visited[connection]!) {
//           visited[connection] = true;
//           distances[connection] = distances[node]! + 1;
//           queue.add(connection);
//         }
//       }
//     }
//   }

//   int? distance = distances[endVertex];

//   if (distance == null) {
//     print('There is no path from $startVertex to $endVertex.');
//   } else {
//     List<int> path = [endVertex];
//     int current = endVertex;

//     // backtrack from endVertex to startVertex to get the shortest path
//     while (current != startVertex) {
//       for (int neighbor in graph[current]!) {
//         if (distances[neighbor]! < distances[current]!) {
//           current = neighbor;
//           path.add(neighbor);
//           break;
//         }
//       }
//     }
//     path = path.reversed.toList();
//     String pathString = path.join(' -> ');
//     print(
//         'Shortest path from $startVertex to $endVertex: $pathString. Distance: $distance');
//   }
// }

void display() {
  graph.forEach((key, value) => print("$key: $value"));
}

void main() {
  insert(10);
  insert(20);
  insert(30);
  add_edge(10, 30);
  add_edge(20, 30);
  add_edge(10, 20);
  add_edge_weight(10, 20, 4);
  add_edge_weight(10, 20, 5);
  add_edge_weight(10, 20, 6);
  display();
  print(connections(10, 20));
}
