import test from "node:test";
import assert from "node:assert/strict";
import { recommendRoutes, scoreRoute } from "../src/app.js";

test("scoreRoute penaliza rutas fuera de servicio", () => {
  const route = { delayMinutes: 0, occupancy: 0, active: false };
  assert.equal(scoreRoute(route), 0);
});

test("recommendRoutes prioriza menor retraso y menor ocupacion", () => {
  const result = recommendRoutes([
    { id: "A", delayMinutes: 14, occupancy: 90, active: true },
    { id: "B", delayMinutes: 3, occupancy: 45, active: true }
  ]);

  assert.equal(result[0].id, "B");
});

