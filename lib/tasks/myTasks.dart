import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yapp/tasks/tasks.dart';
import 'package:flutter/material.dart';

class MyTasks with ChangeNotifier {
  List<Tasks> tasks = [];
  static SharedPreferences? pref;
  List<String> tasksString = [];
  Future<void> creatSP() async {
    pref = await SharedPreferences.getInstance();
  }

  void saveSP(List<Tasks> tasks) {
    tasksString.clear();
    for (var item in tasks) {
      tasksString.add(json.encode(item.toMap()));
    }
    pref?.setStringList('data', tasksString);
  }

  void loadSP() {
    List<String>? tempList = pref?.getStringList('data') ?? [];
    tasks.clear();
    for (var item in tempList) {
      tasks.add(Tasks.fromMap(jsonDecode(item)));
    }
  }

  void addTasks(String newTask) {
    tasks.add(Tasks(title: newTask, isDone: false));
    saveSP(tasks);
    notifyListeners();
  }

  void markCheck(int index) {
    tasks[index].markCheck();
    saveSP(tasks);
    notifyListeners();
  }

  void deletedTask(int index) {
    tasks.removeAt(index);
    saveSP(tasks);
    notifyListeners();
  }
}
