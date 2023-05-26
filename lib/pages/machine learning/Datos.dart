import 'dart:ffi';

class Datos {
  late int _index;

  Datos(int index){
    this._index = index;
  }

  List<Map<int, Map<String, String>>> animalList = [
    {
      0: {
        'nombreComun': 'Alacrán',
        'nombreCientifico': 'Arachnida',
        'familia': 'Buthidae',
        'alimentacion': 'Insectos, arañas y otros artrópodos pequeños',
        'ubicacion': ' Durango, Sonora, Coahuila, Chihuahua',
        'depredadores': 'aves, mamíferos pequeños y reptiles',
      },
    },
    {
      1: {
        'nombreComun': 'Gorrion Serrano',
        'nombreCientifico': 'Emberizoides herbicola',
        'familia': 'Passerellidae',
        'alimentacion': 'Semillas, Insectos y Frutas',
        'ubicacion': ' Chihuahua, Durango, Jalisco, Oaxaca y Puebla',
        'depredadores': 'Coyotes, zorros',
      },
      2: {
        'nombreComun': 'Lobo Mexicano',
        'nombreCientifico': 'Canis lupus baileyi',
        'familia': 'Canidae',
        'alimentacion': 'ciervos y alces',
        'ubicacion': 'Chihuahua, Durango, Sonora y Sinaloa',
        'depredadores': 'Hombre',
      },
    },
  ];



  String obtenerBusqueda(String busqueda) {
    Map<int, Map<String, String>>? animalData = animalList.firstWhere(
          (map) => map.containsKey(this._index)
    );
    if (animalData != null) {
      // Obtener el mapa interno del animal
      Map<String, String> animal = animalData[this._index]!;

      // Obtener el valor de la propiedad especificada
      String valor = animal[busqueda] ?? '';

      return valor;
    } else {
      return '';
    }
  }
}
