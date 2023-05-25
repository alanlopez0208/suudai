
import 'package:flutter/material.dart';

class Tarjeta extends StatelessWidget{
  final String titulo;
  final Icon icono;
  final String assets;


  Tarjeta({required this.titulo, required this.icono, required this.assets});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                  image: AssetImage("images/A13.jpg"),
                  width: MediaQuery.of(context).size.width/2,
                  height: 300,
                  fit: BoxFit.cover),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.7),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Identificar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Icon(
                          Icons.add_a_photo,
                          size: 345,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



}