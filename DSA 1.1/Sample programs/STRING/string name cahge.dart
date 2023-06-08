void main() {
  String name = "Mom";

  for (int i = 0; i < name.length; i++) {
    if (i == 2) {
      name = "${name.substring(0, 2)}*";
    }
  }
  print("$name");
}
