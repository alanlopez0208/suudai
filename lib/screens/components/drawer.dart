import 'package:flutter/material.dart';
import 'package:suudai/pages/machine_learnig/indeticarPagina.dart';
import 'package:suudai/screens/home.dart';

class MenuHamburgesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFDFFFC8)),
        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
              child: Image.asset("images/Logo.png", fit: BoxFit.cover),
            ),
            ListTile(
              title: Text("Inicio"),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
            ),
            ListTile(
              title: Text("Identificar"),
              leading: Icon(
                Icons.photo_camera,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Identificar(
                    pathFoto: "",
                  );
                }));
              },
            ),
            ListTile(
              title: Text("Escanear"),
              leading: Icon(
                Icons.qr_code_2,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            ListTile(
              title: Text("Eventos"),
              leading: Icon(
                Icons.map,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
            ),
            ListTile(
              title: Text("Historial"),
              leading: Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Home();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
