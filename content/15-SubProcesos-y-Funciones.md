---
title: "15 — SubProcesos y Funciones"
permalink: 15-SubProcesos-y-Funciones
aliases:
  - SubProcesos PSeInt
  - Funciones PSeInt
  - Procedimientos PSeInt
  - Recursividad PSeInt
tags:
  - pseint
  - subprocesos
  - funciones
  - modularidad
  - recursividad
created: 2026-03-26
version: "pseint-20250218"
---

# 15 — SubProcesos y Funciones

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/14-Funciones-de-Cadena">← 14 — Funciones de Cadena</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/16-Comentarios">16 — Comentarios →</a>
</div>

---

> [!info] Disponibilidad
> Los SubProcesos están disponibles desde la versión `20121010` (octubre 2012). Permiten modularizar el código agrupando instrucciones bajo un nombre reutilizable, evitando la repetición y mejorando la legibilidad.

---

## Tipos de SubProcesos

| Tipo | Descripción | Uso |
|---|---|---|
| **Procedimiento** | No retorna ningún valor | Se llama como una instrucción |
| **Función** | Retorna un valor | Se usa como operando en una expresión |

---

## Declaración — Procedimiento (sin retorno)

```
SubProceso NombreDelSubProceso(param1, param2, ...)
    <instrucciones>
FinSubProceso
```

```
// Sin parámetros
SubProceso Saludar
    Escribir "¡Hola mundo!";
FinSubProceso

// Con parámetros
SubProceso MostrarNombre(nombre, apellido)
    Escribir "Nombre: ", nombre, " ", apellido;
FinSubProceso
```

---

## Declaración — Función (con retorno)

```
SubProceso resultado <- NombreDeLaFuncion(param1, param2, ...)
    <instrucciones>
    resultado <- <valor a retornar>;
FinSubProceso
```

```
// Función que retorna el doble de un número
SubProceso res <- Doble(num)
    res <- num * 2;
FinSubProceso

// Función que retorna si un número es par
SubProceso resultado <- EsPar(n)
    resultado <- (n MOD 2 = 0);
FinSubProceso
```

---

## Ubicación de los SubProcesos

> [!important] Los SubProcesos van **fuera y antes** del proceso principal

```
// ✅ CORRECTO — SubProceso antes del Proceso
SubProceso Saludar
    Escribir "Hola";
FinSubProceso

Proceso Principal
    Saludar;
FinProceso
```

```
// ❌ INCORRECTO — SubProceso dentro del Proceso
Proceso Principal
    SubProceso Saludar       // ERROR
        Escribir "Hola";
    FinSubProceso
FinProceso
```

---

## Llamada a SubProcesos

```
Proceso Principal
    Definir x Como Entero;
    Leer x;

    // Llamada a procedimiento (sin paréntesis si no hay args)
    Saludar;
    MostrarNombre("Alex", "Carrillo");

    // Llamada a función (como operando en expresión)
    Escribir "El doble de ", x, " es ", Doble(x);

    // Almacenar resultado
    Definir par Como Logico;
    par <- EsPar(x);
    Si par Entonces
        Escribir x, " es par";
    FinSi;
FinProceso
```

---

## Pasaje de parámetros

### Por Valor (predeterminado para variables simples)

La función trabaja con una **copia** — los cambios no afectan la variable original:

```
SubProceso Duplicar(num Por Valor)
    num <- num * 2;    // solo cambia la copia local
FinSubProceso

Proceso Test
    Definir x Como Entero;
    x <- 5;
    Duplicar(x);
    Escribir x;    // sigue siendo 5
FinProceso
```

### Por Referencia (predeterminado para arreglos)

La función trabaja con la **variable original** — los cambios sí la afectan:

```
SubProceso Triplicar(num Por Referencia)
    num <- num * 3;    // modifica la variable original
FinSubProceso

Proceso Test
    Definir x Como Entero;
    x <- 5;
    Triplicar(x);
    Escribir x;    // ahora es 15
FinProceso
```

> [!note] Regla de pasaje por defecto
> - Variables simples → **por valor** (si no se especifica)
> - [[12 - Arreglos|Arreglos]] → **por referencia** (siempre)

---

## Ejemplo completo con múltiples SubProcesos

```
// Subproceso: verificar si es primo
SubProceso resultado <- EsPrimo(n)
    Definir divisores, i Como Entero;
    divisores <- 0;
    Para i <- 1 Hasta n Hacer
        Si n MOD i = 0 Entonces
            divisores <- divisores + 1;
        FinSi;
    FinPara;
    resultado <- divisores <= 2;
FinSubProceso

// Subproceso: mostrar línea decorativa
SubProceso LineSeparadora(caracter, cantidad)
    Definir i Como Entero;
    Para i <- 1 Hasta cantidad Hacer
        Escribir Sin Saltar caracter;
    FinPara;
    Escribir "";
FinSubProceso

// Proceso principal
Proceso PrimosDel1Al50
    Definir n Como Entero;
    LineSeparadora("=", 30);
    Escribir "Números primos del 1 al 50:";
    LineSeparadora("=", 30);
    Para n <- 1 Hasta 50 Hacer
        Si EsPrimo(n) Entonces
            Escribir Sin Saltar n, "  ";
        FinSi;
    FinPara;
    Escribir "";
FinProceso
```

---

## Recursividad

Un SubProceso puede llamarse a sí mismo — esto se llama **recursividad**:

```
// Factorial recursivo
SubProceso resultado <- Factorial(n)
    Si n <= 1 Entonces
        resultado <- 1;
    SiNo
        resultado <- n * Factorial(n - 1);
    FinSi;
FinSubProceso

// Torres de Hanoi recursivo
SubProceso Hanoi(n, origen, destino, auxiliar)
    Si n > 0 Entonces
        Hanoi(n-1, origen, auxiliar, destino);
        Escribir "Mover disco ", n, " de ", origen, " a ", destino;
        Hanoi(n-1, auxiliar, destino, origen);
    FinSi;
FinSubProceso

Proceso TestRecursion
    Escribir "5! = ", Factorial(5);           // 120
    Escribir "";
    Escribir "Torres de Hanoi con 3 discos:";
    Hanoi(3, "A", "C", "B");
FinProceso
```

> [!warning] Cuidado con la recursividad
> Toda función recursiva **debe tener un caso base** (condición de parada) que detenga las llamadas. Sin él, el programa generará un error de desbordamiento de pila.

---

## Sinónimos aceptados

| Estándar | Sinónimos |
|---|---|
| `SubProceso` | `Subproceso`, `Funcion`, `SubAlgoritmo` |
| `FinSubProceso` | `FinSubproceso`, `FinFuncion`, `FinSubAlgoritmo` |

---

## Relación con otros temas

- [[02 - Estructura General]] — los SubProcesos van fuera del `Proceso` principal
- [[04 - Variables e Identificadores]] — los parámetros son identificadores
- [[03 - Tipos de Datos]] — los parámetros tienen tipos asociados
- [[12 - Arreglos]] — los arreglos se pasan siempre por referencia
- [[13 - Funciones Matemáticas]] — funciones predefinidas del lenguaje (no SubProcesos)
- [[14 - Funciones de Cadena]] — funciones predefinidas para cadenas
- [[16 - Comentarios]] — documentar los SubProcesos con comentarios

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/14-Funciones-de-Cadena">← 14 — Funciones de Cadena</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/16-Comentarios">16 — Comentarios →</a>
</div>

| Contribución: Alexis Carrillo | Círculo Interno • EvoClub | Creado con Quartz v4.5.2 © 2026
