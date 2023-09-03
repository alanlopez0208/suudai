import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/modelos/eventos.dart';
import 'package:suudai/size_config.dart';

class EventoDetalle extends StatefulWidget {
  const EventoDetalle(
      {super.key,
      required this.id,
      required this.evento,
      required this.paleta});

  final String id;
  final Evento evento;
  final PaletteGenerator paleta;
  @override
  State<EventoDetalle> createState() => _EventoDetalleState();
}

class _EventoDetalleState extends State<EventoDetalle> {
  late Evento evento;
  late String id;
  late PaletteGenerator paleta;

  @override
  void initState() {
    super.initState();
    id = widget.id;
    evento = widget.evento;
    paleta = widget.paleta;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: paleta.dominantColor!.color,
                ),
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1 / 0.7,
                      child: Hero(
                        tag: id,
                        child: Image(
                          image: AssetImage(evento.imagenPresnetacion),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal! * 4,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal! * 4,
                          ),
                          Text(
                            evento.titulo,
                            style: TextStyle(
                              color: paleta.lightVibrantColor?.color ??
                                  paleta.dominantColor!.bodyTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.screenhegit! * 0.03,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal! * 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range,
                                color: paleta.lightVibrantColor?.color ??
                                    paleta.dominantColor!.bodyTextColor,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 4,
                              ),
                              Text(
                                evento.fecha,
                                style: TextStyle(
                                  color: paleta.lightVibrantColor?.color ??
                                      paleta.dominantColor!.bodyTextColor,
                                  fontSize: SizeConfig.screenhegit! * 0.02,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 4,
                              ),
                              Text(
                                evento.hora,
                                style: TextStyle(
                                  color: paleta.lightVibrantColor?.color ??
                                      paleta.dominantColor!.bodyTextColor,
                                  fontSize: SizeConfig.screenhegit! * 0.02,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeHorizontal! * 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.place,
                                color: paleta.lightVibrantColor?.color ??
                                    paleta.dominantColor!.bodyTextColor,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 4,
                              ),
                              Expanded(
                                child: Text(
                                  evento.lugar,
                                  style: TextStyle(
                                    color: paleta.lightVibrantColor?.color ??
                                        paleta.dominantColor!.bodyTextColor,
                                    fontSize: SizeConfig.screenhegit! * 0.02,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 4,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 4,
                          ),
                          const Divider(
                            color: Colors.white24,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal! * 4,
                          ),
                          Text(
                            evento.descripcion,
                            style: TextStyle(
                              color: paleta.lightVibrantColor?.color ??
                                  paleta.dominantColor!.bodyTextColor,
                              fontSize: SizeConfig.screenhegit! * 0.023,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeHorizontal! * 10,
                    ),
                    Carrusel(
                      evento: evento,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 5,
                  vertical: SizeConfig.blockSizeHorizontal! * 3,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colorGreen,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ]),
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: () {},
                  child: Text(
                    "Guardar Evento",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Carrusel extends StatelessWidget {
  const Carrusel({
    super.key,
    required this.evento,
  });

  final Evento evento;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: SizeConfig.blockSizeVertical! * 15,
      ),
      child: CarouselSlider.builder(
        itemCount: evento.imagenes.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  evento.imagenes[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 16 / 9,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
