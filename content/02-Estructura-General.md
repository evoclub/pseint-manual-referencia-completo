---
title: "02 — Estructura General de un Algoritmo"
aliases:
  - Estructura PSeInt
  - Proceso FinProceso
tags:
  - pseint
  - estructura
  - algoritmo
created: 2026-03-26
version: "pseint-20250218"
---

# 02 — Estructura General de un Algoritmo

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/01-Que-es-PSeInt">← 01 — ¿Qué es PSeInt?</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/03-Tipos-de-Datos">03 — Tipos de Datos →</a>
</div>

---

> [!info] Concepto clave
> Todo algoritmo en PSeInt debe estar encerrado entre las palabras clave **`Proceso`** y **`FinProceso`**. Esta es la única estructura obligatoria.

---

## Forma básica

```
Proceso NombreDelAlgoritmo
    accion_1;
    accion_2;
    ...
    accion_n;
FinProceso
```

- Comienza con `Proceso` seguido del **nombre** del algoritmo.
- Le sigue una secuencia de instrucciones, cada una terminada en **punto y coma** (`;`).
- Finaliza con `FinProceso`.

---

## Sinónimos aceptados

Dependiendo del [[17 - Perfiles de Lenguaje|perfil de lenguaje]], también se aceptan:

| Palabra | Sinónimo aceptado |
|---|---|
| `Proceso` | `Algoritmo` |
| `FinProceso` | `FinAlgoritmo` |

> [!tip] Las palabras clave **no distinguen** entre mayúsculas y minúsculas. `proceso`, `PROCESO` y `Proceso` son equivalentes.

---

## Ejemplo mínimo válido

```
Proceso HolaMundo
    Escribir "¡Hola, mundo!";
FinProceso
```

Al ejecutar este algoritmo, se mostrará en la consola:
```
¡Hola, mundo!
```

---

## Ejemplo con entrada y salida

```
Proceso SaludarUsuario
    Definir nombre Como Texto;
    Escribir "¿Cuál es tu nombre? ";
    Leer nombre;
    Escribir "¡Hola, ", nombre, "!";
FinProceso
```

Este algoritmo usa:
- [[03 - Tipos de Datos]] — declara `nombre` como `Texto`
- [[06 - Entrada y Salida]] — `Leer` y `Escribir`

---

## Reglas estructurales

> [!warning] Restricciones importantes
> 1. **No puede haber instrucciones fuera** del bloque `Proceso ... FinProceso` (salvo declaraciones de [[15 - SubProcesos y Funciones]] y [[16 - Comentarios]]).
> 2. Las instrucciones terminan con **punto y coma** `;` (obligatorio en perfil estricto, opcional en flexible — ver [[17 - Perfiles de Lenguaje]]).
> 3. Las estructuras anidadas ([[07 - Condicional Si–Entonces]], [[09 - Lazo Mientras]], etc.) deben comenzar y finalizar **dentro de su contenedora**.
> 4. Solo puede haber **un proceso principal** por archivo.

---

## Estructura con SubProcesos

Cuando el algoritmo incluye [[15 - SubProcesos y Funciones]], estos se declaran **fuera y antes** del proceso principal:

```
// Declaración del subproceso (va FUERA del Proceso)
SubProceso Saludar
    Escribir "¡Hola!";
FinSubProceso

// Proceso principal
Proceso Principal
    Saludar;
FinProceso
```

---

## Inicio de sesión en PSeInt

Al abrir PSeInt, la aplicación muestra automáticamente la estructura base:

```
Proceso sin_titulo
    
FinProceso
```

Esto permite comenzar a programar sin tener que recordar la plantilla.

---

## Conceptos relacionados en este vault

- [[03 - Tipos de Datos]] — qué tipos de datos se pueden usar dentro del proceso
- [[04 - Variables e Identificadores]] — cómo nombrar variables dentro del proceso
- [[06 - Entrada y Salida]] — instrucciones `Leer` y `Escribir` dentro del proceso
- [[15 - SubProcesos y Funciones]] — cómo modularizar con bloques adicionales
- [[16 - Comentarios]] — cómo documentar el código
- [[17 - Perfiles de Lenguaje]] — cómo afecta el perfil a la sintaxis obligatoria

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/01-Que-es-PSeInt">← 01 — ¿Qué es PSeInt?</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/03-Tipos-de-Datos">03 — Tipos de Datos →</a>
</div>

<p class="credit-line">Creado con Quartz v4.5.2 © 2026 por: Alexis Carrillo | Círculo Interno • EvoClub</p>
