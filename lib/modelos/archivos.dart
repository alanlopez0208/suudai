class Historial {
  final String fecha;
  final int animal;
  final String path;

  Historial({
    required this.fecha,
    required this.animal,
    required this.path,
  });

  factory Historial.fromJson(Map<String, dynamic> json) {
    return Historial(
      fecha: json["fecha"],
      animal: json["animal"],
      path: json["path"],
    );
  }

  // Método para convertir la instancia en un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'fecha': fecha,
      'animal': animal,
      'path': path,
    };
  }
}
