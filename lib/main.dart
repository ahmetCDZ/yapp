import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yapp/screens/home_page.dart';
import 'package:yapp/tasks/myTasks.dart';

void main() async {
  runApp(ChangeNotifierProvider<MyTasks>(
      create: (BuildContext context) => MyTasks(), child: MyApp()));

  await MyTasks().creatSP();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yApp',
      theme: ThemeData(
          primaryColor: Colors.blue,
          primarySwatch: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.blue,
          appBarTheme: AppBarTheme(color: Colors.blue)),
      home: HomePage(),
    );
  }
}
