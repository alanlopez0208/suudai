import 'package:flutter/material.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/screens/machine_learning/camera.dart';
import 'package:suudai/screens/sections/home/body_home.dart';
import 'package:suudai/size_config.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  List<Widget> secciones = [
    BodyHome(),
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().iniciar(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyHome(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        elevation: 0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Camera();
          }));
        },
        child: const Icon(Icons.camera_alt_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconBottomAppBar(
                icono: Icon(_index == 0 ? Icons.home : Icons.home_outlined),
                onPressed: () {
                  setState(
                    () {
                      _index = 0;
                    },
                  );
                },
                isSelected: _index == 0,
              ),
              IconBottomAppBar(
                icono:
                    Icon(_index == 1 ? Icons.qr_code : Icons.qr_code_outlined),
                onPressed: () {
                  setState(
                    () {
                      _index = 1;
                    },
                  );
                },
                isSelected: _index == 1,
              ),
              SizedBox(
                width: SizeConfig.blockSizeHorizontal,
              ),
              IconBottomAppBar(
                icono: Icon(
                    _index == 2 ? Icons.date_range : Icons.date_range_outlined),
                onPressed: () {
                  setState(() {
                    _index = 2;
                  });
                },
                isSelected: _index == 2,
              ),
              IconBottomAppBar(
                icono: Icon(_index == 3 ? Icons.person : Icons.person_outline),
                onPressed: () {
                  setState(() {
                    _index = 3;
                  });
                },
                isSelected: _index == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomAppBar extends StatelessWidget {
  const IconBottomAppBar({
    super.key,
    required this.icono,
    required this.onPressed,
    required this.isSelected,
  });

  final Icon icono;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
      decoration: BoxDecoration(
        color: isSelected ? colorGreenOpacity : Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icono,
        color: isSelected ? colorGreen : colorsIcon,
      ),
    );
  }
}
