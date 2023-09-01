import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/modelos/animal.dart';
import 'package:suudai/size_config.dart';
import 'card_list.dart';
import 'images_container.dart';

class AnimalInfo extends StatefulWidget {
  AnimalInfo({super.key, required this.animal, required this.imgPath});

  final Animal animal;

  final String imgPath;

  @override
  State<AnimalInfo> createState() => _AnimalInfoState();
}

class _AnimalInfoState extends State<AnimalInfo> {
  int currentPage = 0;
  late PageController _pageController;
  Completer<GoogleMapController> _controller = Completer();
  late Animal animal;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.5,
    );

    animal = widget.animal;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SizedBox.fromSize(
                size: Size.fromHeight(SizeConfig.screenhegit! / 3),
                child: SizedBox(
                  height: SizeConfig.screenhegit! / 3,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              File(widget.imgPath),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        ),
                      ),
                      PageView(
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        controller: _pageController,
                        children: List.generate(
                          1,
                          (index) =>
                              pagePhoto(foto: widget.imgPath, index: index),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.screenhegit! / 3.2,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: colorBackGround,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 4,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 5,
                        ),
                        SizedBox(
                          width: SizeConfig.screenwidth,
                          child: Text(
                            animal.nombre,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const InfoSubtitle(
                          titulo: "Imagenes",
                          icono: Icon(Icons.photo_library_outlined),
                        ),
                        SizedBox(
                          height: SizeConfig.screenhegit! / 3,
                          width: SizeConfig.screenhegit,
                          child: ImagesContainer(
                            imagenes: animal.assetsImages,
                          ),
                        ),
                        const InfoSubtitle(
                          titulo: "Clasificación Cinetífica",
                          icono: Icon(Icons.account_tree_outlined),
                        ),
                        SizedBox(
                          height: SizeConfig.screenhegit! / 4.5,
                          child: CardList(
                            informacion: [
                              animal.genero,
                              animal.familia,
                              animal.orden,
                              animal.clase,
                            ],
                          ),
                        ),
                        const InfoSubtitle(
                          titulo: "Características",
                          icono: Icon(Icons.search),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            animal.apariencia,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              height: 1.5,
                            ),
                          ),
                        ),
                        const InfoSubtitle(
                          titulo: "Ubicacion",
                          icono: Icon(Icons.place_rounded),
                        ),
                        SizedBox(
                          width: SizeConfig.screenwidth,
                          height: 200,
                          child: GoogleMap(
                            onMapCreated: (controller) {
                              _controller.complete(controller);
                            },
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(24.390054, -103.314732),
                              zoom: 5.5,
                            ),
                            circles: Set.from(List.generate(
                                animal.ubicaciones.length, (index) {
                              return Circulo(
                                circleId:
                                    CircleId("${animal.ubicaciones.length}"),
                                center: animal.ubicaciones[index],
                              );
                            })),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal! * 5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pagePhoto({required String foto, required int index}) {
    double size;
    if (currentPage == index) {
      size = 1;
    } else {
      size = 0.7;
    }
    return Align(
      alignment: Alignment.center,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
        scale: size,
        child: CircleAvatar(
          radius: SizeConfig.screenwidth! / 5,
          backgroundColor: Colors.white,
          backgroundImage: FileImage(File(foto)),
        ),
      ),
    );
  }
}

class InfoSubtitle extends StatelessWidget {
  const InfoSubtitle({
    super.key,
    required this.titulo,
    required this.icono,
  });

  final String titulo;
  final Icon icono;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.blockSizeHorizontal! * 5,
        ),
        Row(
          children: <Widget>[
            icono,
            const SizedBox(
              width: 10,
            ),
            Text(
              titulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
              ),
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeHorizontal! * 3,
        ),
      ],
    );
  }
}

class Circulo extends Circle {
  Circulo({
    required super.circleId,
    required super.center,
  }) : super(
          radius: 20000,
          fillColor: colorGreenOpacity,
          strokeColor: colorGreen,
          strokeWidth: 2,
        );
}
