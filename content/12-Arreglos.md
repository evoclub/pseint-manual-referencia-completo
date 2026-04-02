---
title: "12 — Arreglos"
aliases:
  - Arreglos PSeInt
  - Arrays PSeInt
  - Vectores PSeInt
  - Matrices PSeInt
  - Dimension PSeInt
tags:
  - pseint
  - arreglos
  - arrays
  - vectores
  - matrices
created: 2026-03-26
version: "pseint-20250218"
---

# 12 — Arreglos

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/11-Lazo-Para">← 11 — Lazo Para</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/13-Funciones-Matematicas">13 — Funciones Matemáticas →</a>
</div>

---

> [!info] Concepto clave
> Un **arreglo** es una variable que almacena múltiples valores del **mismo [[03 - Tipos de Datos|tipo]]** bajo un solo nombre, accediendo a cada valor mediante un **índice**. Los arreglos pueden ser de una dimensión (vectores) o de múltiples dimensiones (matrices).

---

## Declaración — `Dimension`

```
Dimension <identificador>(<max1>);                    // vector
Dimension <identificador>(<max1>, <max2>);            // matriz
Dimension <id1>(<max1>), <id2>(<max2>);              // múltiples arreglos
```

```
// Vector de 10 elementos
Dimension notas(10);

// Matriz de 3 filas y 4 columnas
Dimension tabla(3, 4);

// Tres arreglos en una línea
Dimension nombres(5), edades(5), promedios(5);
```

> [!important] Reglas de `Dimension`
> - Los arreglos deben declararse **antes de usarlos**
> - Los índices comienzan en **1** (perfil estándar) o **0** (según el perfil — ver [[17 - Perfiles de Lenguaje]])
> - El tamaño debe ser una expresión numérica **positiva**
> - El tipo del arreglo se determina por los valores que se le asignan (como las variables normales — ver [[03 - Tipos de Datos]])

---

## Acceso a elementos

```
// Asignar un valor
notas(1) <- 8.5;
tabla(2, 3) <- 100;

// Leer desde teclado hacia una posición
Leer notas(1);

// Escribir el valor de una posición
Escribir notas(1);
Escribir tabla(2, 3);

// Usar en una expresión
suma <- notas(1) + notas(2) + notas(3);
```

---

## Vectores — 1 dimensión

Un vector es un arreglo de una sola dimensión, como una lista lineal.

```
Proceso EjemploVector
    Definir i Como Entero;
    Dimension datos(5);

    // Cargar con Para
    Para i <- 1 Hasta 5 Hacer
        Escribir Sin Saltar "Dato ", i, ": ";
        Leer datos(i);
    FinPara;

    // Mostrar
    Para i <- 1 Hasta 5 Hacer
        Escribir "datos(", i, ") = ", datos(i);
    FinPara;
FinProceso
```

---

## Matrices — 2 dimensiones

Una matriz organiza los datos en filas y columnas.

```
Proceso EjemploMatriz
    Definir i, j Como Entero;
    Dimension mat(3, 3);

    // Cargar
    Para i <- 1 Hasta 3 Hacer
        Para j <- 1 Hasta 3 Hacer
            Escribir Sin Saltar "mat(", i, ",", j, ")= ";
            Leer mat(i, j);
        FinPara;
    FinPara;

    // Mostrar como tabla
    Para i <- 1 Hasta 3 Hacer
        Para j <- 1 Hasta 3 Hacer
            Escribir Sin Saltar mat(i, j), "  ";
        FinPara;
        Escribir "";
    FinPara;
FinProceso
```

---

## Ejemplo completo — Promedio y mayor nota

```
Proceso AnalisisNotas
    Definir notas(10) Como Real;
    Definir n, i Como Entero;
    Definir suma, promedio, mayor Como Real;

    Escribir "¿Cuántas notas? (máx 10): ";
    Leer n;

    // Cargar
    Para i <- 1 Hasta n Hacer
        Escribir Sin Saltar "Nota ", i, ": ";
        Leer notas(i);
    FinPara;

    // Calcular promedio y mayor
    suma <- 0;
    mayor <- notas(1);
    Para i <- 1 Hasta n Hacer
        suma <- suma + notas(i);
        Si notas(i) > mayor Entonces
            mayor <- notas(i);
        FinSi;
    FinPara;

    promedio <- suma / n;
    Escribir "Promedio: ", promedio;
    Escribir "Mayor nota: ", mayor;
FinProceso
```

---

## Arreglos en SubProcesos

Los arreglos se pasan **por referencia** a los [[15 - SubProcesos y Funciones|SubProcesos]] por defecto. Esto significa que la función puede modificar el arreglo original:

```
// Subproceso que recibe un arreglo
SubProceso resultado <- Promedio(datos, n)
    Definir i Como Entero;
    Definir suma Como Real;
    suma <- 0;
    Para i <- 1 Hasta n Hacer
        suma <- suma + datos(i);
    FinPara;
    resultado <- suma / n;
FinSubProceso

Proceso Principal
    Dimension mis_datos(5);
    Definir i Como Entero;
    Para i <- 1 Hasta 5 Hacer
        Leer mis_datos(i);
    FinPara;
    Escribir "Promedio: ", Promedio(mis_datos, 5);
FinProceso
```

---

## Ordenamiento — Burbuja

Ejemplo clásico de algoritmo sobre arreglos:

```
Proceso OrdenarBurbuja
    Definir arr(10) Como Entero;
    Definir n, i, j, temp Como Entero;
    Leer n;
    Para i <- 1 Hasta n Hacer
        Leer arr(i);
    FinPara;

    // Ordenar
    Para i <- 1 Hasta n-1 Hacer
        Para j <- 1 Hasta n-i Hacer
            Si arr(j) > arr(j+1) Entonces
                temp <- arr(j);
                arr(j) <- arr(j+1);
                arr(j+1) <- temp;
            FinSi;
        FinPara;
    FinPara;

    Para i <- 1 Hasta n Hacer
        Escribir arr(i);
    FinPara;
FinProceso
```

---

## Resumen de sintaxis

| Operación | Sintaxis |
|---|---|
| Declarar vector | `Dimension arr(n);` |
| Declarar matriz | `Dimension mat(f, c);` |
| Asignar a posición | `arr(i) <- valor;` |
| Leer en posición | `Leer arr(i);` |
| Escribir posición | `Escribir arr(i);` |
| Recorrer vector | `Para i <- 1 Hasta n Hacer` |
| Recorrer matriz | `Para i <- 1 Hasta f Hacer` + `Para j <- 1 Hasta c Hacer` |

---

## Relación con otros temas

- [[11 - Lazo Para]] — estructura natural para recorrer arreglos
- [[03 - Tipos de Datos]] — el arreglo almacena valores de un mismo tipo
- [[04 - Variables e Identificadores]] — el nombre del arreglo sigue las reglas de identificadores
- [[07 - Condicional Si–Entonces]] — búsqueda y clasificación dentro de arreglos
- [[15 - SubProcesos y Funciones]] — arreglos como parámetros (se pasan por referencia)

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/11-Lazo-Para">← 11 — Lazo Para</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/13-Funciones-Matematicas">13 — Funciones Matemáticas →</a>
</div>

<p class="credit-line">Creado con Quartz v4.5.2 © 2026 por: Alexis Carrillo | Círculo Interno • EvoClub</p>
