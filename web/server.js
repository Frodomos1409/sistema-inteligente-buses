import { createServer } from "node:http";
import { readFile } from "node:fs/promises";
import { extname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = fileURLToPath(new URL("./src/", import.meta.url));
const types = {
  ".html": "text/html; charset=utf-8",
  ".css": "text/css; charset=utf-8",
  ".js": "text/javascript; charset=utf-8"
};

const server = createServer(async (req, res) => {
  const path = req.url === "/" ? "index.html" : req.url.slice(1);
  const filePath = join(root, path);

  try {
    const content = await readFile(filePath);
    res.writeHead(200, { "content-type": types[extname(filePath)] || "text/plain" });
    res.end(content);
  } catch {
    res.writeHead(404, { "content-type": "text/plain; charset=utf-8" });
    res.end("No encontrado");
  }
});

server.listen(4173, () => {
  console.log("Web disponible en http://localhost:4173");
});

