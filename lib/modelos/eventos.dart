class Evento {
  Evento(
      {required this.id,
      required this.titulo,
      required this.imagenes,
      required this.imagenPresnetacion,
      required this.descripcion,
      required this.lugar,
      required this.fecha,
      required this.hora});

  final String id, titulo, imagenPresnetacion, descripcion, lugar, fecha, hora;

  final List<String> imagenes;
}

class CategoriaEvento {
  CategoriaEvento(this.eventos);
  final List<Evento> eventos;
}

CategoriaEvento excursion = CategoriaEvento(
  [
    Evento(
      id: "excursion1",
      titulo: "Excursión de Observación de Pajaros Serrano",
      imagenes: [
        "assets/images/eventos/excursion/evento1img1.jpeg",
        "assets/images/eventos/excursion/evento1img2.jpeg",
        "assets/images/eventos/excursion/evento1img3.jpeg",
      ],
      descripcion:
          "Únete a biólogos marinos en un viaje para observar pajaros serranos en su hábitat natural.",
      imagenPresnetacion:
          "assets/images/eventos/excursion/evento1Presentacion.jpeg",
      lugar: "Durango, Durango",
      fecha: "8 de agosto de 2023",
      hora: "10:00 - 13:00",
    ),
    Evento(
      id: "excursion2",
      titulo: "Caminata para Observar Aves Endemica",
      imagenes: [
        "assets/images/eventos/excursion/evento2img1.jpeg",
        "assets/images/eventos/excursion/evento2img2.jpeg",
      ],
      descripcion:
          "Una caminata guiada por un experto en aves para observar y aprender sobre ellas.",
      imagenPresnetacion:
          "assets/images/eventos/excursion/evento2Presentacion.jpeg",
      lugar: "Rodeo, Durango.",
      fecha: "12 de septiembre de 2023",
      hora: "15:00 - 17:00",
    ),
  ],
);

CategoriaEvento conferencias = CategoriaEvento(
  [
    Evento(
      id: "conferenica1",
      titulo:
          "Conferencia sobre Conservación de Especies en Peligro de Extinción",
      imagenes: [
        "assets/images/eventos/conferencias/evento1img1.jpg",
        "assets/images/eventos/conferencias/evento1img2.jpg",
      ],
      descripcion:
          "Un experto en conservación de fauna silvestre discute los desafíos y las estrategias para proteger a las especies en peligro de extinción en la región.",
      imagenPresnetacion:
          "assets/images/eventos/conferencias/evento1Presentacion.jpg",
      lugar: "Durango, Durango",
      fecha: "5 de octubre de 2023",
      hora: "18:00 - 20:00",
    ),
    Evento(
      id: "conferencia2",
      titulo:
          "Charla sobre la Migración de Aves en la Ruta de las Aves Migratorias",
      imagenes: [
        "assets/images/noImage.png",
        "assets/images/noImage.png",
      ],
      descripcion:
          "Un ornitólogo experto presenta las rutas migratorias de las aves y su importancia para la conservación global de las aves.",
      imagenPresnetacion: "assets/images/noImage.png",
      lugar: "Centro de Visitantes del Parque Nacional.",
      fecha: "5 de noviembre de 2023",
      hora: "14:00 - 16:00",
    ),
  ],
);

CategoriaEvento talleres = CategoriaEvento(
  [
    Evento(
      id: "taller1",
      titulo: "Taller de Fotografía de Naturaleza",
      imagenes: [
        "assets/images/noImage.png",
        "assets/images/noImage.png",
      ],
      descripcion:
          "Un fotógrafo profesional enseña técnicas de fotografía para capturar la belleza de la naturaleza y la vida silvestre.",
      imagenPresnetacion: "assets/images/noImage.png",
      lugar: "Durango, Durango",
      fecha: " 7 de mayo de 2023",
      hora: "14:00 - 17:00",
    ),
    Evento(
      id: "taller2",
      titulo: "Taller de Fabricación de Comederos para Aves",
      imagenes: [
        "assets/images/noImage.png",
        "assets/images/noImage.png",
      ],
      descripcion:
          "Crea comederos de aves reutilizables y aprende sobre la importancia de apoyar a las aves locales.",
      imagenPresnetacion: "assets/images/noImage.png",
      lugar: "Instituto Tecnologico de Durango.",
      fecha: "19 de junio de 2023",
      hora: " 10:30 - 12:30",
    ),
  ],
);

Map<int, CategoriaEvento> todosEventos = {
  1: excursion,
  2: talleres,
  3: conferencias
};
