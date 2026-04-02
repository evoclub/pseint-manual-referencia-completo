# Protocolo Editorial de Publicación (Quartz)

Este protocolo define el flujo oficial para crear, revisar y publicar cursos.

## 1) Estándar editorial por lección

- Estructura mínima obligatoria:
  - `frontmatter` válido
  - `# Título` principal
  - bloque `nav-top`
  - contenido pedagógico
  - bloque `nav-bottom`
  - créditos finales con clase `credit-line`
- Slug canónico:
  - ASCII
  - `kebab-case`
  - sin guiones repetidos (`--`, `---`)
- `permalink`:
  - no usarlo si es redundante con el nombre del archivo
  - solo se permite si representa una ruta alternativa real

## 2) Checklist pre-publicación (obligatorio)

0. Gate local obligatorio:
   - `bash scripts/prepush_release_check.sh`
1. Sincronizar contenido:
   - `bash scripts/sync-pseint.sh sync`
2. Construir sitio:
   - `npx quartz build`
3. Auditoría de enlaces:
   - `bash scripts/sync-pseint.sh auditar`
4. Validación visual manual (mínimo):
   - Inicio
   - una lección intermedia
   - lección final
5. Confirmar:
   - no hay bucles de recarga
   - no hay enlaces con `--` o `---`
   - créditos finales con formato oficial

## 3) Checklist post-publicación

1. Validar URL canónica principal (`200`).
2. Validar al menos 2 URLs legacy (`301/308` a canónica).
3. Recarga forzada en navegador (`Cmd+Shift+R`).
4. Registrar resultado en bitácora (fecha, commit, estado, incidencias).
5. Usar plantilla:
   - `docs/BITACORA_RELEASE_TEMPLATE.md`

## 4) Criterios de calidad de release

Una publicación se considera aprobada si:

- `scripts/auditar_enlaces.py` devuelve código `0`
- no hay `self_refresh` en canónicas
- no hay enlaces internos rotos
- no hay patrón legacy embebido en navegación interna

## 5) Rollback rápido

Si se detecta regresión en producción:

1. Identificar último commit estable.
2. Revertir el commit problemático.
3. Publicar de nuevo y validar con auditoría.

## 6) Política de bloqueo (CI obligatorio)

Para bloquear merges/publicaciones con errores, en GitHub configurar protección de rama `v4`:

1. `Settings` -> `Branches` -> `Add branch protection rule`.
2. Branch name pattern: `v4`.
3. Activar:
   - `Require a pull request before merging`
   - `Require status checks to pass before merging`
4. Marcar como requerido el check:
   - `auditoria-enlaces`
5. Guardar regla.
6. Usar siempre el template de PR:
   - `.github/pull_request_template.md`

Con esta política, cualquier PR que rompa enlaces, reintroduzca bucles o use slugs no canónicos quedará bloqueado automáticamente.

## 7) Operación en solitario (sin aprobador externo)

- `required_approving_review_count` se mantiene en `0` por trabajo individual.
- calidad humana obligatoria mediante:
  - template de PR (`.github/pull_request_template.md`)
  - doble pase en frío (primera revisión + revisión diferida)
  - bitácora de release (`docs/BITACORA_RELEASE_TEMPLATE.md`)
- instalar guard local una sola vez:
  - `bash scripts/setup_local_guards.sh`

## 8) Plan de calibración (1-2 semanas)

Semana 1:
- aplicar guard local en todos los equipos activos
- ejecutar `prepush_release_check.sh` antes de cada publicación
- registrar todas las publicaciones en bitácora

Semana 2:
- revisar fricción del proceso (tiempos, falsos positivos, bloqueos)
- ajustar checklist y runbook sin relajar controles críticos
- consolidar versión final del protocolo
- usar plantilla semanal de 10 minutos:
  - `docs/CALIBRACION_SEMANAL_10_MIN.md`

## 9) Convenciones editoriales oficiales

- Créditos exactos:
  - `Creado con Quartz v4.5.2 © 2026 por: Alexis Carrillo | Círculo Interno • EvoClub`
- Estilo de créditos:
  - `.credit-line`
  - tipografía pequeña
  - opacidad al `50%`
  - legible en modo día y noche
