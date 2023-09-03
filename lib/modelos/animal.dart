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
    const LatLng(24.014674, -105.443432),
    const LatLng(23.879247, -105.366674),
    const LatLng(23.698236, -105.225762),
  ],
  nombre: "Gorrion Serrano",
  genero: "Xenospiza Bangs, 1931",
  familia: "Passerellidae",
  orden: "Passeriformes",
  clase: "Aves",
  apariencia:
      "El gorrión serrano, conocido científicamente como Zonotrichia leucophrys, es una especie de ave paseriforme que pertenece a la familia de los Emberizidae.",
  assetsImages: [
    "assets/images/g/g1.jpg",
    "assets/images/g/g2.jpg",
    "assets/images/g/g3.jpg",
  ],
);

Animal alacran = Animal(
  ubicaciones: [
    const LatLng(24.014674, -105.443432),
    const LatLng(23.879247, -105.366674),
    const LatLng(23.698236, -105.225762),
  ],
  nombre: "Alacran",
  genero: "Alacran",
  familia: "Scorpionidae",
  orden: "Scorpiones",
  clase: "Arachnida",
  apariencia:
      "Los alacranes son arácnidos pertenecientes al orden Scorpiones. Tienen un cuerpo segmentado dividido en dos partes principales: el cefalotórax, que alberga los órganos sensoriales y las pinzas delanteras, y el abdomen, que contiene el aguijón venenoso y el telson.",
  assetsImages: [
    "assets/images/alacran/a1.jpg",
    "assets/images/alacran/a2.jpg",
    "assets/images/alacran/a3.webp",
  ],
);

Animal lobo = Animal(
  ubicaciones: [
    const LatLng(24.014674, -105.443432),
    const LatLng(23.879247, -105.366674),
    const LatLng(23.698236, -105.225762),
  ],
  nombre: "Lobo Mexicano",
  genero: "	Canis",
  familia: "Canis Lupus Baileyi",
  orden: "Carnivora",
  clase: "Mammalia",
  apariencia:
      "El lobo mexicano, también conocido como Canis lupus baileyi, es una subespecie de lobo gris nativa de México y considerada una de las especies más emblemáticas y en peligro de extinción en América del Norte.",
  assetsImages: [
    "assets/images/lobo/l1.jpg",
    "assets/images/lobo/l2.jpg",
    "assets/images/lobo/l3.jpeg",
  ],
);

Map<int, Animal> animales = {
  0: alacran,
  1: gorrion,
  2: lobo,
};

Map<String, List<Animal>> grupoAnimal = {
  "bird": [lobo, alacran],
  "alacran": [alacran, gorrion],
  "lobo": [gorrion, lobo]
};
