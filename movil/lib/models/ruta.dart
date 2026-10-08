class RutaRecomendada {
  final String id;
  final String linea; // Ej: Línea 72, Línea 17
  final String origen;
  final String destino;
  final int tiempoEstimadoMinutos;
  final int retrasoMinutos;
  final int ocupacionActual; // Aforo de pasajeros
  final int capacidadMaxima;
  final String estado; // 'Óptima', 'Congestionada', 'Saturada'
  final bool esRecomendada;

  RutaRecomendada({
    required this.id,
    required this.linea,
    required this.origen,
    required this.destino,
    required this.tiempoEstimadoMinutos,
    required this.retrasoMinutos,
    required this.ocupacionActual,
    required this.capacidadMaxima,
    required this.estado,
    required this.esRecomendada,
  });

  // Mapeo desde el JSON de la API REST (web/)
  factory RutaRecomendada.fromJson(Map<String, dynamic> json) {
    return RutaRecomendada(
      id: json['id'],
      linea: json['linea'],
      origen: json['origen'],
      destino: json['destino'],
      tiempoEstimadoMinutos: json['tiempo_estimado_min'],
      retrasoMinutos: json['retraso_min'],
      ocupacionActual: json['ocupacion_actual'],
      capacidadMaxima: json['capacidad_maxima'],
      estado: json['estado'],
      esRecomendada: json['es_recomendada'] ?? false,
    );
  }
}