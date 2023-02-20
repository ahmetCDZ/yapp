import 'package:shared_preferences/shared_preferences.dart';
import 'package:yapp/tasks/tasks.dart';
import 'package:flutter/material.dart';

class MyTasks with ChangeNotifier {
  late String firstTitle;
  ThemeData blueMode = ThemeData(
    primaryColor: Colors.blue,
    primarySwatch: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.blue,
    appBarTheme: AppBarTheme(color: Colors.blue),
  );

  ThemeData yellowMode = ThemeData(
    primaryColor: Colors.yellow,
    primarySwatch: Colors.yellow,
    scaffoldBackgroundColor: Colors.yellow,
    appBarTheme: AppBarTheme(color: Colors.yellow),
  );
  bool _isBlue = true;
  late SharedPreferences pref;
  List<Tasks> tasks = [Tasks(title: '')];

  Future<void> createSP() async {
    pref = await SharedPreferences.getInstance();
  }

  void saveData(String value) {
    pref.setString('key', value);
  }

  void addTasks(String newTask) {
    tasks.add(Tasks(title: newTask));
    firstTitle = tasks[0].title;
    saveData(firstTitle);
    notifyListeners();
  }

  void loadTasks() async {
    await createSP();
    firstTitle = pref.getString('key')!;
  }

  void markCheck(int index) {
    tasks[index].markCheck();
    notifyListeners();
  }

  void deletedTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  ThemeData get themeColor {
    return _isBlue ? blueMode : yellowMode;
  }

  void changeTheme() {
    _isBlue = !_isBlue;
    notifyListeners();
  }
}
