import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as Imagen;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:suudai/components/drawer.dart';
import 'package:suudai/pages/machine%20learning/classifier.dart';
import 'package:suudai/pages/machine%20learning/classifier_quant.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class Identificar extends StatefulWidget {
  final File imagen;


  Identificar({required this.imagen});

  @override
  State<StatefulWidget> createState() {
    return IdentificarPagina();
  }
}

class IdentificarPagina extends State<Identificar> {
  late Classifier _clasificador;
  Logger logger = Logger();
  final picker = ImagePicker();
  late File imagenArchivo;
  Category? category;

  @override
  void initState() {
    super.initState();
    _clasificador = ClassifierQuant();
    imagenArchivo = widget.imagen;
    _predict();
  }

  void _predict() async {
    Imagen.Image? img = Imagen.decodeImage(widget.imagen.readAsBytesSync());
    if(img != null){
      print("--------->Si hay algo que analizar");
    }
    var pred = _clasificador.predict(img!);

    setState(() {
      this.category = pred;
    });

  }



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
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.file(
                    imagenArchivo,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 20),
              child: Center(
                child: Text(
                  "Animal : ${
                    category != null ? category!.label
                    : "Nulo"
                  } Probabilidad : ${
                      category != null ? category!.score
                          : "Nulo"
                  }",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:  Color(0xFF6AA83D).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text("Nombre Cientifico:"),
                  subtitle: Text(
                    "Lobus Mexicanos",
                    style: TextStyle(fontSize: 30),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text("Familia:"),
                  subtitle: Text(
                    "Durango querido",
                    style: TextStyle(fontSize: 30),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text("Alimentacion"),
                  subtitle: Text(
                      "Carne",
                    style: TextStyle(fontSize: 30),
                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text("Depredadores:"),
                  subtitle: Text(
                    "Ajales",
                    style: TextStyle(fontSize: 30),
                  ),

                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
