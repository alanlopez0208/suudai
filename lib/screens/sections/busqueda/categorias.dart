import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/screens/sections/home/card_animal.dart';

class Categorias extends StatefulWidget{
  const Categorias({
    super.key,
    required this.titulo
  });

  final String titulo;

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
      Column(
        children: [
          AspectRatio(
            aspectRatio: 1/0.01,
            child: Container(color: colorGreen,)
          ),
          SingleChildScrollView(
          child: Column(
            children:<Widget> [
              CardAnimal(titulo: widget.titulo.toString(), imagen: interchangeAssets())
            ],
          ),
        )
        ],
      )
    );
  }



  String interchangeAssets(){
    if (widget.titulo == "Aves")return "assets/images/g/g1.jpg";
    else if (widget.titulo == "Mamiferos")return "assets/images/lobo/l2.jpg";
    else if (widget.titulo == "Insectos")return "assets/images/alacran/a2.jpg";

    return "";
  }
}