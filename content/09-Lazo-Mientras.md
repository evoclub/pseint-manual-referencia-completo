---
title: "09 — Lazo Mientras"
aliases:
  - Mientras PSeInt
  - While PSeInt
  - Ciclo Mientras
tags:
  - pseint
  - mientras
  - ciclos
  - estructuras-de-control
created: 2026-03-26
version: "pseint-20250218"
---

# 09 — Lazo Mientras

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/08-Seleccion-Multiple-Segun">← 08 — Selección Múltiple — Según</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/10-Lazo-Repetir-Hasta-Que">10 — Lazo Repetir–Hasta Que →</a>
</div>

---

> [!info] Concepto clave
> El lazo `Mientras` repite un bloque de instrucciones **mientras** una condición sea verdadera. La condición se evalúa **antes** de cada iteración, por lo que si es falsa desde el inicio, el cuerpo **nunca se ejecuta**.

---

## Sintaxis

```
Mientras <condición> Hacer
    <instrucciones>
FinMientras
```

---

## Flujo de ejecución

```
        ┌─────────────┐
        │  Evaluar    │
        │  condición  │
        └──────┬──────┘
               │
       ┌───────┴────────┐
       │                │
   Verdadero          Falso
       │                │
       ▼                ▼
  ┌─────────┐      Continúa el
  │ Ejecutar│      programa
  │ cuerpo  │
  └────┬────┘
       │
       └──────── (volver a evaluar)
```

---

## Ejemplo básico — Contar del 1 al 10

```
Proceso ContarHasta10
    Definir i Como Entero;
    i <- 1;
    Mientras i <= 10 Hacer
        Escribir i;
        i <- i + 1;
    FinMientras;
FinProceso
```

> [!warning] ¡Cuidado con los ciclos infinitos!
> El cuerpo del ciclo **debe** contener alguna instrucción que modifique la variable de la condición. Si `i` nunca cambia, el `Mientras` nunca termina.

---

## Ejemplo — Suma acumulativa

```
Proceso SumaHastaN
    Definir n, i, suma Como Entero;
    Escribir "¿Hasta qué número sumar? ";
    Leer n;
    suma <- 0;
    i <- 1;
    Mientras i <= n Hacer
        suma <- suma + i;
        i <- i + 1;
    FinMientras;
    Escribir "La suma de 1 a ", n, " es: ", suma;
FinProceso
```

---

## Ejemplo — Validación de entrada (centinela)

Uno de los usos más comunes del `Mientras` es **validar datos ingresados**:

```
Proceso PedirEdadValida
    Definir edad Como Entero;
    edad <- -1;     // valor inicial inválido para entrar al ciclo
    Mientras (edad < 0) | (edad > 120) Hacer
        Escribir "Ingrese una edad válida (0-120): ";
        Leer edad;
    FinMientras;
    Escribir "Edad registrada: ", edad;
FinProceso
```

---

## Ejemplo — Menú repetitivo

```
Proceso MenuConSalida
    Definir opcion Como Entero;
    opcion <- 0;
    Mientras opcion <> 3 Hacer
        Limpiar Pantalla;
        Escribir "1. Opción A";
        Escribir "2. Opción B";
        Escribir "3. Salir";
        Leer opcion;
        Segun opcion Hacer
            1: Escribir "Elegiste A";
            2: Escribir "Elegiste B";
            3: Escribir "Hasta luego";
            De Otro Modo: Escribir "Opción inválida";
        FinSegun;
    FinMientras;
FinProceso
```

---

## `Mientras` con condición compuesta

```
Proceso BuscarEnArreglo
    Definir datos(10) Como Entero;
    Definir i, buscado Como Entero;
    Definir encontrado Como Logico;
    // (suponemos datos ya cargados)
    Leer buscado;
    i <- 1;
    encontrado <- Falso;
    Mientras (i <= 10) & ~encontrado Hacer
        Si datos(i) = buscado Entonces
            encontrado <- Verdadero;
        FinSi;
        i <- i + 1;
    FinMientras;
    Si encontrado Entonces
        Escribir "Encontrado en posición ", i - 1;
    SiNo
        Escribir "No encontrado";
    FinSi;
FinProceso
```

---

## Comparación con otros lazos

| Lazo | Condición evaluada | Ejecuciones mínimas |
|---|---|---|
| [[09 - Lazo Mientras\|Mientras]] | Antes de cada iteración | 0 (puede no ejecutarse) |
| [[10 - Lazo Repetir–Hasta Que\|Repetir]] | Después de cada iteración | 1 (siempre ejecuta al menos una vez) |
| [[11 - Lazo Para\|Para]] | Variable contadora automática | Depende del rango |

> [!tip] ¿Cuándo usar `Mientras`?
> Úsalo cuando **no sabes de antemano** cuántas veces se repetirá el ciclo y la condición debe verificarse antes de ejecutar el cuerpo. Si el cuerpo debe ejecutarse al menos una vez, considera [[10 - Lazo Repetir–Hasta Que]].

---

## Relación con otros temas

- [[05 - Expresiones y Operadores]] — la condición es una expresión lógica
- [[10 - Lazo Repetir–Hasta Que]] — variante donde la condición va al final
- [[11 - Lazo Para]] — variante con contador automático
- [[04 - Variables e Identificadores]] — la variable contadora debe actualizarse en el cuerpo
- [[12 - Arreglos]] — `Mientras` se usa para recorrer arreglos con condición dinámica

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/08-Seleccion-Multiple-Segun">← 08 — Selección Múltiple — Según</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/10-Lazo-Repetir-Hasta-Que">10 — Lazo Repetir–Hasta Que →</a>
</div>

