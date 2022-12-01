import 'package:flutter/material.dart';
import 'package:yapp/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yApp',
      theme: ThemeData(
          primaryColor: Colors.lightBlue,
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.lightBlue,
          appBarTheme: AppBarTheme(color: Colors.blue),
          textTheme: TextTheme(
              subtitle1: TextStyle(color: Colors.white),
              headline3: TextStyle(color: Colors.white))),
      home: HomePage(),
    );
  }
}
