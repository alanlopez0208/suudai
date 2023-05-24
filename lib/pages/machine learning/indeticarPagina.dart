import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as Imagen;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:suudai/components/drawer.dart';
import 'package:suudai/pages/machine%20learning/classifier.dart';
import 'package:suudai/pages/machine%20learning/classifier_quant.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class Identificar extends StatefulWidget{
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
    var pred = _clasificador.predict(img!);

    setState(() {
      this.category  = pred;
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
        child: Center(child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(imagenArchivo),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Este es un alacran Uy Pican Muy fuerte"),
            ),
            Text(
                category != null ? category!.label:'No se dectecto Ninguna Categoria'
            ),
            SizedBox(
              height: 8,
            ),
            Text(
                category!=null
                    ?'Nivel de confianza:${(category!.score).toStringAsFixed(3)}':'No se dectecto Ninguna Categoria'
            ),
          ],
        )),
      ),
    );
  }
}