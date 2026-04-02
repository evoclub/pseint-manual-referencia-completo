# PSeInt — Manual de Referencia Completo

Sitio publicado con GitHub Pages:

- https://evoclub.github.io/pseint-manual-referencia-completo/

## Alcance de este repositorio

Este repositorio contiene solo el sitio estático ya generado del manual de PSeInt.

## Estructura mínima

- `public/` → sitio web estático que se publica en GitHub Pages.
- `.github/workflows/deploy.yml` → despliegue automático de `public/`.

## Publicación

Cada push a `v4` o `main` publica `public/` automáticamente en GitHub Pages.

## Protocolo editorial recomendado

- Documento oficial: `PROTOCOLO_PUBLICACION.md`
- Plantilla oficial de lección: `content/TEMPLATE_LECCION.md`

## Auditoría rápida de enlaces

- Solo auditar dominio desplegado:
  - `bash scripts/sync-pseint.sh auditar`
- Sincronizar y auditar en un paso:
  - `bash scripts/sync-pseint.sh sync-auditar`
- Dominio personalizado:
  - `BASE_URL="https://pseint.circulointerno.app" bash scripts/sync-pseint.sh auditar`

## Bloqueo de merges por calidad

- Workflow de calidad: `.github/workflows/auditoria-editorial.yml`
- Check requerido recomendado en protección de rama `v4`:
  - `auditoria-enlaces`
- Guía paso a paso:
  - `PROTOCOLO_PUBLICACION.md` (sección "Política de bloqueo")
