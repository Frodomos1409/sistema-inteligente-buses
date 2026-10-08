import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/ruta.dart';

class ApiService {
  // URL base apuntando al backend Laravel en web/
  // En Android emulador se suele usar 10.0.2.2:8000
  static const String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<List<RutaRecomendada>> obtenerRutasRecomendadas() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/rutas/recomendadas'))
          .timeout(const Duration(seconds: 3));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => RutaRecomendada.fromJson(item)).toList();
      }
    } catch (_) {
      // Fallback con datos de prueba realistas para Santa Cruz mientras web/ se levanta
    }

    return _obtenerDatosSimulados();
  }

  List<RutaRecomendada> _obtenerDatosSimulados() {
    return [
      RutaRecomendada(
        id: '1',
        linea: 'Línea 72 (Primer Anillo)',
        origen: 'Parada UAGRM Campus',
        destino: 'Parada Parque Urbano',
        tiempoEstimadoMinutos: 18,
        retrasoMinutos: 1,
        ocupacionActual: 14,
        capacidadMaxima: 30,
        estado: 'Fluido',
        esRecomendada: true,
      ),
      RutaRecomendada(
        id: '2',
        linea: 'Línea 17',
        origen: 'Parada UAGRM Campus',
        destino: 'Parada Parque Urbano',
        tiempoEstimadoMinutos: 27,
        retrasoMinutos: 6,
        ocupacionActual: 28,
        capacidadMaxima: 30,
        estado: 'Saturado',
        esRecomendada: false,
      ),
      RutaRecomendada(
        id: '3',
        linea: 'Línea 18',
        origen: 'Parada UAGRM Campus',
        destino: 'Parada Cristo Redentor',
        tiempoEstimadoMinutos: 22,
        retrasoMinutos: 4,
        ocupacionActual: 22,
        capacidadMaxima: 32,
        estado: 'Moderado',
        esRecomendada: false,
      ),
    ];
  }
}