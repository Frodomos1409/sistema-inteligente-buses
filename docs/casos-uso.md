# Casos de uso

## CU-01 Consultar mejor ruta

- Sistema: Sistema inteligente para buses.
- Actor: Pasajero.
- Canal: Web y app movil.
- Precondicion: existen rutas registradas.
- Postcondicion: el pasajero ve la ruta recomendada.

Flujo basico:

1. El pasajero ingresa origen y destino.
2. El sistema lista rutas disponibles.
3. El sistema calcula demora, ocupacion y estado.
4. El sistema recomienda la mejor opcion.

Flujo alterno:

- 3a. Si no hay rutas, el sistema muestra un mensaje claro.
- 3b. Si una ruta esta saturada, el sistema recomienda una alternativa.

## CU-02 Monitorear buses

- Actor: Operador.
- Objetivo: ver buses activos, retrasos y ocupacion.
- Resultado: el operador identifica problemas del servicio.

## CU-03 Reportar incidente

- Actor: Pasajero.
- Objetivo: informar retraso, exceso de ocupacion o bus fuera de servicio.
- Resultado: el reporte queda asociado a una ruta.

