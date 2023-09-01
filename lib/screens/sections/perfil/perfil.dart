import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

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
