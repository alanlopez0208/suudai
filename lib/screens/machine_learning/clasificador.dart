import 'dart:io';
import 'package:suudai/screens/machine_learning/classifier.dart';
import 'package:suudai/screens/machine_learning/classifier_quant.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as img;

class Clasificador {
  Clasificador(this.imgPath);

  final String imgPath;
  final Classifier _clasificador = ClassifierQuant();
  late Category category;

  Future<Category> loadImage() async {
    await _clasificador.loadModel();

    try {
      File archivo = File(imgPath);
      img.Image? imageInput = img.decodeImage(archivo.readAsBytesSync());

      var pred = _clasificador.predict(imageInput!);

      category = pred;
    } catch (exception) {
      print(exception.toString());
    }

    return category;
  }
}
