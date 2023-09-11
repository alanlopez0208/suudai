import 'package:flutter/material.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/modelos/eventos.dart';
import 'package:suudai/size_config.dart';
import '../../components/card_event.dart';
import '../../machine_learning/camera.dart';
//import 'card_event.dart';
import 'icons_animal.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  List<Map<String, String>> makeIconAnimal = [
    {
      "titulo": "Aves",
      "imagen": "assets/images/pajaro.png",
      "link": "https://www.naturalista.mx/places/11166"
    },
    {
      "titulo": "Mamiferos",
      "imagen": "assets/images/lobo.png",
      "link": "https://www.naturalista.mx/places/11166#taxon=40151",
    },
    {
      "titulo": "Insectos",
      "imagen": "assets/images/escorpion.png",
      "link": "https://www.naturalista.mx/places/11166#taxon=47120",
    },
  ];

  List<Map<String, String>> makeCardDate = [
    {
      "titulo": "Foro Nacional del Medio Ambiente",
      "imagen": "assets/images/evento1.jpg",
      "lugar": "Conagua, Durango, Durango",
      "fecha": "Lunes, 25 de Enero, 2023",
      "hora": "6 PM",
    },
    {
      "titulo": "Mamiferos",
      "imagen": "assets/images/evento1.jpg",
      "lugar": "",
      "fecha": "",
      "hora": "",
    },
    {
      "titulo": "Insectos",
      "imagen": "assets/images/evento1.jpg",
      "lugar": "",
      "fecha": "",
      "hora": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage("assets/images/topImage.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
                      child: Container(
                        padding:
                            EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.blockSizeHorizontal! * 4),
                          color: colorGreen,
                        ),
                        child: Text(
                          "Suudai' App",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Bienvenido",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal! * 10,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeHorizontal! * 3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal! * 3),
                                child: Icon(
                                  Icons.search,
                                  color: colorsIconSecundary,
                                  size: SizeConfig.blockSizeHorizontal! * 4,
                                ),
                              ),
                              hintText: "Barra de busqueda",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("lllollll"),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: List.generate(makeIconAnimal.length, (index) {
                return IconsAnimal(
                  titulo: makeIconAnimal[index]["titulo"]!,
                  imagen: makeIconAnimal[index]["imagen"]!,
                  link: makeIconAnimal[index]["link"]!,
                );
              }),
            ),
            const WidgetTitulo(titulo: "Eventos Cerca de Ti"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  2,
                  (index) {
                    return CardEvent(
                      evento: conferencias.eventos[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetTitulo extends StatelessWidget {
  const WidgetTitulo({
    super.key,
    required this.titulo,
  });

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal! * 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Eventos Cerca de ti ",
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            size: SizeConfig.blockSizeHorizontal! * 6,
          )
        ],
      ),
    );
  }
}
