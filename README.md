# Sistema inteligente para buses

Repositorio base para el proyecto de Sistemas III. El objetivo es construir un sistema inteligente que ayude a consultar rutas, estimar llegadas y monitorear buses con datos de ocupacion, retraso y estado de servicio.

## Stack elegido

Stack A del curso:

- Web/API: Laravel con PostgreSQL.
- Movil: Flutter consumiendo la API REST.
- Base actual: prototipo inicial en `web/` con reglas de recomendacion de buses para validar la historia #1 antes de crear el scaffold completo.

## Estructura

```text
sistema-inteligente-buses/
├── movil/                 # Producto movil - Estudiante 1
├── web/                   # Producto web/API - Estudiante 2
├── docs/                  # EDT, CPM, casos de uso e historias
├── .github/               # Templates y CI
├── .env.example           # Variables sin secretos
├── .gitignore
└── README.md
```

## Roles de la pareja

- Estudiante 1: driver principal en `movil/`, prueba y aprueba los PR de `web/`.
- Estudiante 2: driver principal en `web/`, prueba y aprueba los PR de `movil/`.
- Ambos: EDT, CPM, Planner, historias de usuario, revision de diseno y defensa del proyecto.

## Flujo Git requerido

```bash
git switch develop
git pull
git switch -c feature/1-recomendador-rutas
git add .
git commit -m "feat(web): agrega recomendador de rutas #1"
git push -u origin feature/1-recomendador-rutas
```

El Pull Request debe ir hacia `develop` y cerrar el issue con `Closes #1`.

## Ejecutar el prototipo web

```bash
cd web
npm test
npm start
```

Luego abrir `http://localhost:4173`.

## Entregables cubiertos

- EDT con codigos jerarquicos.
- Estimacion PERT y ruta critica CPM.
- Casos de uso, historias de usuario y criterios de aceptacion.
- Ramas `main`, `develop` y `feature/1-recomendador-rutas`.
- Plantillas de issue, bug y pull request.
- CI basico para ejecutar pruebas.
- `.gitignore`, `.env.example` y estructura `movil/`, `web/`, `docs/`.

