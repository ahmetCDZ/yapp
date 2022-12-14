import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yapp/screens/home_page.dart';
import 'package:yapp/tasks/myTasks.dart';

void main() {
  runApp(ChangeNotifierProvider<MyTasks>(
      create: (context) => MyTasks(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<MyTasks>(context, listen: false).loadTasks();
    return MaterialApp(
      title: 'yApp',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.blue,
        appBarTheme: AppBarTheme(color: Colors.blue),
      ),
      home: HomePage(),
    );
  }
}
