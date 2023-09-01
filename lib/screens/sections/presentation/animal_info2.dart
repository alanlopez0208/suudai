import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../modelos/animal.dart';

class AnimalInfo2 extends StatefulWidget{
  AnimalInfo2({super.key, required this.animal});
  final Animal animal;

  @override
  State<AnimalInfo2> createState() => _AnimalInfo2State();
}

class _AnimalInfo2State extends State<AnimalInfo2> {

  int currentPage = 0;
  late PageController _pageController;
  Completer<GoogleMapController> _controller = Completer();
  late Animal animal;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.5,
    );

    animal = widget.animal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("animal info in category search"),
    );
  }
}