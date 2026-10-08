import 'package:flutter/material.dart';
import 'screens/rutas_recomendadas_screen.dart';

void main() {
  runApp(const SistemaBusesApp());
}

class SistemaBusesApp extends StatelessWidget {
  const SistemaBusesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Buses Santa Cruz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const RutasRecomendadasScreen(),
    );
  }
}