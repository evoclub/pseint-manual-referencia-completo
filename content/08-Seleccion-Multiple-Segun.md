---
title: "08 — Selección Múltiple — Según"
permalink: 08-Seleccion-Multiple-Segun
aliases:
  - Según PSeInt
  - Selección múltiple
  - Switch PSeInt
  - Segun Hacer
tags:
  - pseint
  - segun
  - estructuras-de-control
  - seleccion-multiple
created: 2026-03-26
version: "pseint-20250218"
---

# 08 — Selección Múltiple — Según

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/07-Condicional-Si-Entonces">← 07 — Condicional Si–Entonces</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/09-Lazo-Mientras">09 — Lazo Mientras →</a>
</div>

---

> [!info] Concepto clave
> La instrucción `Según` permite ejecutar diferentes bloques de instrucciones dependiendo del valor de una **variable numérica**. Es la alternativa elegante a múltiples `Si` anidados cuando se evalúa una sola variable contra valores fijos.

---

## Sintaxis

```
Segun <variable> Hacer
    <valor1>: <instrucciones>
    <valor2>, <valor3>: <instrucciones>
    ...
    De Otro Modo: <instrucciones>
FinSegun
```

> [!note] Reglas
> - La `<variable>` debe ser de [[03 - Tipos de Datos#Tipo Numérico|tipo Numérico]]
> - Múltiples valores para una misma opción se separan con **comas** `,`
> - `De Otro Modo` es **opcional** — se ejecuta si el valor no coincide con ninguna opción
> - Las instrucciones de cada opción pueden ocupar más de una línea

---

## Ejemplo básico — Días de la semana

```
Proceso DiasDeLaSemana
    Definir dia Como Entero;
    Escribir "Ingrese un número del 1 al 7: ";
    Leer dia;
    Segun dia Hacer
        1: Escribir "Lunes";
        2: Escribir "Martes";
        3: Escribir "Miércoles";
        4: Escribir "Jueves";
        5: Escribir "Viernes";
        6: Escribir "Sábado";
        7: Escribir "Domingo";
        De Otro Modo: Escribir "Número inválido";
    FinSegun;
FinProceso
```

---

## Ejemplo — Valores múltiples por opción

Cuando dos o más valores producen el mismo resultado, se separan con coma:

```
Proceso DiasHabilesODescanso
    Definir dia Como Entero;
    Leer dia;
    Segun dia Hacer
        1, 2, 3, 4, 5: Escribir "Día hábil";
        6, 7:          Escribir "Fin de semana";
        De Otro Modo:  Escribir "Número fuera de rango";
    FinSegun;
FinProceso
```

---

## Ejemplo — Menú de calculadora

```
Proceso Calculadora
    Definir a, b Como Real;
    Definir op Como Entero;

    Escribir "=== CALCULADORA ===";
    Escribir "1. Sumar";
    Escribir "2. Restar";
    Escribir "3. Multiplicar";
    Escribir "4. Dividir";
    Escribir "Elija opción: ";
    Leer op;

    Escribir "Primer número: ";
    Leer a;
    Escribir "Segundo número: ";
    Leer b;

    Segun op Hacer
        1:
            Escribir "Resultado: ", a + b;
        2:
            Escribir "Resultado: ", a - b;
        3:
            Escribir "Resultado: ", a * b;
        4:
            Si b <> 0 Entonces
                Escribir "Resultado: ", a / b;
            SiNo
                Escribir "Error: división por cero";
            FinSi;
        De Otro Modo:
            Escribir "Opción no válida";
    FinSegun;
FinProceso
```

> [!tip] `Si` dentro de `Según`
> Las instrucciones dentro de cada opción pueden incluir estructuras completas como [[07 - Condicional Si–Entonces]], [[09 - Lazo Mientras]], etc.

---

## Comparación — `Según` vs `Si` anidado

El mismo problema con ambas estructuras:

**Con Si anidado:**
```
Si op = 1 Entonces
    Escribir a + b;
SiNo
    Si op = 2 Entonces
        Escribir a - b;
    SiNo
        Si op = 3 Entonces
            Escribir a * b;
        FinSi;
    FinSi;
FinSi;
```

**Con Según (más limpio):**
```
Segun op Hacer
    1: Escribir a + b;
    2: Escribir a - b;
    3: Escribir a * b;
FinSegun
```

> [!tip] Cuándo usar cada uno
> - Usa `Según` cuando evalúas **una variable** contra **valores numéricos específicos**
> - Usa [[07 - Condicional Si–Entonces]] cuando evalúas **rangos**, **condiciones compuestas** o variables de tipo texto

---

## Relación con otros temas

- [[07 - Condicional Si–Entonces]] — alternativa para condiciones complejas o rangos
- [[05 - Expresiones y Operadores]] — la variable del `Según` puede ser el resultado de una expresión
- [[03 - Tipos de Datos#Tipo Numérico|Tipo Numérico]] — el `Según` solo trabaja con variables numéricas
- [[06 - Entrada y Salida]] — `Según` típicamente procesa valores leídos con `Leer`

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/07-Condicional-Si-Entonces">← 07 — Condicional Si–Entonces</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/09-Lazo-Mientras">09 — Lazo Mientras →</a>
</div>

| Contribución: Alexis Carrillo | Círculo Interno • EvoClub | Creado con Quartz v4.5.2 © 2026
