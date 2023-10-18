import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/modelos/animal.dart';
import 'package:suudai/modelos/archivos.dart';
import 'package:suudai/screens/sections/presentation/animal_info.dart';
import 'package:suudai/screens/sections/presentation/lugar_info.dart';
import 'package:suudai/size_config.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> with TickerProviderStateMixin {
  late TabController tabController;
  late int filtro;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    filtro = 0;
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  ),
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
                    filtro = value;
                  });
                },
                unselectedLabelColor: Colors.grey,
                labelColor: colorGreen,
                controller: tabController,
                indicatorColor: colorGreen,
                tabs: const <Tab>[
                  Tab(
                    icon: Icon(
                      Icons.photo,
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
          FutureBuilder(
            future: leerArchivoJson(filtro),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return SliverGrid.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    Historial historial = snapshot.data![index];

                    Animal? animal = animales[historial.animal];
                    return CardAnimal(
                      titulo: animal!.nombre,
                      imagen: historial.path,
                      fecha: historial.fecha,
                      idAnimal: historial.animal,
                    );
                  },
                );
              } else {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("NO SE HA REGISTRADO NINGUNA EVENTO"),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

// Función para leer y analizar un archivo JSON y retornar la lista de mapas
  Future<List<Historial>> leerArchivoJson(int filtro) async {
    List<Historial> listaHistorial = [];
    if (filtro == 0) {
      try {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/his.json';
        final file = File(filePath);
        if (await file.exists()) {
          final jsonString = await file.readAsString();
          final jsonData = json.decode(jsonString);

          for (var element in jsonData) {
            final historial = Historial.fromJson(element);
            listaHistorial.add(historial);
          }
        }
        return listaHistorial;
      } catch (e) {
        print("Error al leer el archivo JSON: $e");
        return [];
      }
    }
    return listaHistorial;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class CardAnimal extends StatelessWidget {
  const CardAnimal({
    super.key,
    required this.titulo,
    required this.imagen,
    required this.fecha,
    required this.idAnimal,
  });

  final String titulo, imagen, fecha;
  final int idAnimal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!),
      child: SizedBox(
        height: SizeConfig.screenhegit! / 3,
        child: GestureDetector(
          onTap: () {
            Animal? animal = animales[idAnimal];
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AnimalInfo(animal: animal!, imgPath: imagen)),
            );
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      image: FileImage(File(imagen)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      titulo,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                    ),
                    Text(
                      fecha.substring(0, 10),
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.6,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Animal interchangeImages(String titulo) {
    if (titulo == "Aves")
      return gorrion;
    else if (titulo == "Mamiferos")
      return lobo;
    else if (titulo == "Insectos") return alacran;
    return lobo;
  }

  String interchangeNames(String titulo) {
    if (titulo == "Aves")
      return "Gorrion Serrano";
    else if (titulo == "Mamiferos")
      return "Lobo Mexicano";
    else if (titulo == "Insectos") return "Alacran";
    return "";
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
