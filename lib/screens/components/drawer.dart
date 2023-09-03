import 'package:flutter/material.dart';
import 'package:suudai/no%20sirve%20estos%20archivos/machine_learnig/indeticarPagina.dart';
import 'package:suudai/screens/home.dart';

class MenuHamburgesa extends StatelessWidget {
  const MenuHamburgesa({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Color(0xFFDFFFC8)),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Image.asset("images/Logo.png", fit: BoxFit.cover),
            ),
            ListTile(
              title: const Text("Inicio"),
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
              },
            ),
            ListTile(
              title: const Text("Identificar"),
              leading: const Icon(
                Icons.photo_camera,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Identificar(
                    pathImage: "",
                  );
                }));
              },
            ),
            ListTile(
              title: const Text("Escanear"),
              leading: const Icon(
                Icons.qr_code_2,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Home()));
              },
            ),
            ListTile(
              title: const Text("Eventos"),
              leading: const Icon(
                Icons.map,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
              },
            ),
            ListTile(
              title: const Text("Historial"),
              leading: const Icon(
                Icons.calendar_month,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Home();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
