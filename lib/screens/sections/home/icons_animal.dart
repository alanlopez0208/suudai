import 'package:flutter/material.dart';
import 'package:suudai/desing.dart';
import 'package:suudai/size_config.dart';

class IconsAnimal extends StatelessWidget {
  const IconsAnimal({
    super.key,
    required this.titulo,
    required this.imagen,
    required this.link,
  });

  final String titulo, imagen, link;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.blockSizeVertical! * 2,
          horizontal: SizeConfig.blockSizeVertical!,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AspectRatio(
                      aspectRatio: 1 / 0.6,
                      child: Container(
                        padding:
                            EdgeInsets.all(SizeConfig.blockSizeVertical! * 2),
                        decoration: BoxDecoration(
                          color: colorBrownOpacity,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              titulo,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 0,
                    right: 0,
                    child: AspectRatio(
                      aspectRatio: 1 / 0.6,
                      child: Image.asset(imagen),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _launchUrl(Uri url) async {
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
}
