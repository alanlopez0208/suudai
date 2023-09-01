import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../modelos/animal.dart';
import '../../../size_config.dart';
import '../presentation/lugar_info.dart';

class CardAnimal extends StatelessWidget{
  const CardAnimal({
    super.key,
    required this.titulo,
    required this.imagen,
  });

  final String titulo,imagen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: SizeConfig.screenwidth!/ 1,
        child: GestureDetector(
          onTap: (){
            List<Animal> otro = [
              interchangeImages(titulo)
            ];
            String regionPath = "assets/images/g/g1.jpg";

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LugarInfo(
                  animales: otro,
                  imgRegion: regionPath,
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children:<Widget> [
                AspectRatio(
                  aspectRatio: 1/0.5,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image(
                      image: AssetImage(imagen),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 5,
                    vertical:  SizeConfig.blockSizeHorizontal! * 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget> [
                      Text(
                        interchangeNames(titulo),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.6,
                        ),
                      )
                    ],
                  ),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  Animal interchangeImages(String titulo){
    if (titulo == "Aves")return gorrion;
    else if (titulo == "Mamiferos")return lobo;
    else if (titulo == "Insectos")return alacran;
    return lobo;
  }

  String interchangeNames(String titulo){
    if (titulo == "Aves")return "Gorrion Serrano";
    else if (titulo == "Mamiferos")return "Lobo Mexicano";
    else if (titulo == "Insectos")return "Alacran";
    return "";
  }
}