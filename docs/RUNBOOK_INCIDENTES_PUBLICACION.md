# Runbook de Incidentes de Publicación

Objetivo: resolver regresiones de publicación en menos de 15 minutos.

## Señales de incidente

- páginas en blanco o recarga en bucle
- enlaces rotos o redirecciones incorrectas
- contenido desactualizado en producción

## Triage (orden estricto)

1. Confirmar estado del commit desplegado:
   - `gh api repos/evoclub/pseint-manual-referencia-completo/commits/<sha>/status`
2. Validar URLs canónicas críticas:
   - `00-Indice-Principal`, `01-Que-es-PSeInt`, `18-Exportacion-y-Herramientas`
3. Validar 2 rutas legacy críticas (redirect a canónica).
4. Ejecutar auditoría completa:
   - `bash scripts/sync-pseint.sh auditar`

## Si falla auditoría

1. identificar categoría:
   - self-refresh
   - enlaces rotos
   - slugs no canónicos
2. corregir en fuente (`content/`, `vercel.json`, o lógica Quartz)
3. reconstruir:
   - `npx quartz build`
4. re-auditar:
   - `bash scripts/sync-pseint.sh auditar`

## Rollback rápido

1. localizar último commit estable
2. revertir commit problemático
3. publicar y validar auditoría en verde

## Cierre del incidente

Registrar en bitácora:
- fecha/hora
- causa raíz
- fix aplicado
- evidencia (comandos/URLs)
- acción preventiva para evitar recurrencia
