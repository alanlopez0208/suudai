import 'package:flutter/material.dart';

class OverlayCamera extends StatelessWidget {
  const OverlayCamera(
      {super.key,
      required this.ancho,
      required this.largo,
      required this.padding});

  final double ancho, largo, padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: CustomPaint(
        painter: PaintOverlay(ancho: ancho, largo: largo),
      ),
    );
  }
}

class PaintOverlay extends CustomPainter {
  PaintOverlay({
    required this.ancho,
    required this.largo,
  });

  final double ancho, largo;
  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, ancho, largo),
      const Radius.circular(20.0),
    );

    Path rectangulosPath = Path()

      //Aqui lo que hagoo es ponerlo en la pociosion (0,0,ancho y alto) <- (x,y,finx, finy)
      ..addRect(
        Rect.fromLTRB(-20, -20, ancho / 3, largo / 3),
      )
      ..addRect(
        Rect.fromLTRB((ancho / 3) * 2, (largo / 3) * 2, ancho + 20, largo + 20),
      )
      ..addRect(
        Rect.fromLTRB((ancho / 3) * 2, -20, ancho + 20, largo / 3),
      )
      ..addRect(
        Rect.fromLTRB(-20, (largo / 3) * 2, (largo / 3), largo + 20),
      );

    canvas.clipPath(rectangulosPath);

    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = ancho / 100,
    );
  }

  @override
  bool shouldRepaint(PaintOverlay oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PaintOverlay oldDelegate) => true;
}
