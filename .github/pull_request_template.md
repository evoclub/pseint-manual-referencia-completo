## Objetivo del cambio

- [ ] Este PR tiene un objetivo concreto y verificable.
- Resumen breve (que cambia y por que):

## Riesgo y alcance

- Tipo de cambio:
  - [ ] Contenido editorial
  - [ ] Navegacion/enlaces
  - [ ] Estilos/UI
  - [ ] Infra/CI
  - [ ] Redirects/vercel.json
- Riesgo esperado:
  - [ ] Bajo
  - [ ] Medio
  - [ ] Alto
- Impacto en produccion:

## Evidencia tecnica obligatoria

- [ ] `npx quartz build` ejecutado sin errores.
- [ ] `bash scripts/sync-pseint.sh auditar` ejecutado y en verde.
- Resultado del build/auditoria (pegar salida relevante):

## Validacion funcional minima

- [ ] Probado en pagina de inicio.
- [ ] Probado en una leccion intermedia.
- [ ] Probado en la ultima leccion.
- [ ] Sin bucles de recarga.
- [ ] Sin enlaces con `--` o `---`.
- [ ] Creditos finales en formato oficial.

## Redirects (si aplica)

- [ ] No modifique redirects.
- [ ] Modifique redirects y valide legacy -> canonica (`301/308`).
- URLs legacy probadas:

## Doble pase (trabajo en solitario)

Primera revision (autor):
- Fecha/hora:
- Hallazgos y ajustes:

Segunda revision en frio (obligatoria antes de merge):
- [ ] Han pasado al menos 30 minutos desde la primera revision.
- Fecha/hora:
- Cambios finales tras segunda revision:
- Decision final:
  - [ ] Merge
  - [ ] No merge

## Checklist de cierre

- [ ] Este PR cumple `PROTOCOLO_PUBLICACION.md`.
- [ ] El riesgo residual es aceptable.
- [ ] La descripcion permite auditar el cambio semanas despues.
