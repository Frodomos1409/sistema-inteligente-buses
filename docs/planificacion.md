# Planificacion EDT, PERT y CPM

## EDT

| Codigo | Entregable | Responsable | GitHub/Planner |
| --- | --- | --- | --- |
| 1.0 | Sistema inteligente para buses | Pareja | Proyecto completo |
| 1.1 | Plan EDT, PERT y CPM | Ambos | docs/planificacion.md |
| 1.2 | Tablero Planner | Ambos | Tareas con codigo EDT e issue |
| 2.1 | Requisitos e historias de usuario | Ambos | docs/historias-usuario.md |
| 2.2 | Modelo de datos inicial | Estudiante 2 | Issue #2 |
| 2.3 | Diseno de interfaz | Ambos | Issue #3 |
| 3.1 | Consulta de rutas | Estudiante 2 | Issue #1 |
| 3.2 | Recomendador inteligente | Estudiante 2 | Issue #1 |
| 3.3 | Vista movil de rutas | Estudiante 1 | Issue #4 |
| 4.1 | Pruebas integrales | Ambos | CI |
| 4.2 | Manual de usuario | Ambos | docs/manual-usuario.md |
| 5.1 | Despliegue y release | Ambos | v0.1.0 |

## PERT

Unidades en dias.

| Act. | EDT | Paquete | Pred. | O | M | P | TE | Sigma |
| --- | --- | --- | --- | ---: | ---: | ---: | ---: | ---: |
| A | 2.1 | Requisitos e historias | - | 1 | 2 | 3 | 2 | 0.33 |
| B | 2.2 | Modelo de datos | A | 1 | 2 | 5 | 2.33 | 0.67 |
| C | 2.3 | Diseno de interfaz | A | 1 | 2 | 3 | 2 | 0.33 |
| D | 3.1 | Consulta de rutas | B, C | 2 | 3 | 5 | 3.17 | 0.50 |
| E | 3.2 | Recomendador inteligente | D | 2 | 4 | 8 | 4.33 | 1.00 |
| F | 3.3 | Vista movil | D | 2 | 3 | 6 | 3.33 | 0.67 |
| G | 4.1 | Pruebas integrales | E, F | 1 | 2 | 3 | 2 | 0.33 |
| H | 4.2 | Manual de usuario | C | 1 | 2 | 4 | 2.17 | 0.50 |
| I | 5.1 | Release v0.1.0 | G, H | 1 | 1 | 2 | 1.17 | 0.17 |

Formula usada: `TE = (O + 4M + P) / 6`.

## CPM

Ruta critica propuesta:

`A -> B -> D -> E -> G -> I`

Duracion esperada aproximada: `15 dias`.

Estas tareas tienen prioridad en Planner porque un atraso retrasa la entrega completa.

## Iteraciones

| Iteracion | Dias | Tareas | Resultado |
| --- | --- | --- | --- |
| 1 | 1-5 | A, B, C | Requisitos, datos e interfaz base |
| 2 | 6-10 | D, E | Consulta y recomendador web |
| 3 | 11-15 | F, G, H | Vista movil, pruebas y manual |
| 4 | 16 | I | Tag y release v0.1.0 |

## Tareas Planner sugeridas

| Deposito | Tarea | Etiquetas | Asignado |
| --- | --- | --- | --- |
| Backlog | [2.1] #1 Definir historias de rutas | Fase 2, ruta critica | Ambos |
| En progreso | [3.2] #1 Recomendador de rutas | Fase 3, web, ruta critica | Estudiante 2 |
| Backlog | [3.3] #4 Vista movil de rutas | Fase 3, movil | Estudiante 1 |
| Backlog | [4.1] #5 Pruebas integrales | Fase 4 | Ambos |
| Backlog | [5.1] #6 Publicar v0.1.0 | Fase 5, ruta critica | Ambos |

