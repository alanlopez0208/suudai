import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/modelos/animal.dart';
import 'package:suudai/screens/machine_learning/clasificador.dart';
import 'package:suudai/screens/machine_learning/overlay.dart';
import 'package:suudai/screens/sections/presentation/animal_info.dart';
import 'package:suudai/size_config.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder<void>(
              future: initCamera(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: SizeConfig.screenhegit,
                    height: SizeConfig.screenhegit,
                    child: CameraPreview(_controller),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            botonCamera(),
            Positioned(
              top: SizeConfig.screenhegit! / 4,
              child: OverlayCamera(
                ancho: SizeConfig.screenwidth! -
                    (SizeConfig.blockSizeHorizontal! * 10) * 2,
                largo: SizeConfig.screenhegit! / 2,
                padding: SizeConfig.blockSizeHorizontal! * 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botonCamera() {
    return Positioned(
      bottom: SizeConfig.blockSizeVertical! * 5,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorGreen,
            ),
            child: IconButton(
              onPressed: () async {
                String imgPath = await getPath();

                Clasificador clasificador = Clasificador(imgPath);

                Category category = await clasificador.loadImage();

                Animal? animal = animales[int.parse(category.label)];

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AnimalInfo(animal: animal!, imgPath: imgPath),
                  ),
                );
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.veryHigh,
    );
    _initializeControllerFuture = _controller.initialize();

    return _initializeControllerFuture;
  }

  Future<String> getPath() async {
    await _initializeControllerFuture;

    Directory direccion = await getApplicationDocumentsDirectory();

    XFile foto = await _controller.takePicture();

    File fotoGuardar = File(foto.path);
    String nuevaDireccion = "${direccion.path}/${foto.name}";
    fotoGuardar.copySync(nuevaDireccion);

    return nuevaDireccion;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
