import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:suudai/screens/machine_learning/classifier_quant.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'Datos.dart';
import '../../screens/machine_learning/classifier.dart';

class Identificar extends StatefulWidget {
  const Identificar({super.key, required this.pathImage});
  final String pathImage;

  @override
  State<StatefulWidget> createState() {
    return IdentificarPagina();
  }
}

class IdentificarPagina extends State<Identificar> {
  late Classifier _classifier;
  var logger = Logger();
  File? _image;
  final picker = ImagePicker();
  late Image _imageWidget;
  img.Image? fox;
  Category? category;
  late Datos _datos;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierQuant();
    loadImage();
  }

  Future<void> loadImage() async {
    await _classifier.loadModel();

    try {
      File archivo = File(widget.pathImage);
      img.Image? imageInput = img.decodeImage(archivo.readAsBytesSync());

      var pred = _classifier.predict(imageInput!);
      setState(() {
        category = pred;
      });
    } catch (exception) {
      debugPrint(exception.toString());
    }
  }

  void _predict() async {
    img.Image? imageInput = img.decodeImage(_image!.readAsBytesSync());
    var pred = _classifier.predict(imageInput!);
    setState(() {
      category = pred;
    });
  }

  Widget imgenAnalizada() {
    if (_image == null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: const Center(
            child: Text(
              "No has seleccionado ninguna Imagen",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      );
    } else {
      String indexString = category!.label.toString().substring(0, 1);
      int index = int.parse(indexString);
      _datos = Datos(index);
      return Container(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      child:
                          Image(image: FileImage(_image!), fit: BoxFit.cover))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 20),
            child: Center(
              child: Text(
                " Probabilidad : ${category != null ? "${(category!.score * 100).toStringAsFixed(2)}%" : "Nulo"}",
                style: const TextStyle(
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
                color: const Color(0xFF6AA83D).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: const Text("Nombre Comun:"),
                subtitle: Text(
                  _datos.obtenerBusqueda("nombreComun"),
                  style: const TextStyle(fontSize: 30),
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
                title: const Text("Nombre Cientifico:"),
                subtitle: Text(
                  _datos.obtenerBusqueda("nombreCientifico"),
                  style: const TextStyle(fontSize: 30),
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
                title: const Text("Familia:"),
                subtitle: Text(
                  _datos.obtenerBusqueda("familia"),
                  style: const TextStyle(fontSize: 30),
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
                title: const Text("Dieta:"),
                subtitle: Text(
                  _datos.obtenerBusqueda("alimentacion"),
                  style: const TextStyle(fontSize: 30),
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
                title: const Text("Depredadores:"),
                subtitle: Text(
                  _datos.obtenerBusqueda("depredadores"),
                  style: const TextStyle(fontSize: 30),
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
                  title: const Text("Descripcion: "),
                  subtitle: Text(
                    _datos.obtenerBusqueda("descripcion"),
                    style: const TextStyle(fontSize: 15),
                  ),
                )),
          ),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF6AA83D),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.search, size: 35, color: Colors.black),
            )
          ],
          centerTitle: true,
          title: const Text("Suudai’ App")),
      body: Container(
        child: Text(category!.label.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6AA83D),
        onPressed: () {
          showAlertDialog(context);
        },
        child: const Icon(Icons.camera),
      ),
    );
  }

  void abrirCamara(BuildContext context) async {
    final picture = await picker.pickImage(source: ImageSource.camera);
    _procesarImagenSeleccionada(picture);
    Navigator.of(context).pop(); // Cierra el diálogo
  }

  void abrirGaleria(BuildContext context) async {
    final picture = await picker.pickImage(source: ImageSource.gallery);
    _procesarImagenSeleccionada(picture);
    Navigator.of(context).pop(); // Cierra el diálogo
  }

  void _procesarImagenSeleccionada(picture) {
    setState(() {
      _image = File(picture!.path);
      _imageWidget = Image.file(_image!);
      _predict();
    });
  }

  void showAlertDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Selecciona "),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    abrirGaleria(context);
                  },
                  child: const Text(
                    "Galeria",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    abrirCamara(context);
                  },
                  child: const Text(
                    "Camara",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cerrar',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
          ],
        );
      },
    );
  }
}
