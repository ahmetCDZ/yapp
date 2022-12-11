import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yapp/tasks/tasks.dart';

class MyTasks with ChangeNotifier {
  late SharedPreferences sharedPreferencesObject;
  List<Tasks> tasks = [Tasks(title: 'Ahmet')];

  void addTasks(String newTask) {
    tasks.add(Tasks(title: newTask));
    savedTasks(tasks);
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

  Future<void> createPref() async {
    sharedPreferencesObject = await SharedPreferences.getInstance();
  }

  savedTasks(List<Tasks> value) {
    sharedPreferencesObject.setStringList('tasks', value);
  }

  void loadTasks() async {
    await createPref();
    tasks = sharedPreferencesObject.getStringList('tasks');
  }
}
