import 'package:flutter/material.dart';
import 'package:suudai/pages/qr/qr_scanner.dart';
import '../main.dart';
import '../pages/machine learning/indeticarPagina.dart';

class MenuHamburgesa extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFDFFFC8)
        ),
        child: ListView(
          children: <Widget> [
            Container(
              height: 200,
              child: Image.asset("images/Logo.png", fit: BoxFit.cover),
            ),
            ListTile(
              title: Text("Inicio"),
              leading: Icon(Icons.home,color: Colors.black,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute
                  (builder: (context){
                  return Inicio();
                }));
              },
            ),
            ListTile(
              title: Text("Identificar"),
              leading: Icon(Icons.photo_camera,color: Colors.black,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute
                  (builder: (context){
                  return Identificar();
                }));
              },
            ),
            ListTile(
              title: Text("Escanear"),
              leading: Icon(Icons.qr_code_2,color: Colors.black,),
              onTap: (){
                Navigator.push(context, MaterialPageRoute
                  (builder: (context){
                  return QRScanner();
                }));
              },
            ),
            Container(
              foregroundDecoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.7),width: 28,)),
              child: ListTile(
                title: Text("Eventos",),
                leading: Icon(Icons.calendar_month,color: Colors.black,),
                /*onTap: (){
                Navigator.push(context, MaterialPageRoute
                  (builder: (context){
                  return Inicio();
                }));
              },
               */
              ),
            ),

            Container(
              child: ListTile(
                title: Text("Historial"),
                leading: Icon(Icons.timer,color: Colors.black,),
                /*onTap: (){
                Navigator.push(context, MaterialPageRoute
                  (builder: (context){
                  return Inicio();
                }));
              },
               */
              ),foregroundDecoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.7),width: 28,)),
            ),

          ],
        ),
      ),
    );
  }


}