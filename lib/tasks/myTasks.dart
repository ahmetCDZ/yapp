import 'package:yapp/tasks/tasks.dart';

class MyTasks {
  final List<Tasks> tasks = [
    Tasks(title: 'Elkektri öde'),
    Tasks(title: 'Su öde'),
  ];
  void addTasks(String newTask) {
    tasks.add(Tasks(title: newTask));
  }
}
