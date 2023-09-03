import 'package:flutter/material.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/size_config.dart';

class CardList extends StatelessWidget {
  CardList({
    super.key,
    required this.informacion,
  });

  final List<String> informacion;

  List<String> temas = ["Género", "Familia", "Orden", "Clase"];
  List<String> imagenes = [
    "assets/images/three.png",
    "assets/images/literatura.png",
    "assets/images/adn.png",
    "assets/images/three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: temas.length,
      itemBuilder: (context, index) {
        return Container(
          width: SizeConfig.blockSizeHorizontal! * 40,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorBackGroundCard,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1 / 0.3,
                child: Image(
                  image: AssetImage(imagenes[index]),
                ),
              ),
              Text(
                "${temas[index]} :",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blockSizeHorizontal! * 2.5,
                  color: colorGreen,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                informacion[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
