import 'package:flutter/material.dart';
import '../models/ruta.dart';
import '../services/api_service.dart';

class RutasRecomendadasScreen extends StatefulWidget {
  const RutasRecomendadasScreen({super.key});

  @override
  State<RutasRecomendadasScreen> createState() => _RutasRecomendadasScreenState();
}

class _RutasRecomendadasScreenState extends State<RutasRecomendadasScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<RutaRecomendada>> _rutasFuture;

  @override
  void initState() {
    super.initState();
    _rutasFuture = _apiService.obtenerRutasRecomendadas();
  }

  void _recargarRutas() {
    setState(() {
      _rutasFuture = _apiService.obtenerRutasRecomendadas();
    });
  }

  Color _obtenerColorOcupacion(int actual, int maximo) {
    final porcentaje = actual / maximo;
    if (porcentaje < 0.6) return Colors.green.shade700;
    if (porcentaje < 0.85) return Colors.orange.shade700;
    return Colors.red.shade700;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rutas Recomendadas'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _recargarRutas,
            tooltip: 'Actualizar desde API',
          ),
        ],
      ),
      body: FutureBuilder<List<RutaRecomendada>>(
        future: _rutasFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error al consultar: ${snapshot.error}'));
          }

          final rutas = snapshot.data ?? [];
          if (rutas.isEmpty) {
            return const Center(child: Text('No hay rutas disponibles'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: rutas.length,
            itemBuilder: (context, index) {
              final ruta = rutas[index];
              final ocupacionColor = _obtenerColorOcupacion(
                ruta.ocupacionActual,
                ruta.capacidadMaxima,
              );

              return Card(
                elevation: ruta.esRecomendada ? 4 : 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: ruta.esRecomendada
                      ? const BorderSide(color: Colors.green, width: 2)
                      : BorderSide.none,
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              ruta.linea,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ruta.esRecomendada
                                    ? Colors.green.shade800
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          if (ruta.esRecomendada)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star, size: 16, color: Colors.green.shade800),
                                  const SizedBox(width: 4),
                                  Text(
                                    'RECOMENDADA',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${ruta.origen} ➔ ${ruta.destino}',
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                      ),
                      const Divider(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tiempo: ${ruta.tiempoEstimadoMinutos} min',
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Retraso: +${ruta.retrasoMinutos} min',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ruta.retrasoMinutos > 3
                                      ? Colors.red
                                      : Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Aforo: ${ruta.ocupacionActual}/${ruta.capacidadMaxima}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ocupacionColor,
                                ),
                              ),
                              Text(
                                'Estado: ${ruta.estado}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ocupacionColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}