# PSeInt — Manual de Referencia Completo

Sitio publicado con GitHub Pages:

- https://evoclub.github.io/pseint-manual-referencia-completo/

## Alcance de este repositorio

Este repositorio publica exclusivamente el manual de PSeInt en formato web.

Fuente de contenido:

- `/Users/alexiscarrillo/Library/Mobile Documents/iCloud~md~obsidian/Documents/iC_Obsidian/CURSOS/ConquerB/PSeInt`

## Flujo de publicación

Desde la raíz del repo:

```bash
npm run sync:pseint
git add .
git commit -m "Actualiza contenido PSeInt"
git push
```

## Scripts disponibles

- `npm run sync:pseint` sincroniza solo Markdown de PSeInt a `content/` y normaliza enlaces.
- `npm run build:pseint` sincroniza y compila el sitio.
- `npm run serve:pseint` sincroniza y levanta preview local en `http://localhost:8080`.
