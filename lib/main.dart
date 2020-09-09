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

const Html = """
<div>

<p>PHP (acrónimo de "PHP: Hypertext Preprocessor") es un lenguaje interpretado de alto nivel embebido en páginas HTML y ejecutado en el servidor.</p>

<p>Hay que entender primero como funciona la solicitud de páginas en un navegador para comenzar a programar en PHP.</p>

<h3>Comunicación entre el cliente y el servidor sin PHP:</h3>
<p>1 - Tipeamos en la barra del navegador la dirección y el archivo a solicitar.</p>

<p>2 - El web browser (navegador) envía el mensaje a través de Internet a la computadora, por ejemplo  www.lanacion.com/pagina1.htm solicitando la página (archivo) pagina1.htm</p>

<p>3 - El web server (servidor web, que puede ser el Apache, IIS, etc.) que es un programa que se ejecuta en la máquina www.lanacion.com, recibe el mensaje y lee el archivo solicitado desde el disco duro.</p>

<p>4 - El servidor web envía el archivo solicitado por el navegador tal cual está en el disco duro.</p>

<p>5 - El navegador muestra en pantalla el archivo que envió el servidor web. </p>

<p>Este proceso siempre es el mismo cuando hablamos de páginas estáticas (páginas que no cambian), cualquiera sea el cliente que solicita la página el contenido siempre será el mismo.<br>
</p><p>La única forma que el contenido del archivo cambie es que el administrador de ese sitio web edite el contenido del archivo pagina1.htm y haga modificaciones.</p>



<h3>Comunicación entre el cliente y el servidor con PHP:</h3>
<p>1 - Tipeamos en la barra del navegador la dirección y el archivo a solicitar.</p>

<p>2 - El web browser (navegador) envía el mensaje a través de Internet a la computadora llamada www.lanacion.com solicitando la página (archivo) pagina1.php</p>

<p>3 - El web server (servidor web, que puede ser el Apache, IIS, etc.), recibe el mensaje y al ver que la extension es "php" solicita al interprete de PHP (que es otro programa que se ejecuta en el servidor web) que le envíe el archivo.</p>

<p>4 - El intérprete PHP lee desde el disco el archivo pagina1.php</p>

<p>5 - El intérprete PHP ejecuta los comandos contenidos en el archivo y eventualmente se comunica con un gestor de base de datos (ejemplos de ellos pueden ser MySql, MariaDB, Oracle, Informix, SQL Server, etc.) </p>

<p>6 - Luego de ejecutar el programa contenido en el archivo envía éste al servidor web.</p>

<p>7 - El servidor web envía la página al cliente que la había solicitado.</p>

<p>8 - El navegador muestra en pantalla el archivo que envió el servidor web. </p>

<p>Para aquellas personas que conocen otros lenguajes de programación (C - Java - C# - Pascal etc.) la salida de los resultados normalmente es la pantalla, en PHP la salida es la página HTML (luego ésta viaja por internet y llega al cliente que la solicitó)</p>

</div>
""";
