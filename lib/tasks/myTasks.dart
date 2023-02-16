import 'package:flutter/foundation.dart';
import 'package:yapp/tasks/tasks.dart';

class MyTasks with ChangeNotifier {
  List<Tasks> tasks = [Tasks(title: 'Ahmet')];

  void addTasks(String newTask) {
    tasks.add(Tasks(title: newTask));
    notifyListeners();
  }

  void markCheck(int index) {
    tasks[index].markCheck();
    notifyListeners();
  }

  void deletedTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
