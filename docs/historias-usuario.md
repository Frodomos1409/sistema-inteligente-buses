# Historias de usuario

## HU-01 Recomendador de rutas

- Issue: #1
- EDT: 3.2
- Rama: `feature/1-recomendador-rutas`
- Prioridad: alta
- Estimacion: 5 puntos

Como pasajero quiero ver la mejor ruta de bus segun demora y ocupacion para llegar mas rapido y evitar buses saturados.

Criterios de aceptacion:

- [ ] Dado un origen y destino, cuando consulto rutas, entonces veo rutas disponibles.
- [ ] Dado que una ruta tiene ocupacion alta, cuando existe alternativa, entonces el sistema prioriza la alternativa.
- [ ] Dado que una ruta tiene retraso alto, cuando se calcula la recomendacion, entonces baja su puntaje.
- [ ] Dado que no hay rutas, cuando consulto, entonces veo un mensaje de rutas no disponibles.
- [ ] Las pruebas automaticas validan el calculo del puntaje.

## HU-02 Monitoreo de buses

- Issue: #2
- EDT: 3.1
- Rama: `feature/2-monitoreo-buses`

Como operador quiero ver el estado de los buses activos para detectar retrasos y saturacion durante el dia.

## HU-03 Reporte de incidentes

- Issue: #3
- EDT: 3.3
- Rama: `feature/3-reportar-incidente`

Como pasajero quiero reportar un problema en una ruta para que el operador pueda revisarlo.

## Definicion de listo

- Caso de uso aprobado.
- Criterios de aceptacion escritos.
- Rama con numero de issue.
- Commits convencionales.
- PR con `Closes #n`.
- Pruebas en verde.
- Revision cruzada por el companero.

