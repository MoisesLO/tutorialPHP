import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Item> items = List<Item>();

  Future<List<Item>> _getItems() async {
    var data =
        json.decode(await rootBundle.loadString('assets/json/items.json'));
    var _items = List<Item>();
    for (var i in data) {
      _items.add(Item(i['title'], i['content']));
    }
    return _items;
  }

  @override
  void initState(){
    _getItems().then((value){
      setState(() {
        items.addAll(value);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial PHP'),
      ),
    );
  }
}

class Item {
  final String title;
  final String content;

  Item(this.title, this.content);
}
