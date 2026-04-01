---
title: "13 — Funciones Matemáticas"
permalink: 13-Funciones-Matematicas
aliases:
  - Funciones matemáticas PSeInt
  - RC ABS SEN COS PSeInt
  - AZAR PI PSeInt
tags:
  - pseint
  - funciones
  - matematicas
  - predefinidas
created: 2026-03-26
version: "pseint-20250218"
---

# 13 — Funciones Matemáticas

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/12-Arreglos">← 12 — Arreglos</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/14-Funciones-de-Cadena">14 — Funciones de Cadena →</a>
</div>

---

> [!info] Concepto clave
> PSeInt incluye un conjunto de **funciones matemáticas predefinidas** que pueden usarse dentro de cualquier [[05 - Expresiones y Operadores|expresión]] numérica. Se escriben con su nombre seguido del argumento entre paréntesis.

---

## Tabla completa de funciones matemáticas

| Función | Significado | Ejemplo | Resultado |
|---|---|---|---|
| `RC(X)` | Raíz cuadrada de X | `RC(25)` | `5` |
| `ABS(X)` | Valor absoluto de X | `ABS(-7)` | `7` |
| `LN(X)` | Logaritmo natural (base e) de X | `LN(1)` | `0` |
| `EXP(X)` | Función exponencial eˣ | `EXP(1)` | `2.71828...` |
| `SEN(X)` | Seno de X (X en radianes) | `SEN(0)` | `0` |
| `COS(X)` | Coseno de X (X en radianes) | `COS(0)` | `1` |
| `TAN(X)` | Tangente de X (X en radianes) | `TAN(0)` | `0` |
| `ASEN(X)` | Arcoseno de X (resultado en radianes) | `ASEN(1)` | `π/2` |
| `ACOS(X)` | Arcocoseno de X (resultado en radianes) | `ACOS(1)` | `0` |
| `ATAN(X)` | Arcotangente de X (resultado en radianes) | `ATAN(1)` | `π/4` |
| `TRUNC(X)` | Parte entera de X (trunca hacia cero) | `TRUNC(3.9)` | `3` |
| `REDON(X)` | Entero más cercano a X (redondea) | `REDON(3.5)` | `4` |
| `AZAR(X)` | Entero aleatorio entre 0 y X−1 | `AZAR(6)` | Entre `0` y `5` |

---

## Constante PI

Disponible desde la versión `20130331`:

```
PI     // ≈ 3.14159265358979...
```

```
Proceso ConstantePI
    Escribir "El valor de PI es: ", PI;
FinProceso
```

---

## Ejemplos por función

### RC — Raíz cuadrada

```
Proceso HipotenulaRectangulo
    Definir cateto1, cateto2, hipotenusa Como Real;
    Escribir "Cateto 1: ";  Leer cateto1;
    Escribir "Cateto 2: ";  Leer cateto2;
    hipotenusa <- RC(cateto1 ^ 2 + cateto2 ^ 2);
    Escribir "Hipotenusa: ", hipotenusa;
FinProceso
```

### ABS — Valor absoluto

```
Proceso DiferenciaAbsoluta
    Definir a, b Como Real;
    Leer a, b;
    Escribir "Diferencia absoluta: ", ABS(a - b);
FinProceso
```

### TRUNC vs REDON — Truncar y redondear

```
Proceso TruncarRedondear
    Definir x Como Real;
    x <- 3.7;
    Escribir "TRUNC(3.7) = ", TRUNC(x);    // 3
    Escribir "REDON(3.7) = ", REDON(x);    // 4

    x <- 3.2;
    Escribir "TRUNC(3.2) = ", TRUNC(x);    // 3
    Escribir "REDON(3.2) = ", REDON(x);    // 3
FinProceso
```

> [!note] Diferencia entre TRUNC y REDON
> - `TRUNC` siempre recorta hacia cero: `TRUNC(3.9) = 3`, `TRUNC(-3.9) = -3`
> - `REDON` redondea al entero más cercano: `REDON(3.5) = 4`, `REDON(3.4) = 3`

### AZAR — Números aleatorios

```
Proceso DadoVirtual
    Definir resultado Como Entero;
    // AZAR(6) genera entre 0 y 5, sumamos 1 para obtener 1-6
    resultado <- AZAR(6) + 1;
    Escribir "Resultado del dado: ", resultado;
FinProceso
```

```
// Número aleatorio entre A y B:
// AZAR(B - A + 1) + A
numero <- AZAR(100 - 50 + 1) + 50;   // entre 50 y 100
```

### SEN y COS — Trigonometría

```
Proceso Trigonometria
    Definir angulo_grados, angulo_rad Como Real;
    Escribir "Ángulo en grados: ";
    Leer angulo_grados;
    // Convertir grados a radianes
    angulo_rad <- angulo_grados * PI / 180;
    Escribir "Seno: ", SEN(angulo_rad);
    Escribir "Coseno: ", COS(angulo_rad);
    Escribir "Tangente: ", TAN(angulo_rad);
FinProceso
```

---

## Funciones dentro de expresiones

Las funciones pueden usarse directamente en cualquier [[05 - Expresiones y Operadores|expresión]]:

```
// Combinadas con operadores
area <- PI * radio ^ 2;
hipotenusa <- RC(a^2 + b^2);
potencia <- EXP(LN(x) * n);     // equivale a x^n

// En condiciones
Si ABS(error) < 0.001 Entonces
    Escribir "Convergió";
FinSi;

// En arreglos
Para i <- 1 Hasta n Hacer
    resultado(i) <- SEN(i * PI / n);
FinPara;
```

---

## Uso en SubProcesos

```
SubProceso resultado <- AreaCirculo(radio)
    resultado <- PI * radio ^ 2;
FinSubProceso

SubProceso resultado <- NumeroAleatorioEntre(minimo, maximo)
    resultado <- AZAR(maximo - minimo + 1) + minimo;
FinSubProceso
```

Ver [[15 - SubProcesos y Funciones]] para más detalles.

---

## Relación con otros temas

- [[05 - Expresiones y Operadores]] — las funciones son parte de las expresiones
- [[04 - Variables e Identificadores]] — los argumentos son variables o expresiones numéricas
- [[14 - Funciones de Cadena]] — funciones equivalentes para texto
- [[15 - SubProcesos y Funciones]] — se pueden encapsular en subprocesos propios
- [[03 - Tipos de Datos#Tipo Numérico|Tipo Numérico]] — todas las funciones matemáticas operan sobre números

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/12-Arreglos">← 12 — Arreglos</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/14-Funciones-de-Cadena">14 — Funciones de Cadena →</a>
</div>

<p class="credit-line">Creado con Quartz v4.5.2 © 2026 | Contribución: Alexis Carrillo | Círculo Interno • EvoClub</p>
