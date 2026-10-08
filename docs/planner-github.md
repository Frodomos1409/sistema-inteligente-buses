# Trazabilidad Planner y GitHub

La regla del equipo es mantener el mismo numero en Planner, GitHub, rama, commit y PR.

Ejemplo de la primera historia:

- EDT: 3.2
- Planner: `[3.2] #1 Recomendador de rutas`
- Issue: `#1 Recomendador de rutas`
- Rama: `feature/1-recomendador-rutas`
- Commit: `feat(web): agrega recomendador de rutas #1`
- PR: `Closes #1`
- Release: `v0.1.0`

## Depositos Planner

- Backlog
- Iteracion 1
- En progreso
- En revision (PR)
- Hecho

## Etiquetas

- `web`
- `movil`
- `bug`
- `ruta-critica`
- `documentacion`

## Proteccion sugerida

- `main`: requiere Pull Request desde `develop`, 1 aprobacion y CI en verde.
- `develop`: requiere Pull Request desde `feature/*`, 1 aprobacion y CI en verde.
- Bloquear force push y borrado.

