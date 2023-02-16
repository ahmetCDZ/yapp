import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yapp/item_Cards.dart';
import 'package:yapp/tasks/myTasks.dart';

class HomePage extends StatelessWidget {
  String isEnterText = '';
  bool isBool = true;
  var myTextField = TextField();
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      appBar: AppBar(
          title: Text(
        'yAPP',
        style: TextStyle(color: Colors.white),
      )),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: myTextField = TextField(
                    controller: myController,
                    decoration: InputDecoration(
                      labelText: ' Lütfe yAPPılacak planınızı giriniz',
                    ),
                    onChanged: (value) {
                      isEnterText = value;
                    },
                  ),
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
                child: Center(
                  child: ListView(
                    padding: EdgeInsets.only(left: 25),
                    scrollDirection: Axis.horizontal,
                    children: [
                      textButtonWidget('yAPPılacaklar'),
                      textButtonWidget('yAPPılanlar'),
                    ],
                  ),
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
                        itemCount: Provider.of<MyTasks>(context).tasks.length,
                        itemBuilder: (context, index) =>
                            cardsMethod(context, index)),
                  ),
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: (() {
          Provider.of<MyTasks>(context, listen: false).addTasks(isEnterText);
          myController.clear();
        }),
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Cards cardsMethod(BuildContext context, int index) {
    return Cards(
      Provider.of<MyTasks>(context).tasks[index].title,
      Provider.of<MyTasks>(context).tasks[index].isDone,
      (_) {
        Provider.of<MyTasks>(context, listen: false).markCheck(index);
      },
      (_) {
        Provider.of<MyTasks>(context, listen: false).deletedTask(index);
      },
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          if (text == 'yAPPılacaklar') {}
        },
        child: Text(text));
  }
}
