import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/screens/home.dart';
import 'package:suudai/size_config.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().iniciar(context);
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: colorBackGround,
        fontFamily: "Montserrat",
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*
class Inicio extends StatelessWidget {
  ImagePicker picker = ImagePicker();

  Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6AA83D),
        centerTitle: true,
        title: Text("Suudai’ App"),
      ),
      drawer: MenuHamburgesa(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      color: Colors.red,
                      child: Text("Hola Mundo"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      color: Colors.green,
                      child: Text("Hola Mundo"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Container(
                        color: Colors.amber,
                        height: double.infinity,
                        padding: EdgeInsets.all(20),
                        child: Text("probando"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toScanners(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => QRScanner()));
  }
}

class CardInicio extends StatelessWidget {
  const CardInicio({
    super.key,
    required this.titulo,
    required this.icono,
    required this.imagen,
  });

  final String titulo, imagen;
  final Icon icono;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Ink.image(
                  image: AssetImage(imagen),
                  colorFilter:
                      const ColorFilter.mode(Colors.grey, BlendMode.color),
                  fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        titulo,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      icono
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/