import 'package:flutter/material.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/modelos/eventos.dart';
import 'package:suudai/screens/components/card_event.dart';
import 'package:suudai/screens/sections/eventos/evento_detalle.dart';
import 'package:suudai/size_config.dart';

class Eventos extends StatefulWidget {
  const Eventos({Key? key}) : super(key: key);

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  int seleccionado = 0;

  List<Map<String, dynamic>> itemFiltro = [
    {
      "icono": Icons.calendar_today,
      "titulo": "Todos",
    },
    {
      "icono": Icons.terrain,
      "titulo": "Excursion",
    },
    {
      "icono": Icons.explore,
      "titulo": "Talleres",
    },
    {
      "icono": Icons.local_activity,
      "titulo": "Conferencias",
    },
  ];

  List<Evento> eventos = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    todosEventos.forEach((key, value) {
      eventos.addAll(value.eventos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical! * 3,
                ),
                child: Text(
                  "Explorar Eventos",
                  style: TextStyle(
                    fontSize: SizeConfig.screenwidth! * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical,
              ),
              SizedBox(
                height: SizeConfig.screenhegit! * 0.13,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: itemFiltro.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            eventos.clear();
                            seleccionado = index;
                            if (seleccionado == 0) {
                              todosEventos.forEach((key, value) {
                                eventos.addAll(value.eventos);
                              });
                            } else {
                              eventos.addAll(todosEventos[index]!.eventos);
                            }
                          },
                        );
                      },
                      child: ItemFilter(
                        icono: itemFiltro[index]["icono"],
                        titulo: itemFiltro[index]["titulo"],
                        selccionado: index == seleccionado,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 5,
              ),
              Column(
                children: List.generate(
                  eventos.length,
                  (index) {
                    return CardEvent(
                      evento: eventos[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemFilter extends StatelessWidget {
  const ItemFilter({
    super.key,
    required this.icono,
    required this.titulo,
    required this.selccionado,
  });

  final String titulo;
  final IconData icono;
  final bool selccionado;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: EdgeInsets.only(
        right: SizeConfig.blockSizeHorizontal! * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorBackGroundCard,
        border: Border.all(
          color: selccionado ? colorGreen : colorBackGround,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(
        SizeConfig.blockSizeHorizontal! * 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icono,
            size: SizeConfig.blockSizeHorizontal! * 5,
            color: colorGreen,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 0.5,
          ),
          Text(
            titulo,
            style: TextStyle(
              fontWeight: selccionado ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
