import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yapp/screens/home_page.dart';
import 'package:yapp/tasks/myTasks.dart';
import 'package:yapp/tasks/tasks.dart';

void main() {
  runApp(ChangeNotifierProvider<MyTasks>(
      create: (BuildContext context) => MyTasks(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MyTasks>(context, listen: false).loadTasks();
    return MaterialApp(
      title: 'yApp',
      theme: Provider.of<MyTasks>(context).themeColor,
      home: HomePage(),
    );
  }
}
