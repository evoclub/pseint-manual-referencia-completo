---
title: "11 — Lazo Para"
aliases:
  - Para PSeInt
  - For PSeInt
  - Ciclo Para
  - Con Paso
tags:
  - pseint
  - para
  - ciclos
  - estructuras-de-control
created: 2026-03-26
version: "pseint-20250218"
---

# 11 — Lazo Para

← [[10 - Lazo Repetir–Hasta Que]] | [[00 - Índice Principal]] | Siguiente: [[12 - Arreglos]] →

---

> [!info] Concepto clave
> El lazo `Para` ejecuta un bloque de instrucciones un **número determinado de veces**, controlado por una variable contadora que se incrementa (o decrementa) automáticamente.

---

## Sintaxis

```
Para <variable> <- <inicial> Hasta <final> Con Paso <paso> Hacer
    <instrucciones>
FinPara
```

La cláusula `Con Paso` es **opcional**. Si se omite, el paso por defecto es **1**.

```
// Sin Con Paso (incremento de 1)
Para i <- 1 Hasta 10 Hacer
    Escribir i;
FinPara
```

---

## Flujo de ejecución

```
variable <- inicial
        │
        ▼
¿variable <= final?
    │         │
   Sí         No → termina
    │
    ▼
Ejecutar cuerpo
    │
    ▼
variable <- variable + paso
    │
    └──────── (volver a evaluar)
```

---

## Ejemplo básico — Del 1 al 10

```
Proceso Del1Al10
    Definir i Como Entero;
    Para i <- 1 Hasta 10 Hacer
        Escribir i;
    FinPara;
FinProceso
```

---

## Ejemplo — Con paso personalizado

```
Proceso NumerosPares
    Definir i Como Entero;
    Escribir "Números pares del 2 al 20:";
    Para i <- 2 Hasta 20 Con Paso 2 Hacer
        Escribir Sin Saltar i, "  ";
    FinPara;
    Escribir "";
FinProceso
```

---

## Ejemplo — Cuenta regresiva (paso negativo)

```
Proceso CuentaRegresiva
    Definir i Como Entero;
    Para i <- 10 Hasta 1 Con Paso -1 Hacer
        Escribir i;
    FinPara;
    Escribir "¡Despegue!";
FinProceso
```

---

## Ejemplo — Suma de 1 a N

```
Proceso SumaHastaN
    Definir n, i, suma Como Entero;
    Escribir "¿Hasta qué número sumar? ";
    Leer n;
    suma <- 0;
    Para i <- 1 Hasta n Hacer
        suma <- suma + i;
    FinPara;
    Escribir "Suma de 1 a ", n, " = ", suma;
FinProceso
```

---

## Uso con Arreglos — carga y recorrido

El uso más frecuente de `Para` es para cargar y procesar [[12 - Arreglos]]:

```
Proceso CargarYMostrar
    Definir notas(5) Como Real;
    Definir i Como Entero;

    // Cargar
    Para i <- 1 Hasta 5 Hacer
        Escribir Sin Saltar "Nota ", i, ": ";
        Leer notas(i);
    FinPara;

    // Mostrar
    Escribir "Las notas son:";
    Para i <- 1 Hasta 5 Hacer
        Escribir "  Nota ", i, ": ", notas(i);
    FinPara;
FinProceso
```

---

## Para anidado — Matrices

Para recorrer [[12 - Arreglos|matrices]] (arreglos de 2 dimensiones):

```
Proceso RecorrerMatriz
    Definir mat(3, 3) Como Entero;
    Definir i, j Como Entero;

    // Cargar
    Para i <- 1 Hasta 3 Hacer
        Para j <- 1 Hasta 3 Hacer
            Escribir Sin Saltar "mat(", i, ",", j, "): ";
            Leer mat(i, j);
        FinPara;
    FinPara;

    // Mostrar
    Para i <- 1 Hasta 3 Hacer
        Para j <- 1 Hasta 3 Hacer
            Escribir Sin Saltar mat(i, j), "  ";
        FinPara;
        Escribir "";
    FinPara;
FinProceso
```

---

## Tablas de multiplicar

```
Proceso TablaMultiplicar
    Definir tabla, i Como Entero;
    Escribir "¿Tabla del? ";
    Leer tabla;
    Para i <- 1 Hasta 10 Hacer
        Escribir tabla, " x ", i, " = ", tabla * i;
    FinPara;
FinProceso
```

---

## Comparación con otros lazos

| Lazo | Cuándo usarlo |
|---|---|
| [[11 - Lazo Para\|Para]] | Número de iteraciones **conocido de antemano** |
| [[09 - Lazo Mientras\|Mientras]] | Número de iteraciones **desconocido**, condición al inicio |
| [[10 - Lazo Repetir–Hasta Que\|Repetir]] | Número de iteraciones **desconocido**, siempre ejecuta al menos una vez |

> [!tip] Regla práctica
> Si puedes decir *"repite exactamente N veces"*, usa `Para`. Si depende de los datos del usuario, usa `Mientras` o `Repetir`.

---

## Relación con otros temas

- [[12 - Arreglos]] — `Para` es la estructura natural para recorrer arreglos
- [[05 - Expresiones y Operadores]] — `inicial`, `final` y `paso` son expresiones numéricas
- [[04 - Variables e Identificadores]] — la variable contadora debe ser de tipo numérico
- [[06 - Entrada y Salida]] — combinado con `Leer` para cargar datos
- [[15 - SubProcesos y Funciones]] — `Para` puede usarse dentro de subprocesos

---

← [[10 - Lazo Repetir–Hasta Que]] | [[00 - Índice Principal]] | Siguiente: [[12 - Arreglos]] →
