import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final bool isDone;

  Cards(this.title, this.isDone);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shadowColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.blue),
          ),
          trailing: Checkbox(
            onChanged: null,
            value: isDone,
            activeColor: Colors.black,
          ),
        ));
  }
}
