class Tasks {
  String title;
  bool isDone;

  Tasks({this.title = '', this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  Tasks.fromMap(Map map)
      : title = map['title'],
        isDone = map['isDone'];

  void markCheck() {
    isDone = !isDone;
  }
}
