import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/size_config.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> with TickerProviderStateMixin {
  late TabController tabController;
  late Color color;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    cambiarColor();
  }

  void cambiarColor() {
    if (tabController.index == 0) {
      color = Colors.blue;
    } else {
      color = Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.blockSizeVertical! * 3,
                ),
                CircleAvatar(
                  radius: SizeConfig.screenwidth! * 0.15,
                  backgroundColor: Colors.transparent,
                  child: Image(
                    image: AssetImage("assets/images/noImage.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Usuario Predefinido",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: TabBar(
                onTap: (value) {
                  setState(() {
                    cambiarColor();
                  });
                },
                unselectedLabelColor: Colors.grey,
                labelColor: colorGreen,
                controller: tabController,
                indicatorColor: colorGreen,
                tabs: const <Tab>[
                  Tab(
                    icon: Icon(
                      Icons.home,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.event,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<File>> exportarDatos() async {
    Directory direccion = await getApplicationDocumentsDirectory();

    final files = direccion.listSync();

    List<File> imagenes = List.empty(growable: true);

    for (var archivo in files) {
      if (archivo is File) {
        imagenes.add(archivo);
      }
    }

    return imagenes;
  }
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("ESTA ES UNA BETA"),
                content: const Text(
                    "No se ha validado el inicio de sesion ya que esta es una app de prueba"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Volver"),
                  )
                ],
              );
            },
          );
        },
        child: Text("Iniciar sesion"),
      ),
    );
  }
}
