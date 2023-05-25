class Task {
  final String name;
  bool isDone = false;

  Task({required this.name, required this.isDone});

  dynamic toggleDone() {
    isDone = !isDone;
  }
}
