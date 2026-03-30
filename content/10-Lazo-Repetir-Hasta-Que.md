---
title: "10 — Lazo Repetir–Hasta Que"
aliases:
  - Repetir Hasta Que PSeInt
  - Do While PSeInt
  - Ciclo Repetir
tags:
  - pseint
  - repetir
  - ciclos
  - estructuras-de-control
created: 2026-03-26
version: "pseint-20250218"
---
\n
← [[09-Lazo-Mientras]] | [[00-Indice-Principal]] | Siguiente: [[11-Lazo-Para]] →

---

> [!info] Concepto clave
> El lazo `Repetir` ejecuta el bloque de instrucciones **al menos una vez** y luego repite **hasta que** la condición sea verdadera. A diferencia del [[09-Lazo-Mientras|Mientras]], la condición se evalúa **al final** de cada iteración.

---

## Sintaxis

```
Repetir
    <instrucciones>
Hasta Que <condición>
```

> [!note] Lógica invertida
> - En `Mientras`: se repite **mientras** la condición sea `Verdadero`
> - En `Repetir`: se repite **hasta que** la condición sea `Verdadero` (o sea, mientras sea `Falso`)

---

## Flujo de ejecución

```
        ┌─────────────┐
        │  Ejecutar   │
        │   cuerpo    │ ← siempre se ejecuta al menos una vez
        └──────┬──────┘
               │
        ┌──────▼──────┐
        │  Evaluar    │
        │  condición  │
        └──────┬──────┘
               │
       ┌───────┴────────┐
       │                │
   Verdadero          Falso
       │                │
       ▼                ▼
   Termina el       (volver a
    ciclo           ejecutar cuerpo)
```

---

## Ejemplo básico — Contar del 1 al 5

```
Proceso ContarHasta5
    Definir i Como Entero;
    i <- 1;
    Repetir
        Escribir i;
        i <- i + 1;
    Hasta Que i > 5;
FinProceso
```

---

## Uso principal — Validación de entrada

El caso de uso más común de `Repetir` es pedir datos al usuario hasta que sean válidos:

```
Proceso PedirNota
    Definir nota Como Real;
    Repetir
        Escribir "Ingrese una nota (0 a 10): ";
        Leer nota;
        Si (nota < 0) | (nota > 10) Entonces
            Escribir "Nota inválida. Intente de nuevo.";
        FinSi;
    Hasta Que (nota >= 0) & (nota <= 10);
    Escribir "Nota aceptada: ", nota;
FinProceso
```

> [!tip] Ventaja sobre `Mientras` en validación
> Con `Repetir` no es necesario inicializar la variable con un valor inválido antes del ciclo — el primer `Leer` ocurre antes de verificar la condición.

---

## Ejemplo — Menú con salida

```
Proceso MenuRepetir
    Definir opcion Como Entero;
    Repetir
        Limpiar Pantalla;
        Escribir "=== MENÚ ===";
        Escribir "1. Ver reporte";
        Escribir "2. Agregar dato";
        Escribir "0. Salir";
        Escribir "Opción: ";
        Leer opcion;
        Segun opcion Hacer
            1: Escribir "Mostrando reporte...";
            2: Escribir "Agregando dato...";
            0: Escribir "Saliendo...";
            De Otro Modo: Escribir "Opción no válida";
        FinSegun;
    Hasta Que opcion = 0;
FinProceso
```

---

## Ejemplo — Acumular mientras el usuario quiera

```
Proceso AcumularNumeros
    Definir numero, suma Como Real;
    Definir continuar Como Texto;
    suma <- 0;
    Repetir
        Escribir "Ingrese un número: ";
        Leer numero;
        suma <- suma + numero;
        Escribir "¿Ingresar otro? (si/no): ";
        Leer continuar;
        continuar <- Minusculas(continuar);
    Hasta Que continuar = "no";
    Escribir "Suma total: ", suma;
FinProceso
```

---

## Comparación con `Mientras`

| Característica | `Mientras` | `Repetir` |
|---|---|---|
| Evaluación de condición | Al **inicio** | Al **final** |
| Ejecuciones mínimas | **0** (puede no ejecutarse) | **1** (siempre se ejecuta) |
| Condición para continuar | Mientras sea `Verdadero` | Mientras sea `Falso` |
| Mejor para... | Cuando podría no ejecutarse | Cuando siempre se ejecuta al menos una vez |

```
// Con Mientras (requiere inicializar)
nota <- -1;
Mientras (nota < 0) | (nota > 10) Hacer
    Leer nota;
FinMientras;

// Con Repetir (más limpio)
Repetir
    Leer nota;
Hasta Que (nota >= 0) & (nota <= 10);
```

---

## Relación con otros temas

- [[09-Lazo-Mientras]] — variante con condición al inicio
- [[11-Lazo-Para]] — variante con contador automático
- [[05-Expresiones-y-Operadores]] — la condición es una expresión lógica
- [[06-Entrada-y-Salida]] — `Leer` dentro del cuerpo para validar entradas
- [[07-Condicional-Si-Entonces]] — se puede combinar dentro del `Repetir`
- [[14-Funciones-de-Cadena]] — `Minusculas()` para comparar texto ingresado

---

← [[09-Lazo-Mientras]] | [[00-Indice-Principal]] | Siguiente: [[11-Lazo-Para]] →
