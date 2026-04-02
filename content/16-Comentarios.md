---
title: "16 — Comentarios"
aliases:
  - Comentarios PSeInt
  - Documentar código PSeInt
tags:
  - pseint
  - comentarios
  - documentacion
created: 2026-03-26
version: "pseint-20250218"
---

# 16 — Comentarios

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/15-SubProcesos-y-Funciones">← 15 — SubProcesos y Funciones</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/17-Perfiles-de-Lenguaje">17 — Perfiles de Lenguaje →</a>
</div>

---

> [!info] Concepto clave
> Los **comentarios** son texto ignorado por el intérprete. Sirven para documentar el código, explicar la lógica y facilitar la comprensión del algoritmo para quien lo lea (incluyendo el propio autor tiempo después).

---

## Sintaxis — doble barra `//`

Todo lo que sigue a `//` en una línea es un comentario:

```
// Esto es un comentario de línea completa

Proceso MiAlgoritmo
    Leer x;    // Comentario al final de una instrucción
    // Los comentarios pueden aparecer en cualquier línea
    Escribir x;
FinProceso
```

---

## Tipos de uso

### Comentario de línea completa

```
// Calculadora de área del círculo
// Autor: Alex Carrillo
// Fecha: 2026-03-26
Proceso AreaCirculo
    ...
FinProceso
```

### Comentario al final de instrucción

```
radio <- 5;           // valor en centímetros
area <- PI * radio^2; // fórmula: π × r²
```

### Comentario de bloque (varias líneas)

PSeInt no tiene comentarios de bloque nativos (`/* */`), pero se simulan con varias líneas `//`:

```
// =============================================
// SubProceso: CalcularDescuento
// Parámetros:
//   precio  → precio original (Real)
//   pct     → porcentaje de descuento (Real)
// Retorna: precio final con descuento aplicado
// =============================================
SubProceso resultado <- CalcularDescuento(precio, pct)
    resultado <- precio - (precio * pct / 100);
FinSubProceso
```

---

## Reglas de los comentarios

> [!note] Reglas
> 1. Los comentarios pueden aparecer en **cualquier línea** — antes, después o como línea exclusiva
> 2. **No pueden ir instrucciones** después de un comentario en la misma línea
> 3. Son ignorados completamente por el intérprete — no afectan la ejecución
> 4. La única excepción: **no puede haber instrucciones fuera del `Proceso`**, pero sí comentarios

```
// ✅ Comentario fuera del Proceso (válido)
// Este algoritmo calcula el factorial

SubProceso res <- Factorial(n)   // ✅ Comentario en SubProceso
    // Caso base
    Si n <= 1 Entonces
        res <- 1;   // Factorial de 0 y 1 es 1
    SiNo
        res <- n * Factorial(n-1);
    FinSi;
FinSubProceso
```

---

## Buenas prácticas de documentación

> [!tip] Qué documentar y cómo

**1. Encabezado del algoritmo:**
```
// Algoritmo: NombreDelAlgoritmo
// Descripción: Qué hace el algoritmo
// Versión: 1.0
// Autor: Nombre
```

**2. Secciones del código:**
```
// --- Entrada de datos ---
Leer n;

// --- Procesamiento ---
suma <- 0;
Para i <- 1 Hasta n Hacer
    suma <- suma + i;
FinPara;

// --- Salida de resultados ---
Escribir "Suma: ", suma;
```

**3. SubProcesos:**
```
// Función: CalcularPromedio
// Recibe: arreglo de datos y su tamaño n
// Retorna: el promedio de los elementos
SubProceso prom <- CalcularPromedio(datos, n)
    ...
FinSubProceso
```

**4. Fórmulas no evidentes:**
```
// Fórmula de interés compuesto: A = P(1 + r/n)^(nt)
monto <- capital * (1 + tasa/periodos) ^ (periodos * anios);
```

**5. Advertencias o casos especiales:**
```
// NOTA: El arreglo debe estar ordenado antes de llamar esta función
// ADVERTENCIA: No usar con n = 0 (produce división por cero)
```

---

## Comentarios temporales — debugging

Los comentarios también sirven para **deshabilitar temporalmente** instrucciones durante la depuración:

```
Proceso Debug
    Leer a, b;
    // Escribir "Valor de a antes: ", a;   // desactivado
    a <- a + b;
    Escribir "Resultado: ", a;
FinProceso
```

---

## Relación con otros temas

- [[02 - Estructura General]] — los comentarios pueden aparecer fuera del `Proceso`
- [[15 - SubProcesos y Funciones]] — documentar parámetros y propósito de cada subproceso
- [[17 - Perfiles de Lenguaje]] — los comentarios funcionan igual en todos los perfiles

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/15-SubProcesos-y-Funciones">← 15 — SubProcesos y Funciones</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/17-Perfiles-de-Lenguaje">17 — Perfiles de Lenguaje →</a>
</div>

