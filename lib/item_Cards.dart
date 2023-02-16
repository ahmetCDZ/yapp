import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) markCheck;
  final Function(DismissDirection) deletedTasks;

  Cards(this.title, this.isDone, this.markCheck, this.deletedTasks);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: deletedTasks,
      key: Key(title),
      child: Card(
          color: isDone ? Colors.blue.shade50 : Colors.white,
          elevation: isDone ? 1 : 5,
          shadowColor: Colors.blueGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.blue,
                  decoration: isDone ? TextDecoration.lineThrough : null),
            ),
            trailing: Checkbox(
              onChanged: markCheck,
              value: isDone,
              activeColor: Colors.black,
            ),
          )),
    );
  }
}
