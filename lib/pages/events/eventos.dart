import 'package:flutter/material.dart';

import '../../components/drawer.dart';
import '../../main.dart';


class Eventos extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6AA83D),
          title: Text("Eventos"),
          centerTitle: true,
        ),
        drawer: MenuHamburgesa(),
        body: ListView(
          children: [
            Card(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: AssetImage("assets/Event1.jpeg"))
                    ,Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text("Jueves 18 de Mayo",
                              style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal,color: Colors.white),
                            ),
                          ],
                        ),
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute
                              (builder: (context){
                              return Inicio();
                            }));
                          },
                          title: Text("Se confirma la existencia del Jaguar en Yucatan con la ayuda de la IA y Huawei Cloud",
                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,),
                          ),
                        )
                      ],
                    )
                  ]
              ),color: Color(0xFF6AA83D).withOpacity(0.7),borderOnForeground: true,

            ),
            Card(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: AssetImage("assets/Event2.jpeg"))
                    ,Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text("Lunes 22 de Mayo",
                              style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal,color: Colors.white),
                            ),
                          ],
                        ),
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute
                              (builder: (context){
                              return Inicio();
                            }));
                          },
                          title: Text("Celebra el dia Internacional de Diversidad Biologica",
                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,),
                          ),
                        )
                      ],
                    )
                  ]
              ),color: Color(0xFF6AA83D).withOpacity(0.7),borderOnForeground: true,

            ),
            Card(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(image: AssetImage("assets/Event3.jpeg"))
                    ,Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Text("Lunes 22 de Mayo",
                              style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal,color: Colors.white),
                            ),
                          ],
                        ),
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute
                              (builder: (context){
                              return Inicio();
                            }));
                          },
                          title: Text("Recuerda el Dia Mundial del Agua",
                            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,),
                          ),
                        )
                      ],
                    )
                  ]
              ),color: Color(0xFF6AA83D).withOpacity(0.7),borderOnForeground: true,
            ),
          ],
        )

    );
  }

}