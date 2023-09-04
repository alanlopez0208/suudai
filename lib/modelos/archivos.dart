class Historial {
  final String fecha, animal;

  Historial({required this.fecha, required this.animal});

  factory Historial.fromJson(Map<String, dynamic> json) {
    return Historial(fecha: json["fecha"], animal: json["animal"]);
  }
}
