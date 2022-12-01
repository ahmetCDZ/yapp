import 'package:flutter/material.dart';
import 'package:yapp/item_Cards.dart';
import 'package:yapp/tasks/myTasks.dart';
import 'package:yapp/tasks/tasks.dart';

class HomePage extends StatelessWidget {
  String isEnterText = '';
  bool isBool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(title: Text('yAPP')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Lütfe yAPPılacak planınızı giriniz',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  onChanged: (value) {
                    isEnterText = value;
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textButtonWidget('yAPPılacaklar'),
                    textButtonWidget('yAPPılanlar'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 100),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: MyTasks().tasks.length,
                        itemBuilder: ((context, index) => Cards(
                            MyTasks().tasks[index].title,
                            MyTasks().tasks[index].isDone))),
                  ),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: (() {
          MyTasks().addTasks(isEnterText);
        }),
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class textButtonWidget extends StatelessWidget {
  final String text;
  textButtonWidget(this.text);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {},
        child: Text(text));
  }
}
