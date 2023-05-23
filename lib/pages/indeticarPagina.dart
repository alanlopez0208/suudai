import 'package:flutter/material.dart';
import 'package:suudai/components/drawer.dart';

class Identificar extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return IdentificarPagina();
  }

}

class IdentificarPagina extends State<Identificar>{

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
      body: Center(child: Column(
        children: <Widget>[
          Image.asset("assets/A13.jpg"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Este es un alacran Uy Pican Muy fuerte"),
          ),
        ],
      )),
    );
  }

}