import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:suudai/components/drawer.dart';
import 'package:suudai/pages/machine%20learning/indeticarPagina.dart';
import 'package:suudai/pages/qr/qr_scanner.dart';
//hello qt_ai
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Poppins",
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(
                fontSize: 45.0,
                color: Colors.white,
              ),
              bodyText2: TextStyle(fontSize: 50.0, color: Colors.black))),
      home: Inicio(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Inicio extends StatelessWidget {
  ImagePicker? picker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF6AA83D),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.search, size: 35, color: Colors.black),
            )
          ],
          centerTitle: true,
          title: Text("Suudai’")),
      drawer: MenuHamburgesa(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            abrirCamara(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                  image: AssetImage("images/A13.jpg"),
                                  width: MediaQuery.of(context).size.width/2,
                                  height: 300,
                                  fit: BoxFit.cover),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.7),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'Identificar',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_a_photo,
                                          size: 35,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            toScanners(context);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                  image: AssetImage("images/ajolote.jpg"),
                                  width: 200,
                                  height: 300,
                                  fit: BoxFit.cover),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.7),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'Escanear',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Icon(
                                          Icons.qr_code_2,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                  image: AssetImage("images/GS3.jpg"),
                                  width: 200,
                                  height: 300,
                                  fit: BoxFit.cover),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.7),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'Eventos',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Icon(Icons.map, size: 35)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                  image: AssetImage("images/LM13.png"),
                                  width: 200,
                                  height: 300,
                                  fit: BoxFit.cover),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.7),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'Historial',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Icon(
                                          Icons.timer,
                                          size: 35,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  void toScanners(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => QRScanner()));
  }

  Future<void> abrirCamara(BuildContext context) async {
    picker = ImagePicker();
    final picture = await picker?.pickImage(source: ImageSource.camera);

    if (picture != null) {
      final imageFile = File(picture.path);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Identificar(imagen: imageFile),
        ),
      );
    } else {
      // Manejar el caso en el que no se seleccionó ninguna imagen
      // o se canceló la selección
      print('No se seleccionó ninguna imagen');
    }
  }
}
