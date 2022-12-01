import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(title: Text('yAPP')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Lütfe yAPPılacak planınızı giriniz',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 3))),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  textButtonWidget('yAPPılacaklar'),
                  textButtonWidget('yAPPılanlar')
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: null,
        child: Icon(Icons.add),
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
        onPressed: null,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text(text),
        ));
  }
}
