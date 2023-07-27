import 'package:flutter/material.dart';
import 'package:suudai/size_config.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({
    super.key,
    required this.titulo,
    required this.imagen,
    required this.lugar,
    required this.fecha,
    required this.hora,
  });

  final String titulo, imagen, lugar, fecha, hora;

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
                  child: Image(
                    image: AssetImage(imagen),
                    fit: BoxFit.cover,
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
                    Text(
                      titulo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3.6,
                      ),
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
                      fecha,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      hora,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
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
                      lugar,
                      style: TextStyle(
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
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
