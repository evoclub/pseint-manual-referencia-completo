---
title: "05 — Expresiones y Operadores"
aliases:
  - Operadores PSeInt
  - Expresiones PSeInt
  - Operadores lógicos
  - Operadores relacionales
tags:
  - pseint
  - operadores
  - expresiones
created: 2026-03-26
version: "pseint-20250218"
---

# 05 — Expresiones y Operadores

← [[04-Variables-e-Identificadores]] | [[00-Indice-Principal]] | Siguiente: [[06-Entrada-y-Salida]] →

---

> [!info] Concepto clave
> Una **expresión** es una combinación de [[04-Variables-e-Identificadores|variables]], constantes, operadores y funciones que produce un valor. Las expresiones se usan en [[04-Variables-e-IdentificadoresAsignacion-operador|asignaciones]], condiciones y salidas.

---

## Operadores Relacionales

Comparan dos valores y producen un resultado de [[03-Tipos-de-DatosTipo-Logico|tipo Lógico]] (`Verdadero` o `Falso`).

| Operador | Significado | Ejemplo | Resultado |
|---|---|---|---|
| `>` | Mayor que | `3 > 2` | `Verdadero` |
| `<` | Menor que | `2 < 5` | `Verdadero` |
| `=` | Igual que | `4 = 3` | `Falso` |
| `<>` | Distinto de | `4 <> 3` | `Verdadero` |
| `<=` | Menor o igual que | `3 <= 3` | `Verdadero` |
| `>=` | Mayor o igual que | `5 >= 6` | `Falso` |

> [!warning] `=` es comparación, no asignación
> En PSeInt, el signo `=` **compara** valores. Para **asignar**, siempre se usa `<-` (ver [[04-Variables-e-Identificadores]]).

```
// Correcto
Si edad = 18 Entonces ...      // compara
edad <- 18;                    // asigna
```

---

## Operadores Lógicos

Operan sobre valores [[03-Tipos-de-DatosTipo-Logico|Lógicos]] y producen un resultado Lógico.

| Operador | Sinónimos | Significado | Descripción |
|---|---|---|---|
| `&` | `Y`, `AND` | Conjunción (Y) | Verdadero solo si **ambos** son verdaderos |
| `\|` | `O`, `OR` | Disyunción (O) | Verdadero si **al menos uno** es verdadero |
| `~` | `NO`, `NOT` | Negación (NO) | Invierte el valor lógico |

```
// Ejemplos
(7 > 4) & (2 = 2)       // Verdadero Y Verdadero = Verdadero
(1 = 2) | (3 = 3)       // Falso O Verdadero = Verdadero
~(2 < 5)                // NO Verdadero = Falso
```

### Tabla de verdad — `&` (Y)

| A | B | A & B |
|---|---|---|
| V | V | V |
| V | F | F |
| F | V | F |
| F | F | F |

### Tabla de verdad — `|` (O)

| A | B | A \| B |
|---|---|---|
| V | V | V |
| V | F | V |
| F | V | V |
| F | F | F |

---

## Operadores Algebraicos

| Operador | Significado | Ejemplo |
|---|---|---|
| `+` | Suma | `total <- cant1 + cant2` |
| `-` | Resta | `stock <- disp - venta` |
| `*` | Multiplicación | `area <- base * altura` |
| `/` | División real | `porc <- 100 * parte / total` |
| `^` | Potenciación | `sup <- radio ^ 2` |
| `%` o `MOD` | Módulo (resto de división entera) | `resto <- num MOD div` |

```
// Ejemplos prácticos
suma <- a + b;
diferencia <- a - b;
producto <- a * b;
cociente <- a / b;
potencia <- 2 ^ 10;          // 1024
residuo <- 17 MOD 5;         // 2
```

---

## Jerarquía de operadores

Las operaciones se evalúan en este orden (de mayor a menor prioridad):

| Prioridad | Operadores |
|---|---|
| 1 (mayor) | `^` (potenciación) |
| 2 | `*`, `/`, `%`, `MOD` |
| 3 | `+`, `-` |
| 4 | `>`, `<`, `=`, `<>`, `<=`, `>=` |
| 5 | `~`, `NO` |
| 6 | `&`, `Y`, `AND` |
| 7 (menor) | `\|`, `O`, `OR` |

> [!tip] Usar paréntesis
> Siempre que haya duda sobre el orden de evaluación, usa **paréntesis** `( )` para forzar el orden deseado:
> ```
> resultado <- (a + b) * (c - d);
> ```

---

## Expresiones mixtas — ejemplos

```
// Condición compuesta
Si (edad >= 18) & (edad <= 65) Entonces
    Escribir "En edad laboral";
FinSi;

// Expresión con múltiples operadores
discriminante <- (b ^ 2) - (4 * a * c);

// Uso de MOD para saber si un número es par
Si numero MOD 2 = 0 Entonces
    Escribir "Es par";
SiNo
    Escribir "Es impar";
FinSi;

// Expresión lógica con negación
Si ~aprobado Entonces
    Escribir "Debe recuperar";
FinSi;
```

---

## Funciones en expresiones

Las [[13-Funciones-Matematicas]] y [[14-Funciones-de-Cadena]] también son parte de las expresiones:

```
hipotenusa <- RC(cateto1 ^ 2 + cateto2 ^ 2);
nombreMay <- Mayusculas(nombre);
longPalabra <- Longitud(palabra);
```

---

## Relación con otros temas

- [[04-Variables-e-Identificadores]] — las variables son operandos de las expresiones
- [[03-Tipos-de-Datos]] — el tipo del resultado depende de los operandos
- [[07-Condicional-Si-Entonces]] — usa expresiones lógicas como condiciones
- [[09-Lazo-Mientras]] — usa expresiones lógicas como condición del ciclo
- [[13-Funciones-Matematicas]] — funciones usables dentro de expresiones numéricas
- [[14-Funciones-de-Cadena]] — funciones usables dentro de expresiones de texto

---

← [[04-Variables-e-Identificadores]] | [[00-Indice-Principal]] | Siguiente: [[06-Entrada-y-Salida]] →
