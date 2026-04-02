# PSeInt — Manual de Referencia Completo

Sitio publicado con GitHub Pages:

- https://evoclub.github.io/pseint-manual-referencia-completo/

## Alcance de este repositorio

Este repositorio contiene solo el sitio estático ya generado del manual de PSeInt.

## Estructura mínima

- `public/` → sitio web estático que se publica en GitHub Pages.
- `.github/workflows/deploy.yml` → despliegue de `public/` a GitHub Pages (en cada **push a `v4`** que toque `public/` o el propio workflow, y también bajo demanda con **Run workflow**).

## Publicación

- **GitHub Pages:** al fusionar cambios en la rama `v4` que incluyan `public/`, el workflow despliega solo. También puedes ir a **Actions → Deploy PSeInt site to GitHub Pages → Run workflow** (rama `v4`).
- **Vercel:** si el proyecto está enlazado al repo con rama de producción `v4` y directorio de salida `public`, cada merge a `v4` genera un deploy (p. ej. dominio `pseint.circulointerno.app` según configuración del equipo).

## Protocolo editorial recomendado

- Documento oficial: `PROTOCOLO_PUBLICACION.md`
- Plantilla oficial de lección: `docs/plantillas/TEMPLATE_LECCION.md`

## Auditoría rápida de enlaces

- Solo auditar dominio desplegado:
  - `bash scripts/sync-pseint.sh auditar`
- Sincronizar y auditar en un paso:
  - `bash scripts/sync-pseint.sh sync-auditar`
- Dominio personalizado:
  - `BASE_URL="https://pseint.circulointerno.app" bash scripts/sync-pseint.sh auditar`

## Gate local antes de publicar

- Ejecutar control completo:
  - `bash scripts/prepush_release_check.sh`
- Instalar guard local (una vez):
  - `bash scripts/setup_local_guards.sh`

## Bloqueo de merges por calidad

- Workflow de calidad: `.github/workflows/auditoria-editorial.yml`
- Check requerido recomendado en protección de rama `v4`:
  - `auditoria-enlaces`
- Guía paso a paso:
  - `PROTOCOLO_PUBLICACION.md` (sección "Política de bloqueo")

## Operación y registro

- Runbook de incidentes:
  - `docs/RUNBOOK_INCIDENTES_PUBLICACION.md`
- Bitácora de release:
  - `docs/BITACORA_RELEASE_TEMPLATE.md`
- Calibración semanal (10 min):
  - `docs/CALIBRACION_SEMANAL_10_MIN.md`
