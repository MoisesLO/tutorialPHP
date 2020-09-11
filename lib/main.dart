import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
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
      _items.add(Item(i['title'], i['subtitle'], i['content']));
    }
    return _items;
  }

  @override
  void initState() {
    _getItems().then((value) {
      setState(() {
        items.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [Icon(Icons.whatshot), Text(' Tutorial PHP')],
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () =>
                    showSearch(context: context, delegate: DataSearch(items)))
          ],
        ),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _listItem(index);
            },
            itemCount: items.length));
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/img/logo.png"),
          ),
          title: Text(items[index].title),
          subtitle: Text(items[index].subtitle),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(item: items[index])));
          },
        ),
      ),
    );
  }
}

class Item {
  final String title;
  final String subtitle;
  final String content;

  Item(this.title, this.subtitle, this.content);
}

class DetailPage extends StatelessWidget {
  final Item item;

  const DetailPage({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(item.title),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: HtmlWidget(
                item.content,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        ));
  }
}

class DataSearch extends SearchDelegate<Item> {
  List<Item> items;
  List<Item> itemsDisplay = List<Item>();

  DataSearch(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query = '';
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    itemsDisplay = items
        .where((note) => note.title.toLowerCase().contains(query))
        .toList();
    return itemsDisplay.length == 0 ? Text('No hay Resultados ...') : ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _listItem(index, context);
        },
        itemCount: itemsDisplay.length);
  }

  _listItem(index, context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/img/logo.png"),
          ),
          title: Text(itemsDisplay[index].title),
          subtitle: Text(itemsDisplay[index].subtitle),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailPage(item: itemsDisplay[index])));
          },
        ),
      ),
    );
  }
}

const Html = """

""";
