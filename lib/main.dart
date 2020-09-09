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
<h2>33 - Subir un archivo al servidor (Upload)</h2>
<div style="display:block;float:left;margin: 5px;"> 
 <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable1 -->
<ins class="adsbygoogle uno" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="4716538363" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_1_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_1_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=4716538363&amp;adk=3130936298&amp;adf=1795251393&amp;w=336&amp;lmt=1599684297&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D33%26cod%3D54%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;dt=1599684297565&amp;bpp=11&amp;bdt=145&amp;idt=54&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=103414840475&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684298&amp;ga_hid=1552536227&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=236&amp;ady=85&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530621%2C21066124%2C21066357%2C21067347%2C21066807&amp;oid=3&amp;pvsid=3444295944769303&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=%7C%7CleE%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=feRCTG3gcg&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=59" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CIj-x7L43OsCFY2BUAYdR6YCQQ" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
</div> 


<p>Una actividad común en un sitio es poder almacenar un archivo en el servidor, más comunmente conocido como upload.</p> 
<p>Se necesita en muchas ocasiones este algoritmo, por ejemplo para subir fotos, documentos, programas, etc.</p>
<p>Se requieren dos páginas, una de ellas, un formulario donde seleccionamos el archivo a enviar y otra página donde se graba el archivo en el servidor.</p>
<p>El formulario para hacer la selección del archivo es:</p>
<p class="titulopagina">pagina1.html</p>
<pre class="recuadroborde">&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post" enctype="multipart/form-data"&gt;
    Seleccione el archivo:
    &lt;input type="file" name="foto"&gt;&lt;br&gt;
    &lt;input type="submit" value="Enviar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>Veamos los puntos que tenemos que respetar cuando efectuamos el upload de archivos:</p>
<pre>  &lt;form action="pagina2.php" method="post" enctype="multipart/form-data"&gt;
</pre>
<p>Se define una nueva propiedad para la etiqueta form, con esta indicamos que dentro del formulario de carga se envían archivos. Hay que tener mucho cuidado cuando tipeamos esta propiedad, si nos equivocamos en algún caracter el proceso de upload no funcionará.</p>
<p>El control HTML para la selección del archivo se llama "file":</p>
<pre>    &lt;input type="file" name="foto"&gt;&lt;br&gt;
</pre>
<p>Automáticamente aparecerá el botón dentro de la página para poder navegar en nuestro disco duro para la selección del archivo (por defecto PHP está configurado para poder cargar archivos de hasta 2 Mb, de todos modos, a este valor lo podemos modificar).</p>

<p>La segunda página es:</p>
<pre class="recuadroborde">&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  copy(\$_FILES['foto']['tmp_name'], \$_FILES['foto']['name']);
  echo "La foto se registro en el servidor.&lt;br&gt;";
  \$nom = \$_FILES['foto']['name'];
  echo "&lt;img src=\"\$nom\"&gt;";
  ?&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>

<p>Cuando se ejecuta esta página, ya está almacenado en el servidor el archivo, en una carpeta temporal. Ahora nos hace falta copiar el mismo a la carpeta donde se encuentra nuestra página (en definitiva nuestro sitio de internet). Para esto llamamos a la función copy:</p>
<pre>copy(\$_FILES['foto']['tmp_name'],\$_FILES['foto']['name']);
</pre>
<p>La matriz \$_FILES almacena el nombre del archivo guardado en el directorio temporal (\$_FILES['foto']['tmp_name']) y el nombre del archivo originario (\$_FILES['foto']['name'])</p>
<p>Por último mostramos en la página el archivo de la imagen que se almacenó en el servidor:</p>
<pre>\$nom=\$_FILES['foto']['name'];
echo "&lt;img src=\"\$nom\"&gt;";
</pre>

<p>Otras cosas interesantes que tiene la matriz \$_FILES:</p>
<pre>\$_FILES['foto']['name'] El nombre original del fichero en 
                        la máquina cliente.
\$_FILES['foto']['type'] El tipo de archivo (si el navegador
                        lo proporciona). Un ejemplo podría ser "image/gif".
\$_FILES['foto']['size'] El tamaño en bytes del fichero recibido.
\$_FILES['foto']['tmp_name'] El nombre del archivo temporal que se 
                            utiliza para almacenar en el servidor el archivo recibido.
</pre>

<br>
<br>

<h2>Problema resuelto.</h2>
<p>Copiar el contenido de este cuadro de texto al VS Code y almacenarlo en la carpeta c:/xampp/htdocs con un nombre con extensión php.<br>
  luego abrir el navegador (Chrome, FireFox, IExplorer etc.) y en la barra de direcciones tipear:<br> http://localhost/pagina1.php (o el nombre del
archivo que le dió)  </p>

    pagina1.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post" enctype="multipart/form-data"&gt;
    Seleccione el archivo:
    &lt;input type="file" name="foto"&gt;&lt;br&gt;
    &lt;input type="submit" value="Enviar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
    <br>
	 <a href="https://www.scratchya.com.ar/problemas/phpya/resu/54/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
<!--    <a href="http://localhost:8080/problemas/phpya/resu/54/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->

    <br>
<table width="650px">
<tbody><tr>
<td align="left">	

</td>
</tr>
</tbody></table>

	
    <br>pagina2.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  copy(\$_FILES['foto']['tmp_name'], \$_FILES['foto']['name']);
  echo "La foto se registro en el servidor.&lt;br&gt;";
  \$nom = \$_FILES['foto']['name'];
  echo "&lt;img src=\"\$nom\"&gt;";
  ?&gt;
&lt;/body&gt;

&lt;/html&gt;</pre><br>
</form>






	

<h2>Problema propuesto.</h2>
<p>Confeccionar un programa que permita hacer multiples upload con una página (por ejemplo que permita seleccionar hasta 3 archivos)</p>

<p>Solución</p>

pagina1.php<br>
<pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post" enctype="multipart/form-data"&gt;
    Seleccione el archivo 1:
    &lt;input type="file" name="foto1"&gt;&lt;br&gt;
    Seleccione el archivo 2:
    &lt;input type="file" name="foto2"&gt;&lt;br&gt;
    Seleccione el archivo 2:
    &lt;input type="file" name="foto3"&gt;&lt;br&gt;
    &lt;input type="submit" value="Enviar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
 <br>
<!-- <a href="http://localhost:8080/problemas/phpya/propu/54/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->


  <a href="https://www.scratchya.com.ar/problemas/phpya/propu/54/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
	<br>	
pagina2.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;

  &lt;?php
  if (\$_FILES['foto1']['tmp_name'] != "") {
    copy(\$_FILES['foto1']['tmp_name'], \$_FILES['foto1']['name']);
    \$nom = \$_FILES['foto1']['name'];
    echo "&lt;img src=\"\$nom\"&gt;";
  }
  if (\$_FILES['foto2']['tmp_name'] != "") {
    copy(\$_FILES['foto2']['tmp_name'], \$_FILES['foto2']['name']);
    \$nom = \$_FILES['foto2']['name'];
    echo "&lt;img src=\"\$nom\"&gt;";
  }
  if (\$_FILES['foto3']['tmp_name'] != "") {
    copy(\$_FILES['foto3']['tmp_name'], \$_FILES['foto3']['name']);
    \$nom = \$_FILES['foto3']['name'];
    echo "&lt;img src=\"\$nom\"&gt;";
  }

  ?&gt;

&lt;/body&gt;

&lt;/html&gt;</pre>
</div>

</form>



  

<br>
<div>
<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_2_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_2" name="aswift_2" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=3215562993&amp;w=336&amp;lmt=1599684297&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D33%26cod%3D54%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;dt=1599684297576&amp;bpp=1&amp;bdt=157&amp;idt=54&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280&amp;nras=1&amp;correlator=103414840475&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684298&amp;ga_hid=1552536227&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=231&amp;ady=2773&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530621%2C21066124%2C21066357%2C21067347%2C21066807&amp;oid=3&amp;pvsid=3444295944769303&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;xpc=oXliC5enU7&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=58" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!2" data-google-query-id="CJHayLL43OsCFRaX7QoddfgN3g" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_3_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_3_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_3" name="aswift_3" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=1656673016&amp;w=336&amp;lmt=1599684297&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D33%26cod%3D54%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;dt=1599684297577&amp;bpp=1&amp;bdt=158&amp;idt=61&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280%2C336x280&amp;nras=1&amp;correlator=103414840475&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684298&amp;ga_hid=1552536227&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=572&amp;ady=2773&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530621%2C21066124%2C21066357%2C21067347%2C21066807&amp;oid=3&amp;pvsid=3444295944769303&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;ifi=3&amp;uci=a!3&amp;btvi=2&amp;fsb=1&amp;xpc=93l9nhZlma&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=65" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!3" data-google-query-id="COrfzrL43OsCFZH47QodvP0Nyw" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>


<form name="form1" method="post" action="">
  <div>
   <h2><a href="../index.php?inicio=30">Retornar</p></h2>   
  </div>

  
</form>





</div>























<div>
<h2>34 - Creación y lectura de una cookie</h2>
<div style="display:block;float:left;margin: 5px;"> 
 <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable1 -->
<ins class="adsbygoogle uno" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="4716538363" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_1_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_1_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=4716538363&amp;adk=3130936298&amp;adf=1795251393&amp;w=336&amp;lmt=1599684389&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D34%26cod%3D55%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;adsid=ChEI8Prh-gUQ2MmR8LDLp_fIARJMAINxD-z1GolJQI3H2ScdGomA5STdUP2EKIon5buLnMW2DJ40SMhrVwGwTRZ1W6HE-6d5oz9h2IG3oWZrp3MRd8wWTw50wcCPou5UZA&amp;dt=1599684389523&amp;bpp=109&amp;bdt=49&amp;idt=379&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=1030896526166&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684390&amp;ga_hid=2135596744&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=236&amp;ady=85&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530672%2C21066124%2C21066648%2C21066945&amp;oid=3&amp;pvsid=1279525747851265&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C0%2C0%2C1456%2C740&amp;vis=1&amp;rsz=%7C%7CleE%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;jar=2020-09-09-20&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=sIrZmLwGKl&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=387" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CKvuyN743OsCFc-E7Qod_GAFPA" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
</div> 


<p>El protocolo HTTP es desconectado. Esto significa que cada vez que solicitamos una página a un servidor representa una conexión distinta.</p>
<p>Una cookie es una pequeña cantidad de datos almacenada por el navegador del usuario cuando solicita una página a un servidor. El que envía que se genere la cookie es el servidor.</p>
<p>Una cookie consta de un nombre, un valor, una fecha de expiración y un servidor. Una cookie está limitada a 4KB.</p>
<p>Luego que una cookie es creada sólo el sitio que la creó puede leerla. Luego de creada una cookie, cada vez que el navegador del usuario visita el sitio, se envía dicha cookie. Otra cosa importante que hay que tener en cuenta es que el usuario del browser puede configurar el mismo para no permitir la creación de cookies, lo que significa que el uso de cookies debe hacerse con moderación y cuando la situación lo requiera. De todos modos, el 99% de los navegadores están configurados para permitir la creación de cookies.</p>
<p>Para la creación de una cookie desde PHP debemos llamar a la función setcookie.</p>
<p>Los parámetros de esta función son:</p>
<p>
setcookie( &lt;nombre de la cookie&gt;, &lt;valor de la cookie&gt;, &lt;fecha de expiración&gt;, &lt;carpeta del servidor&gt;)
</p>
<p>Con un problema sencillo entenderemos el uso de esta función. Supongamos que queremos que los usuarios que entran a nuestro sitio puedan configurar con qué color de fondo de página quiere que aparezca cada vez que ingresa al sitio. Al color seleccionado por el visitante lo almacenaremos en una cookie. En caso que no exista el color, por defecto es blanco.</p>

<p>La primera página mostrará un formulario con tres controles de tipo radio para la selección del color. También esta página verificará si existe la cookie creada, en caso afirmativo fijará el fondo de la página con el valor de la cookie. Tengamos en cuenta que la primera vez que ejecutemos este programa la página es de color blanco, luego variará según el color seleccionado en el formulario.</p>
<p>El código de la primera página es:</p>
<p class="titulopagina">pagina1.php</p>
<pre class="recuadroborde">&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body &lt;?php if (isset(\$_COOKIE['color'])) echo " style=\"background:\$_COOKIE[color]\"" ?&gt;&gt;
  &lt;form action="pagina2.php" method="post"&gt;
    Seleccione de que color desea que sea la página de ahora en más:&lt;br&gt;
    &lt;input type="radio" value="rojo" name="radio"&gt;Rojo&lt;br&gt;
    &lt;input type="radio" value="verde" name="radio"&gt;Verde&lt;br&gt;
    &lt;input type="radio" value="azul" name="radio"&gt;Azul&lt;br&gt;
    &lt;input type="submit" value="Crear cookie"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>El formulario no varía en nada respecto a otros vistos. Lo más importante es el bloque PHP que verifica si ya existe la cookie en el navegador del cliente. Es importante entender que la primera vez que ejecutemos esta página la cookie no existe, por lo que el if se verifica falso:</p>
<pre>&lt;body &lt;?php if (isset(\$_COOKIE['color'])) echo " style=\"background:\$_COOKIE[color]\"" ?&gt;&gt;
</pre>
<p>El vector asociativo \$_COOKIE almacena todas las cookies creadas por el visitante. Si es la primera vez que peticionamos esta página, el vector \$_COOKIE no tendrá elementos.</p>
<p>Es decir que la marca body no tiene inicializada la propiedad style.</p>

<p>La segunda página es la que crea la cookie propiamente dicha:</p>
<pre class="recuadroborde">&lt;?php
if (\$_REQUEST['radio'] == "rojo")
  setcookie("color", "#ff0000", time() + 60 * 60 * 24 * 365, "/");
elseif (\$_REQUEST['radio'] == "verde")
  setcookie("color", "#00ff00", time() + 60 * 60 * 24 * 365, "/");
elseif (\$_REQUEST['radio'] == "azul")
  setcookie("color", "#0000ff", time() + 60 * 60 * 24 * 365, "/");
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  Se creó la cookie.
  &lt;br&gt;
  &lt;a href="pagina1.php"&gt;Ir a la otra página&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>La llamada a la función setcookie debe hacerse antes de imprimir cualquier etiqueta HTML, de lo contrario no funcionará.</p>
<p>Como podemos observar, la creación de la cookie se hace llamando a la función setcookie:</p>
<pre>&lt;?php
if (\$_REQUEST['radio'] == "rojo")
  setcookie("color", "#ff0000", time() + 60 * 60 * 24 * 365, "/");
elseif (\$_REQUEST['radio'] == "verde")
  setcookie("color", "#00ff00", time() + 60 * 60 * 24 * 365, "/");
elseif (\$_REQUEST['radio'] == "azul")
  setcookie("color", "#0000ff", time() + 60 * 60 * 24 * 365, "/");
?&gt;
</pre>
<p>El nombre de la cookie se llama "color" y el valor que almacenamos depende de que control de tipo radio esté seleccionado en la página anterior. La fecha de expiración de la cookie la calculamos fácilmente llamando a la función time() que nos retorna la fecha actual en segundos y le sumamos el producto 60*60*24*365 (60 segundos * 60 minutos * 24 horas * 365 días) es decir que la cookie existirá en la máquina del visitante hasta el año próximo.</p>
<p>Cuando indicamos como directorio la sintaxis "/" significa que la cookie se crea a nivel del sitio y con cuaquier petición a dicho sitio, el navegador enviará la cookie al servidor.</p>
<p>Por último dispusimos en esta página un hipervínculo a la página anterior, para ver que, de ahora en más, cada vez que ejecutemos la pagina1.php, el color de fondo de la misma dependerá del valor de la cookie registrada.</p>

<br>
<br>

<h2>Problema resuelto.</h2>
<p>Copiar el contenido de este cuadro de texto al VS Code y almacenarlo en la carpeta c:/xampp/htdocs con un nombre con extensión php.<br>
  luego abrir el navegador (Chrome, FireFox, IExplorer etc.) y en la barra de direcciones tipear:<br> http://localhost/pagina1.php (o el nombre del
archivo que le dió)  </p>

    pagina1.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body &lt;?php if (isset(\$_COOKIE['color'])) echo " style=\"background:\$_COOKIE[color]\"" ?&gt;&gt;
  &lt;form action="pagina2.php" method="post"&gt;
    Seleccione de que color desea que sea la página de ahora en más:&lt;br&gt;
    &lt;input type="radio" value="rojo" name="radio"&gt;Rojo&lt;br&gt;
    &lt;input type="radio" value="verde" name="radio"&gt;Verde&lt;br&gt;
    &lt;input type="radio" value="azul" name="radio"&gt;Azul&lt;br&gt;
    &lt;input type="submit" value="Crear cookie"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
    <br>
	 <a href="https://www.scratchya.com.ar/problemas/phpya/resu/55/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
<!--    <a href="http://localhost:8080/problemas/phpya/resu/55/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->

    <br>
<table width="650px">
<tbody><tr>
<td align="left">	

</td>
</tr>
</tbody></table>

	
    <br>pagina2.php<br><pre>&lt;?php
if (\$_REQUEST['radio'] == "rojo")
  setcookie("color", "#ff0000", time() + 60 * 60 * 24 * 365, "/");
elseif (\$_REQUEST['radio'] == "verde")
  setcookie("color", "#00ff00", time() + 60 * 60 * 24 * 365, "/");
elseif (\$_REQUEST['radio'] == "azul")
  setcookie("color", "#0000ff", time() + 60 * 60 * 24 * 365, "/");
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  Se creó la cookie.
  &lt;br&gt;
  &lt;a href="pagina1.php"&gt;Ir a la otra página&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre><br>
</form>






	

<h2>Problema propuesto.</h2>
<p>Crear un formulario que solicite la carga del nombre de usuario. Cuando se presione un botón crear una cookie para dicho usuario. Luego cada vez que ingrese al formulario mostrar el último nombre de usuario ingresado.</p>

<p>Solución</p>

pagina1.php<br>
<pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Formulario de entrada del dato&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;

  &lt;form method="post" action="pagina2.php"&gt;
    Ingrese su nombre:
    &lt;input type="text" name="nombre" value="&lt;?php if (isset(\$_COOKIE['usuario'])) echo \$_COOKIE['usuario'] ?&gt;"&gt;
    &lt;br&gt;
    &lt;input type="submit" value="confirmar"&gt;
  &lt;/form&gt;

&lt;/body&gt;

&lt;/html&gt;</pre>
 <br>
<!-- <a href="http://localhost:8080/problemas/phpya/propu/55/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->


  <a href="https://www.scratchya.com.ar/problemas/phpya/propu/55/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
	<br>	
pagina2.php<br><pre>&lt;?php
setcookie("usuario", \$_REQUEST['nombre'], time() + 60 * 60 * 24 * 365, "/");
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;

  Se creó la cookie.
  &lt;br&gt;
  &lt;a href="pagina1.php"&gt;Ir a la otra página&lt;/a&gt;

&lt;/body&gt;

&lt;/html&gt;</pre>
</div>

</form>



  

<br>
<div>
<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_2_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_3_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_3_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>


<form name="form1" method="post" action="">
  <div>
   <h2><a href="../index.php?inicio=30">Retornar</p></h2>   
  </div>

  
</form>





</div>





























<div>
<h2>35 - Borrado de una cookie</h2>
<div style="display:block;float:left;margin: 5px;"> 
 <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable1 -->
<ins class="adsbygoogle uno" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="4716538363" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_1_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_1_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=4716538363&amp;adk=3130936298&amp;adf=1795251393&amp;w=336&amp;lmt=1599684457&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D35%26cod%3D56%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;dt=1599684457726&amp;bpp=16&amp;bdt=221&amp;idt=90&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=4681193498143&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684458&amp;ga_hid=568886987&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=236&amp;ady=85&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=21066124%2C21067034%2C21066532&amp;oid=3&amp;pvsid=916034771186286&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=%7C%7CleE%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=LppOr1pAmq&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=100" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="COW5-f743OsCFZjL7QodnysPDA" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
</div> 


<p>Para borrar una cookie se debe llamar a la función setcookie con una fecha anterior a la actual.</p>
<p>También tengamos en cuenta que una cookie tiene una fecha de expiración por lo que si un visitante reingresa a nuestro sitio y la cookie expiró el navegador no la enviará.</p>
<p>Haremos un algoritmo muy común a muchos sitios que administran webmail. Recordaremos en una cookie el mail ingresado por el operador, el código fuente de la primera página es la siguiente:</p>
<p class="titulopagina">pagina1.php</p>
<pre class="recuadroborde">&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post"&gt;
    Ingrese su mail:
    &lt;input type="text" name="mailusuario" value="&lt;?php if (isset(\$_COOKIE['mail'])) echo \$_COOKIE['mail']; ?&gt;"&gt;
    &lt;br&gt;
    &lt;input type="radio" name="opcion" value="recordar"&gt;
    Recordar en esta computadora el mail ingresado.
    &lt;br&gt;
    &lt;input type="radio" name="opcion" value="norecordar"&gt;
    No recordar.
    &lt;br&gt;
    &lt;input type="submit" value="confirmar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>Es decir, disponemos un control text y como valor de la misma verificamos si el cliente tiene ya una cookie guardada en su máquina, en caso afirmativo la mostramos dentro del text modificando la propiedad value.</p>
<p>Mediante dos controles de tipo radio daremos la posibilidad al cliente que el navegador recuerde o no el mail ingresado.</p>
<p>Como es sabido, la primera vez que accedamos a la página no existe la cookie llamada mail.</p>

<p>La segunda página:</p>
<pre class="recuadroborde">&lt;?php
if (\$_REQUEST['opcion'] == "recordar")
  setcookie("mail", \$_REQUEST['mailusuario'], time() + (60 * 60 * 24 * 365), "/");
elseif (\$_REQUEST['opcion'] == "norecordar")
  setcookie("mail", "", time() - 1000, "/");
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  if (\$_REQUEST['opcion'] == "recordar")
    echo "cookie creada";
  elseif (\$_REQUEST['opcion'] == "norecordar")
    echo "cookie eliminada";
  ?&gt;
  &lt;br&gt;
  &lt;a href="pagina1.php"&gt;Ir a la otra página&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>En esta página verificamos cuál control radio está seleccionado, si es el primero, creamos la cookie mail con una vida de 1 año:</p>
<pre>  setcookie("mail",\$_REQUEST['mailusuario'],time()+(60*60*24*365),"/");
</pre>
<p>En caso que esté seleccionado el segundo radio, creamos la misma cookie pero con una fecha de caducidad inferior a la actual (con esto estamos virtualmente eliminando la cookie):</p>
<pre>  setcookie("mail","",time()-1000,"/");
</pre>

<br>
<br>

<h2>Problema resuelto.</h2>
<p>Copiar el contenido de este cuadro de texto al VS Code y almacenarlo en la carpeta c:/xampp/htdocs con un nombre con extensión php.<br>
  luego abrir el navegador (Chrome, FireFox, IExplorer etc.) y en la barra de direcciones tipear:<br> http://localhost/pagina1.php (o el nombre del
archivo que le dió)  </p>

    pagina1.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post"&gt;
    Ingrese su mail:
    &lt;input type="text" name="mailusuario" value="&lt;?php if (isset(\$_COOKIE['mail'])) echo \$_COOKIE['mail']; ?&gt;"&gt;
    &lt;br&gt;
    &lt;input type="radio" name="opcion" value="recordar"&gt;
    Recordar en esta computadora el mail ingresado.
    &lt;br&gt;
    &lt;input type="radio" name="opcion" value="norecordar"&gt;
    No recordar.
    &lt;br&gt;
    &lt;input type="submit" value="confirmar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
    <br>
	 <a href="https://www.scratchya.com.ar/problemas/phpya/resu/56/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
<!--    <a href="http://localhost:8080/problemas/phpya/resu/56/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->

    <br>
<table width="650px">
<tbody><tr>
<td align="left">	

</td>
</tr>
</tbody></table>

	
    <br>pagina2.php<br><pre>&lt;?php
if (\$_REQUEST['opcion'] == "recordar")
  setcookie("mail", \$_REQUEST['mailusuario'], time() + (60 * 60 * 24 * 365), "/");
elseif (\$_REQUEST['opcion'] == "norecordar")
  setcookie("mail", "", time() - 1000, "/");
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  if (\$_REQUEST['opcion'] == "recordar")
    echo "cookie creada";
  elseif (\$_REQUEST['opcion'] == "norecordar")
    echo "cookie eliminada";
  ?&gt;
  &lt;br&gt;
  &lt;a href="pagina1.php"&gt;Ir a la otra página&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre><br>
</form>






	

<h2>Problema propuesto.</h2>
<p>Confeccionar una página que simule ser la de un periódico. La misma debe permitir configurar qué tipo de titular deseamos que aparezca al visitarla, pudiendo ser:</p>
<pre>Noticia política, Noticia económica o Noticia deportiva.
</pre>
<p>Mediante tres objetos de tipo radio, permitir seleccionar qué titular debe mostrar el periódico. Almacenar en una cookie el tipo de titular que desea ver el cliente. La primera vez que visita el sitio deben aparecer los tres titulares.</p>
<p>Disponer un hipervínculo a una tercer página que borre la cookie creada.</p>

<p>Solución</p>

pagina1.php<br>
<pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;

  &lt;?php
  if (isset(\$_COOKIE['noticias']))
    echo \$_COOKIE['noticias'] . "&lt;br&gt;";
  else {
    ?&gt;
    &lt;form method="post" action="pagina2.php"&gt;
      Configuracion del titular del sitio:&lt;br&gt;
      &lt;input type="radio" name="radio1" value="Noticias Politicas"&gt;Noticias Políticas.&lt;br&gt;
      &lt;input type="radio" name="radio1" value="Noticias Economicas"&gt;Noticias Económicas.&lt;br&gt;
      &lt;input type="radio" name="radio1" value="Noticias Deportivas"&gt;Noticias Deportivas.&lt;br&gt;
      &lt;input type="submit" value="Confirmar"&gt;
    &lt;/form&gt;
  &lt;?php
  }
  ?&gt;
  &lt;a href="pagina3.php"&gt;Borrar cookies&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
 <br>
<!-- <a href="http://localhost:8080/problemas/phpya/propu/56/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->


  <a href="https://www.scratchya.com.ar/problemas/phpya/propu/56/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
	<br>	
pagina2.php<br><pre>&lt;?php
setcookie("noticias", \$_REQUEST['radio1'], time() + (60 * 60 * 24 * 365), "/");
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;h2&gt;Se configuró correctamente&lt;/h2&gt;
  &lt;a href="pagina1.php"&gt;Ir a la otra página&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre><br>pagina3.php<br><pre class="programafuente" name="programa3" rows="15" cols="110" wrap="off" readonly="">&lt;?php
setcookie("noticias", "", time() - 100, "/");
?&gt;
&lt;html&gt;

&lt;head&gt;
    &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;h2&gt;Se borró correctamente&lt;/h2&gt;
    &lt;a href="pagina1.php"&gt;Ir a la otra página&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
</div>

</form>



  

<br>
<div>
<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_2_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_2" name="aswift_2" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=3215562993&amp;w=336&amp;lmt=1599684457&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D35%26cod%3D56%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;dt=1599684457742&amp;bpp=1&amp;bdt=237&amp;idt=93&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280&amp;nras=1&amp;correlator=4681193498143&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684458&amp;ga_hid=568886987&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=231&amp;ady=2744&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=21066124%2C21067034%2C21066532&amp;oid=3&amp;pvsid=916034771186286&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;xpc=Ljm1wETOz7&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=98" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!2" data-google-query-id="CJq0-v743OsCFaSL7Qod-JwN-g" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_3_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_3_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_3" name="aswift_3" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=1656673016&amp;w=336&amp;lmt=1599684457&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D35%26cod%3D56%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;dt=1599684457744&amp;bpp=1&amp;bdt=239&amp;idt=106&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280%2C336x280&amp;nras=1&amp;correlator=4681193498143&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684458&amp;ga_hid=568886987&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=572&amp;ady=2744&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=21066124%2C21067034%2C21066532&amp;oid=3&amp;pvsid=916034771186286&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;ifi=3&amp;uci=a!3&amp;btvi=2&amp;fsb=1&amp;xpc=cq3Vdj918n&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=111" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!3" data-google-query-id="CL_U-_743OsCFdXU7QodjOQGjQ" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>


<form name="form1" method="post" action="">
  <div>
   <h2><a href="../index.php?inicio=30">Retornar</p></h2>   
  </div>

  
</form>





</div>










































<div>
<h2>36 - Cookie de sesión</h2>
<div style="display:block;float:left;margin: 5px;"> 
 <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable1 -->
<ins class="adsbygoogle uno" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="4716538363" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_1_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_1_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=4716538363&amp;adk=3130936298&amp;adf=1795251393&amp;w=336&amp;lmt=1599684505&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D36%26cod%3D57%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;dt=1599684505091&amp;bpp=114&amp;bdt=50&amp;idt=262&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=7896737328630&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684505&amp;ga_hid=915208530&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=236&amp;ady=85&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=44726948%2C21066124%2C21066358&amp;oid=3&amp;pvsid=264150329580425&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C0%2C0%2C1456%2C740&amp;vis=2&amp;rsz=%7C%7CleEr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=rIz1fplUX1&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=268" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CKrqzpX53OsCFRFkFQgdT6QLLQ" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
</div> 


<p>Para crear una cookie que sólo tenga existencia mientras no cerremos la ventana del navegador, pasaremos como fecha de expiración de la cookie, el valor cero.</p>
<p>Una vez que la instancia del navegador se cierra, dicha cookie desaparecerá.</p>
<p>Este tipo de cookie puede ser muy útil para validar un usuario en un conjunto de páginas, si previamente ingresó correctamente su nombre de usuario y clave. Es decir, una vez validado el usuario, se verifica en páginas sucesivas si existe la cookie. Una vez que el usuario cierra el navegador, no hay posibilidad de solicitar las páginas recorridas sin previa validación nuevamente de clave y usuario.</p>
<p>Entonces la sintaxis es:</p>
<p>
setcookie(&lt;nombre de la cookie&gt;,&lt;valor&gt;,0)
</p>
<p>Veamos un pequeño ejemplo para crear y verificar si existe una cookie de sesión.</p>
<p>La primera página es:</p>
<p class="titulopagina">pagina1.php</p>
<pre class="recuadroborde">&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  if (isset(\$_COOKIE['usu']))
    echo "Cookie de sesión creada. Su valor es \$_COOKIE[usu]";
  else
    echo "No existe cookie de sesión";
  ?&gt;
  &lt;br&gt;
  &lt;a href="pagina2.php"&gt;Crear cookie de sesión&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>

<p>La segunda página es la que crea la cookie de sesión:</p>
<p class="titulopagina">pagina2.php</p>
<pre class="recuadroborde">&lt;?php
setcookie("usu", "diego", 0);
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  Cookie de sesión creada.&lt;br&gt;
  &lt;a href="pagina1.php"&gt;Retornar a la página anterior.&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>Si ejecutamos este programa y creamos la cookie de sesión, la misma existirá mientras no cerremos el navegador. Probemos luego cerrando completamente el navegador y veremos que contiene la cookie de sesión.</p>
<br>
<br>

<h2>Problema resuelto.</h2>
<p>Copiar el contenido de este cuadro de texto al VS Code y almacenarlo en la carpeta c:/xampp/htdocs con un nombre con extensión php.<br>
  luego abrir el navegador (Chrome, FireFox, IExplorer etc.) y en la barra de direcciones tipear:<br> http://localhost/pagina1.php (o el nombre del
archivo que le dió)  </p>

    pagina1.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  if (isset(\$_COOKIE['usu']))
    echo "Cookie de sesión creada. Su valor es \$_COOKIE[usu]";
  else
    echo "No existe cookie de sesión";
  ?&gt;
  &lt;br&gt;
  &lt;a href="pagina2.php"&gt;Crear cookie de sesión&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
    <br>
	 <a href="https://www.scratchya.com.ar/problemas/phpya/resu/57/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
<!--    <a href="http://localhost:8080/problemas/phpya/resu/57/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->

    <br>
<table width="650px">
<tbody><tr>
<td align="left">	

</td>
</tr>
</tbody></table>

	
    <br>pagina2.php<br><pre>&lt;?php
setcookie("usu", "diego", 0);
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  Cookie de sesión creada.&lt;br&gt;
  &lt;a href="pagina1.php"&gt;Retornar a la página anterior.&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre><br>
</form>






  

<br>
<div>
<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_2_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_2" name="aswift_2" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=3215562993&amp;w=336&amp;lmt=1599684505&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D36%26cod%3D57%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;adsid=ChEI8Prh-gUQ2MmR8LDLp_fIARJMAINxD-wG7Dzekes4XpQ9NP-2yTx5NTJCAdxIw9UpIQeZ-GdBDTJ-MHGnjgsZFiWUvDYXprYbGQoY21moe4SrepE7J40q9TNC3h9TEA&amp;dt=1599684505205&amp;bpp=2&amp;bdt=164&amp;idt=170&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280&amp;nras=1&amp;correlator=7896737328630&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684505&amp;ga_hid=915208530&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=231&amp;ady=2111&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=44726948%2C21066124%2C21066358&amp;oid=3&amp;pvsid=264150329580425&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C0%2C0%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;jar=2020-09-09-20&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;xpc=akEUPHsRz8&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=317" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!2" data-google-query-id="CLX62JX53OsCFXVmFQgd34ABAA" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_3_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_3_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_3" name="aswift_3" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=1656673016&amp;w=336&amp;lmt=1599684505&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D36%26cod%3D57%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;adsid=ChEI8Prh-gUQ2MmR8LDLp_fIARJMAINxD-wG7Dzekes4XpQ9NP-2yTx5NTJCAdxIw9UpIQeZ-GdBDTJ-MHGnjgsZFiWUvDYXprYbGQoY21moe4SrepE7J40q9TNC3h9TEA&amp;dt=1599684505207&amp;bpp=1&amp;bdt=166&amp;idt=329&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280%2C336x280&amp;nras=1&amp;correlator=7896737328630&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684505&amp;ga_hid=915208530&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=572&amp;ady=2111&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=44726948%2C21066124%2C21066358&amp;oid=3&amp;pvsid=264150329580425&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C0%2C0%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;jar=2020-09-09-20&amp;ifi=3&amp;uci=a!3&amp;btvi=2&amp;fsb=1&amp;xpc=tUM7X42CR2&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=335" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!3" data-google-query-id="CKjb2pX53OsCFWRlFQgdLyoKQQ" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>


<form name="form1" method="post" action="">
  <div>
   <h2><a href="../index.php?inicio=30">Retornar</p></h2>   
  </div>

  
</form>





</div>










































<div>
<h2>37 - Variables de sesión (\$_SESSION)</h2>
<div style="display:block;float:left;margin: 5px;"> 
 <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable1 -->
<ins class="adsbygoogle uno" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="4716538363" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_1_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_1_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=4716538363&amp;adk=3130936298&amp;adf=1795251393&amp;w=336&amp;lmt=1599684557&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D37%26cod%3D58%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;adsid=ChEI8Prh-gUQ2MmR8LDLp_fIARJMAINxD-y5XjkwdxKnIeWxPULPnSB-r_P35GGj3BrVN_SNfA5R6qGlIRboKIjZIR2JympAytfFxnO-Js0A7KZ6xEo0MWeRKGKCx39fSQ&amp;dt=1599684556627&amp;bpp=138&amp;bdt=58&amp;idt=516&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=7630592547954&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684557&amp;ga_hid=914125866&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=236&amp;ady=85&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530622%2C21066124%2C21066429%2C21066468%2C21066647&amp;oid=3&amp;pvsid=1668703075000932&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C0%2C0%2C1456%2C740&amp;vis=1&amp;rsz=%7C%7CleE%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;jar=2020-09-09-20&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=wIpS8DuEPB&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=522" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CIzap6753OsCFaZmFQgdOLMFDQ" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
</div> 


<p>Es otro método para hacer que variables estén disponibles en múltiples páginas sin tener que pasarlas como parámetro. A diferencia de las cookies, las variables de sesión se almacenan en el servidor y tienen un tiempo limitado de existencia.</p>
<p>Para identificar al usuario que generó las variables de sesión, el servidor genera una clave única que es enviada al navegador y almacenada en una cookie. Luego, cada vez que el navegador solicita otra página al mismo sitio, envía esta cookie (clave única) con la cual el servidor identifica de qué navegador proviene la petición y puede rescatar de un archivo de texto las variables de sesión que se han creado. Cuando han pasado 20 minutos sin peticiones por parte de un cliente (navegador) las variables de sesión son eliminadas automáticamente (se puede configurar el entorno de PHP para variar este tiempo)</p>

<p>Una variable de sesión es más segura que una cookie ya que se almacena en el servidor. Otra ventaja es que no tiene que estar enviándose continuamente como sucede con las cookies. Otra ventaja de emplear una variable de sesión en lugar de una cookie es que cuando el navegador del cliente está configurado para desactivar las cookies las variables de sesión, tienen forma de funcionar (enviando la clave como parámetro en cada hipervínculo)</p>
<p>Como desventaja podemos decir que ocupa espacio en el servidor.</p>

<p>Haremos un problema muy sencillo, cargaremos en un formulario el nombre de usuario y clave de un cliente, en la segunda página crearemos dos variables de sesión y en una tercera página recuperaremos los valores almacenados en las variables de sesión.</p>
<p>La primera página es un formulario HTML puro:</p>
<p class="titulopagina">pagina1.html</p>
<pre class="recuadroborde">&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post"&gt;
    Ingrese nombre de usuario:
    &lt;input type="text" name="campousuario"&gt;&lt;br&gt;
    Ingrese clave:
    &lt;input type="password" name="campoclave"&gt;&lt;br&gt;
    &lt;input type="submit" value="confirmar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>Lo que podemos recalcar es que, cuando en un cuadro de texto queremos ingresar una clave y no queremos que aparezcan los caracteres tipeados en pantalla, debemos utilizar el control de tipo password:</p>
<pre>    &lt;input type="password" name="campoclave"&gt;&lt;br&gt;
</pre>
<br>
<p>La segunda página es donde creamos e inicializamos las dos variables de sesión:</p>
<p class="titulopagina">pagina2.php</p>
<pre class="recuadroborde">&lt;?php
session_start();
\$_SESSION['usuario'] = \$_REQUEST['campousuario'];
\$_SESSION['clave'] = \$_REQUEST['campoclave'];
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  Se almacenaron dos variables de sesión.&lt;br&gt;&lt;br&gt;
  &lt;a href="pagina3.php"&gt;Ir a la tercer página donde se recuperarán
    las variables de sesión&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>Cuando creamos o accedemos al contenido de variables de sesión debemos llamar a la función session_start() antes de cualquier salida de etiquetas HTML.</p>
<p>Para almacenar los valores en las variables de sesión lo hacemos:</p>
<pre>\$_SESSION['usuario']=\$_REQUEST['campousuario'];
\$_SESSION['clave']=\$_REQUEST['campoclave'];
</pre>
<p>Es decir, tenemos el vector asociativo \$_SESSION que almacena las variables de sesión.</p>
<p>Por último, esta página tiene un hipervínculo a la tercera página.</p>

<p>La última página de este ejemplo tiene por objetivo acceder a las variables de sesión:</p>
<p class="titulopagina">pagina3.php</p>
<pre class="recuadroborde">&lt;?php
session_start();
?&gt;
&lt;html&gt;

&lt;head&gt;
    &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;?php
    echo "Nombre de usuario recuperado de la variable de sesión:" . \$_SESSION['usuario'];
    echo "&lt;br&gt;&lt;br&gt;";
    echo "La clave recuperada de la variable de sesión:" . \$_SESSION['clave'];
    ?&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>
<p>De nuevo vemos que la primera línea de esta página es la llamada a la función session_start() que, entre otras cosas, rescata de un archivo de texto las variables de sesión creadas para ese usuario (recordemos que desde el navegador todas las veces retorna una cookie con la clave que generó PHP la primera vez que llamamos a una página del sitio).</p>
<p>Para mostrar las variables de sesión, las accedemos por medio del vector asociativo \$_SESSION:</p>
<pre>    echo "Nombre de usuario recuperado de la variable de sesión:" . \$_SESSION['usuario'];
    echo "&lt;br&gt;&lt;br&gt;";
    echo "La clave recuperada de la variable de sesión:" . \$_SESSION['clave'];
</pre>
<p>Tengamos en cuenta que en cualquier otra página del sitio tenemos acceso a las variables de sesión sólo con llamar inicialmente a la función session_start().</p>

<br>
<br>

<h2>Problema resuelto.</h2>
<p>Copiar el contenido de este cuadro de texto al VS Code y almacenarlo en la carpeta c:/xampp/htdocs con un nombre con extensión php.<br>
  luego abrir el navegador (Chrome, FireFox, IExplorer etc.) y en la barra de direcciones tipear:<br> http://localhost/pagina1.php (o el nombre del
archivo que le dió)  </p>

    pagina1.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post"&gt;
    Ingrese nombre de usuario:
    &lt;input type="text" name="campousuario"&gt;&lt;br&gt;
    Ingrese clave:
    &lt;input type="password" name="campoclave"&gt;&lt;br&gt;
    &lt;input type="submit" value="confirmar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
    <br>
	 <a href="https://www.scratchya.com.ar/problemas/phpya/resu/58/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
<!--    <a href="http://localhost:8080/problemas/phpya/resu/58/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->

    <br>
<table width="650px">
<tbody><tr>
<td align="left">	

</td>
</tr>
</tbody></table>

	
    <br>pagina2.php<br><pre>&lt;?php
session_start();
\$_SESSION['usuario'] = \$_REQUEST['campousuario'];
\$_SESSION['clave'] = \$_REQUEST['campoclave'];
?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  Se almacenaron dos variables de sesión.&lt;br&gt;&lt;br&gt;
  &lt;a href="pagina3.php"&gt;Ir a la tercer página donde se recuperarán
    las variables de sesión&lt;/a&gt;
&lt;/body&gt;

&lt;/html&gt;</pre><br><br>pagina3.php<br><pre class="programafuente" name="programa3" rows="15" cols="110" wrap="off" readonly="">&lt;?php
session_start();
?&gt;
&lt;html&gt;

&lt;head&gt;
    &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;?php
    echo "Nombre de usuario recuperado de la variable de sesión:" . \$_SESSION['usuario'];
    echo "&lt;br&gt;&lt;br&gt;";
    echo "La clave recuperada de la variable de sesión:" . \$_SESSION['clave'];
    ?&gt;
&lt;/body&gt;

&lt;/html&gt;</pre><br>
</form>






	

<h2>Problema propuesto.</h2>
<p>Confeccionar un formulario que solicite ingresar el mail de un alumno. Si el mail existe en la tabla alumnos, rescatar su nombre y almacenarlo en una variable de sesión. Además disponer un hipervínculo a una tercera página que verifique si existe la variable de sesión y de la bienvenida al alumno, en caso contrario mostrar un mensaje indicando que no puede visitar esta página (para saber si una variable de sesión está definida llamamos a la función isset)</p>
<pre>if (isset(\$_SESSION['nombre'])) 
   ....
</pre>

<p>Solución</p>

pagina1.php<br>
<pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;form action="pagina2.php" method="post"&gt;
    Ingrese el mail del alumno a consultar:
    &lt;input type="text" name="mail"&gt;
    &lt;br&gt;
    &lt;input type="submit" value="buscar"&gt;
  &lt;/form&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
 <br>
<!-- <a href="http://localhost:8080/problemas/phpya/propu/58/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->


  <a href="https://www.scratchya.com.ar/problemas/phpya/propu/58/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
	<br>	
pagina2.php<br><pre>&lt;?php
session_start();
\$conexion = mysqli_connect("localhost", "root", "", "base1") or
  die("Problemas con la conexión");

\$registros = mysqli_query(\$conexion, "select codigo, nombre, codigocurso
                        from alumnos where mail='\$_REQUEST[mail]'") or
  die("Problemas en el select:" . mysqli_error(\$conexion));

if (\$reg = mysqli_fetch_array(\$registros)) {
  \$_SESSION['usuario'] = \$reg['nombre'];
}

?&gt;
&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;a href="pagina3.php"&gt;Ingresar a pagina principal&lt;/a&gt;;
&lt;/body&gt;

&lt;/html&gt;</pre><br>pagina3.php<br><pre class="programafuente" name="programa3" rows="15" cols="110" wrap="off" readonly="">&lt;?php
session_start();
?&gt;
&lt;html&gt;

&lt;head&gt;
    &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;?php
    if (isset(\$_SESSION['usuario'])) {
        echo "Bienvenido " . \$_SESSION['usuario'];
    } else {
        echo "No tiene permitido visitar esta página.";
    }

    ?&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
</div>

</form>



  

<br>
<div>
<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_2_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_3_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_3_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>


<form name="form1" method="post" action="">
  <div>
   <h2><a href="../index.php?inicio=30">Retornar</p></h2>   
  </div>

  
</form>





</div>


























































<div>
<h2>38 - Incluir un archivo externo (require_once)</h2>
<div style="display:block;float:left;margin: 5px;"> 
 <script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable1 -->
<ins class="adsbygoogle uno" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="4716538363" data-adsbygoogle-status="done" data-overlap-observer-io="false"><ins id="aswift_1_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_1_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_1" name="aswift_1" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=4716538363&amp;adk=3130936298&amp;adf=1795251393&amp;w=336&amp;lmt=1599684629&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D38%26cod%3D59%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;adsid=ChEI8Prh-gUQ2MmR8LDLp_fIARJMAINxD-ykv9eUF1IZZHSzxUFB5fJfqfRLNnasoeHh_T1MUXpjLaywHgegshZCRNRTBsckLhHQYerLx5Phh1YBwAVaLo8haFhHbVUDIA&amp;dt=1599684629323&amp;bpp=116&amp;bdt=55&amp;idt=643&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0&amp;nras=1&amp;correlator=1570001850115&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684629&amp;ga_hid=127473067&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=236&amp;ady=85&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530671%2C21067213%2C21066124%2C21066898%2C21066533&amp;oid=3&amp;pvsid=3401245527969295&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C0%2C0%2C1456%2C740&amp;vis=1&amp;rsz=%7C%7CleE%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;jar=2020-09-09-20&amp;ifi=1&amp;uci=a!1&amp;fsb=1&amp;xpc=DspoQ3F2YQ&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=649" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!1" data-google-query-id="CJqqhdH53OsCFTaK7Qod-AcDAg" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script> 
</div> 


<p>Hasta ahora hemos visto que un archivo contiene todo el código (HTML y PHP), pero el lenguaje PHP nos permite crear librerías de funciones o clases que veremos más adelante.</p>
<p>La idea fundamental de las librerías es agrupar funciones comunes a muchas páginas, no tener que tipearlas en cada archivo, lo que supone que cuando haya que hacer cambios en esas funciones las debemos localizar y modificar y dicha modificación afectará a todos los archivos donde se las utiliza.</p>

<p>La implementación de librerías nos permite hacer que un sistema sea más modular y facilita su mantenimiento.</p>
<p>Para probar esta característica del lenguaje, implementaremos dos funciones en la página "pagina2.php" y llamaremos a dichas funciones en la "página1.php"</p>

<p>El código del archivo "pagina1.php" es:</p>
<pre class="recuadroborde">&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  require_once("pagina2.php");
  cabeceraPagina("Titulo principal de la página");
  echo "&lt;br&gt;&lt;br&gt;&lt;center&gt;Este es el cuerpo de la página&lt;br&gt;&lt;br&gt;&lt;/center&gt;";
  piePagina("Pie de la página");
  ?&gt;
&lt;/body&gt;

&lt;/html&gt;
</pre>

<p>Para incluir el contenido de otro archivo, debemos utilizar la sentencia require_once pasando como parámetro el archivo a incluir:</p>
<pre>require_once("pagina2.php");
</pre>
<p>Si el archivo no existe, se mostrará un error y no continuará la ejecución del programa PHP.</p>
<p>El programa continúa llamando a una función que no se encuentra implementada en este archivo sino que está en el archivo "pagina2.php":</p>
<pre>cabeceraPagina("Titulo principal de la página");
</pre>
<p>Luego de mostrar otros textos en la página, llamamos a una segunda función que también está implementada en el archivo pagina2.php:</p>
<pre>piePagina("Pie de la página");
</pre>
<p>Hay que tener en cuenta que en un proyecto real, las funciones que almacena el archivo "pagina2.php" pueden ser incluidas y utilizadas en muchas otras páginas.</p>

<p>El código fuente del archivo "pagina2.php" es:</p>
<pre class="recuadroborde">&lt;?php
function cabeceraPagina(\$tit)
{
  echo "&lt;h1 style=\"width:100%;background:#ffff00;text-aling:center\"&gt;\$tit&lt;/h1&gt;";
}

function piePagina(\$tit)
{
  echo "&lt;p style=\"width:100%;background:#cccccc;text-aling:center\"&gt;\$tit&lt;/p&gt;";
}
?&gt;
</pre>
<p>Normalmente las rutinas se tratan de archivos PHP puros, es decir que contienen sólo funciones y clases y no etiquetas HTML fijas. Es importante el lugar donde llamamos a la sentencia require_once, debe ser siempre antes de la llamada a las funciones que contiene la librería.</p>
<br>
<br>

<h2>Problema resuelto.</h2>
<p>Copiar el contenido de este cuadro de texto al VS Code y almacenarlo en la carpeta c:/xampp/htdocs con un nombre con extensión php.<br>
  luego abrir el navegador (Chrome, FireFox, IExplorer etc.) y en la barra de direcciones tipear:<br> http://localhost/pagina1.php (o el nombre del
archivo que le dió)  </p>

    pagina1.php<br><pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php
  require_once("pagina2.php");
  cabeceraPagina("Titulo principal de la página");
  echo "&lt;br&gt;&lt;br&gt;&lt;center&gt;Este es el cuerpo de la página&lt;br&gt;&lt;br&gt;&lt;/center&gt;";
  piePagina("Pie de la página");
  ?&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
    <br>
	 <a href="https://www.scratchya.com.ar/problemas/phpya/resu/59/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
<!--    <a href="http://localhost:8080/problemas/phpya/resu/59/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->

    <br>
<table width="650px">
<tbody><tr>
<td align="left">	

</td>
</tr>
</tbody></table>

	
    <br>pagina2.php<br><pre>&lt;?php
function cabeceraPagina(\$tit)
{
  echo "&lt;h1 style=\"width:100%;background:#ffff00;text-aling:center\"&gt;\$tit&lt;/h1&gt;";
}

function piePagina(\$tit)
{
  echo "&lt;p style=\"width:100%;background:#cccccc;text-aling:center\"&gt;\$tit&lt;/p&gt;";
}
?&gt;</pre><br>
</form>






	

<h2>Problema propuesto.</h2>
<p>Confeccionar una librería que contenga una función llamada retornarConexion, la misma debe llamar a las funciones mysqli_connect y retornar la variable que generó la función mysqli_connect.</p>
<p>Tener en cuenta que a esta función la deben implementar en el archivo "pagina2.php".<br>
En el archivo "pagina1.php" incluir la librería que contiene la función retornarConexion. Luego imprimir todos los registros de la tabla alumnos.</p>

<p>Solución</p>

pagina1.php<br>
<pre>&lt;html&gt;

&lt;head&gt;
  &lt;title&gt;Problema&lt;/title&gt;
&lt;/head&gt;

&lt;body&gt;
  &lt;?php

  require_once("pagina2.php");
  \$conexion = retornarConexion();

  \$registros = mysqli_query(\$conexion, "select alu.codigo as codigo,
                                               nombre,
	                                       mail,
		                               codigocurso, 
                                               nombrecurso
		                          from alumnos as alu
                                          inner join cursos as cur on cur.codigo=alu.codigocurso") or
    die("Problemas en el select:" . mysqli_error(\$conexion));
  while (\$reg = mysqli_fetch_array(\$registros)) {
    echo "Codigo:" . \$reg['codigo'] . "&lt;br&gt;";
    echo "Nombre:" . \$reg['nombre'] . "&lt;br&gt;";
    echo "Mail:" . \$reg['mail'] . "&lt;br&gt;";
    echo "Curso:" . \$reg['nombrecurso'] . "&lt;br&gt;";
    echo "&lt;hr&gt;";
  }
  mysqli_close(\$conexion);
  ?&gt;
&lt;/body&gt;

&lt;/html&gt;</pre>
 <br>
<!-- <a href="http://localhost:8080/problemas/phpya/propu/59/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p>-->


  <a href="https://www.scratchya.com.ar/problemas/phpya/propu/59/pagina1.php" style="font-style:Arial;font-size:2em;margin-right:15px;" target="_blank">Ejecutar ejemplo</p> 
	<br>	
pagina2.php<br><pre>&lt;?php
function retornarConexion()
{
  \$conexion=mysqli_connect("localhost","root","","base1") or
    die("Problemas con la conexión");  
  return \$conexion;
}
?&gt;</pre>
</div>

</form>



  

<br>
<div>
<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_2_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_2_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_2" name="aswift_2" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=3215562993&amp;w=336&amp;lmt=1599684629&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D38%26cod%3D59%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;adsid=ChEI8Prh-gUQ2MmR8LDLp_fIARJMAINxD-ykv9eUF1IZZHSzxUFB5fJfqfRLNnasoeHh_T1MUXpjLaywHgegshZCRNRTBsckLhHQYerLx5Phh1YBwAVaLo8haFhHbVUDIA&amp;dt=1599684629439&amp;bpp=2&amp;bdt=171&amp;idt=549&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280&amp;nras=1&amp;correlator=1570001850115&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684629&amp;ga_hid=127473067&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=231&amp;ady=2513&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530671%2C21067213%2C21066124%2C21066898%2C21066533&amp;oid=3&amp;pvsid=3401245527969295&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;jar=2020-09-09-20&amp;ifi=2&amp;uci=a!2&amp;btvi=1&amp;fsb=1&amp;xpc=Bmg2QJszvK&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=556" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!2" data-google-query-id="CKXxhdH53OsCFVGF7Qod5H0OQw" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

<!--publi-->
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- adaptable2 -->
<ins class="adsbygoogle dos" style="display: inline-block; width: 336px; height: 280px;" data-ad-client="ca-pub-4669394804436935" data-ad-slot="5774469161" data-adsbygoogle-status="done"><ins id="aswift_3_expand" style="display:inline-table;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><ins id="aswift_3_anchor" style="display:block;border:none;height:280px;margin:0;padding:0;position:relative;visibility:visible;width:336px;background-color:transparent;"><iframe id="aswift_3" name="aswift_3" style="left:0;position:absolute;top:0;border:0;width:336px;height:280px;" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" width="336" height="280" frameborder="0" src="https://googleads.g.doubleclick.net/pagead/ads?client=ca-pub-4669394804436935&amp;output=html&amp;h=280&amp;slotname=5774469161&amp;adk=1622272823&amp;adf=1656673016&amp;w=336&amp;lmt=1599684630&amp;rafmt=12&amp;psa=1&amp;guci=2.2.0.0.2.2.0.0&amp;format=336x280&amp;url=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Ftemarios%2Fdescripcion.php%3Fpunto%3D38%26cod%3D59%26inicio%3D30&amp;flash=0&amp;wgl=1&amp;adsid=ChEI8Prh-gUQ2MmR8LDLp_fIARJMAINxD-ykv9eUF1IZZHSzxUFB5fJfqfRLNnasoeHh_T1MUXpjLaywHgegshZCRNRTBsckLhHQYerLx5Phh1YBwAVaLo8haFhHbVUDIA&amp;dt=1599684629441&amp;bpp=1&amp;bdt=172&amp;idt=564&amp;shv=r20200901&amp;cbv=r20190131&amp;ptt=9&amp;saldr=aa&amp;abxe=1&amp;cookie=ID%3Db734507553157842%3AT%3D1598745703%3AS%3DALNI_MbVFfuIVBiufsOFHEuR4mbvKweCzw&amp;prev_fmts=0x0%2C336x280%2C336x280&amp;nras=1&amp;correlator=1570001850115&amp;frm=20&amp;pv=1&amp;ga_vid=725948043.1598745704&amp;ga_sid=1599684629&amp;ga_hid=127473067&amp;ga_fc=0&amp;iag=0&amp;icsg=559786&amp;dssz=16&amp;mdo=0&amp;mso=0&amp;u_tz=-300&amp;u_his=1&amp;u_java=0&amp;u_h=819&amp;u_w=1456&amp;u_ah=819&amp;u_aw=1456&amp;u_cd=24&amp;u_nplug=3&amp;u_nmime=4&amp;adx=572&amp;ady=2513&amp;biw=1441&amp;bih=740&amp;scr_x=0&amp;scr_y=0&amp;eid=42530671%2C21067213%2C21066124%2C21066898%2C21066533&amp;oid=3&amp;pvsid=3401245527969295&amp;pem=419&amp;ref=https%3A%2F%2Fwww.tutorialesprogramacionya.com%2Fphpya%2Findex.php%3Finicio%3D30&amp;rx=0&amp;eae=0&amp;fc=1920&amp;brdim=0%2C0%2C0%2C0%2C1456%2C0%2C1456%2C819%2C1456%2C740&amp;vis=1&amp;rsz=M%7C%7CeEbr%7C&amp;abl=CS&amp;pfx=0&amp;fu=8448&amp;bc=31&amp;jar=2020-09-09-20&amp;ifi=3&amp;uci=a!3&amp;btvi=2&amp;fsb=1&amp;xpc=5N4WwQvM4u&amp;p=https%3A//www.tutorialesprogramacionya.com&amp;dtd=568" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" data-google-container-id="a!3" data-google-query-id="COvnhtH53OsCFQah7QodTqgLrQ" data-load-complete="true"></iframe></ins></ins></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>


<form name="form1" method="post" action="">
  <div>
   <h2><a href="../index.php?inicio=30">Retornar</p></h2>   
  </div>

  
</form>





</div>
""";
