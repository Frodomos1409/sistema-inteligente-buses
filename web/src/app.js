export const routes = [
  { id: "R-12", name: "Villa Fatima - Centro", delayMinutes: 6, occupancy: 58, active: true },
  { id: "R-24", name: "El Alto - Prado", delayMinutes: 13, occupancy: 88, active: true },
  { id: "R-31", name: "Sopocachi - Terminal", delayMinutes: 4, occupancy: 42, active: true },
  { id: "R-40", name: "Irpavi - San Pedro", delayMinutes: 18, occupancy: 64, active: false }
];

export function scoreRoute(route) {
  if (!route.active) return 0;

  const punctuality = Math.max(0, 100 - route.delayMinutes * 4);
  const comfort = Math.max(0, 100 - route.occupancy);

  return Math.round(punctuality * 0.65 + comfort * 0.35);
}

export function recommendRoutes(items) {
  return [...items]
    .map((route) => ({ ...route, score: scoreRoute(route) }))
    .sort((a, b) => b.score - a.score);
}

function render() {
  const target = document.querySelector("#routes");
  if (!target) return;

  const recommended = recommendRoutes(routes);

  target.innerHTML = recommended
    .map((route, index) => `
      <article class="route ${index === 0 ? "recommended" : ""}">
        <div>
          <strong>${index === 0 ? "Recomendada: " : ""}${route.name}</strong>
          <div class="meta">
            ${route.id} · retraso ${route.delayMinutes} min · ocupacion ${route.occupancy}% · ${route.active ? "activa" : "fuera de servicio"}
          </div>
        </div>
        <div class="score">${route.score}/100</div>
      </article>
    `)
    .join("");
}

if (typeof document !== "undefined") {
  document.querySelector("#refresh")?.addEventListener("click", render);
  render();
}

