import 'package:flutter/material.dart';

class SizeConfig {
  MediaQueryData? _mediaQueryData;
  static double? screenwidth;
  static double? screenhegit;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void iniciar(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenhegit = _mediaQueryData!.size.height;

    screenwidth = _mediaQueryData!.size.width;

    blockSizeHorizontal = screenwidth! / 100;
    blockSizeVertical = screenhegit! / 100;
  }
}
