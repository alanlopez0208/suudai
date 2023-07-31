import 'package:google_maps_flutter/google_maps_flutter.dart';

class Animal {
  Animal({
    required this.ubicaciones,
    required this.nombre,
    required this.genero,
    required this.familia,
    required this.orden,
    required this.clase,
    required this.apariencia,
    required this.assetsImages,
  });

  final String nombre, genero, familia, orden, clase, apariencia;
  final List<LatLng> ubicaciones;
  final List<String> assetsImages;
}

Animal gorrion = Animal(
  ubicaciones: [
    LatLng(24.014674, -105.443432),
    LatLng(23.879247, -105.366674),
    LatLng(23.698236, -105.225762),
  ],
  nombre: "Gorrion Serrano",
  genero: "",
  familia: "Scorpionidae",
  orden: "",
  clase: "",
  apariencia:
      "El gorrión serrano, conocido científicamente como Zonotrichia leucophrys, es una especie de ave paseriforme que pertenece a la familia de los Emberizidae.",
  assetsImages: [
    "",
  ],
);

Animal alacran = Animal(
  ubicaciones: [
    LatLng(24.014674, -105.443432),
    LatLng(23.879247, -105.366674),
    LatLng(23.698236, -105.225762),
  ],
  nombre: "Alacran",
  genero: "",
  familia: "Scorpionidae",
  orden: "",
  clase: "",
  apariencia:
      "Los alacranes son arácnidos pertenecientes al orden Scorpiones. Tienen un cuerpo segmentado dividido en dos partes principales: el cefalotórax, que alberga los órganos sensoriales y las pinzas delanteras, y el abdomen, que contiene el aguijón venenoso y el telson.",
  assetsImages: [
    "assets/images/noImage",
  ],
);

Animal lobo = Animal(
  ubicaciones: [
    LatLng(24.014674, -105.443432),
    LatLng(23.879247, -105.366674),
    LatLng(23.698236, -105.225762),
  ],
  nombre: "Lobo Mexicano",
  genero: "",
  familia: "Canis Lupus Baileyi",
  orden: "",
  clase: "",
  apariencia:
      "El lobo mexicano, también conocido como Canis lupus baileyi, es una subespecie de lobo gris nativa de México y considerada una de las especies más emblemáticas y en peligro de extinción en América del Norte.",
  assetsImages: [
    "",
  ],
);

Map<int, Animal> animales = {
  0: gorrion,
  1: alacran,
  2: lobo,
};

Map<int, List<Animal>> grupoAnimal = {
  0: [lobo, alacran],
  1: [alacran, gorrion],
  2: [gorrion, lobo]
};
