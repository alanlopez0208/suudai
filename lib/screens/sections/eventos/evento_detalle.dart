import 'package:flutter/material.dart';
import 'package:suudai/modelos/eventos.dart';

class EventoDetalle extends StatefulWidget {
  const EventoDetalle({super.key, required this.id, required this.evento});

  final String id;
  final Evento evento;
  @override
  State<EventoDetalle> createState() => _EventoDetalleState();
}

class _EventoDetalleState extends State<EventoDetalle> {
  late Evento evento;
  late String id;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    evento = widget.evento;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              child: Hero(
                tag: id,
                child: Image(
                  image: AssetImage(evento.imagenPresnetacion),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
