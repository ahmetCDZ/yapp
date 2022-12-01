class Tasks {
  final String title;
  bool isDone;

  Tasks({required this.title, this.isDone = false});

  void markCheck() {
    isDone = !isDone;
  }
}
