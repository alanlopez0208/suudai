import 'package:flutter/material.dart';
import 'package:suudai/size_config.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({required this.evento});

  final Evento evento;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        width: SizeConfig.screenwidth! / 1.1,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1 / 0.5,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: evento.id,
                    child: Image(
                      image: AssetImage(evento.imagenPresnetacion),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal! * 5,
                    vertical: SizeConfig.blockSizeHorizontal! * 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        evento.titulo,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: SizeConfig.blockSizeHorizontal! * 6,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal! * 5,
                    bottom: SizeConfig.blockSizeHorizontal! * 3),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.date_range_outlined,
                      color: Colors.grey.withOpacity(0.8),
                      size: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      evento.fecha,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.7,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      evento.hora,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.7,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal! * 5,
                    bottom: SizeConfig.blockSizeHorizontal! * 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      color: Colors.grey.withOpacity(0.8),
                      size: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      evento.lugar,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 2.7,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
