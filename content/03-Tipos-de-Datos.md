---
title: "03 — Tipos de Datos"
aliases:
  - Tipos de Datos PSeInt
  - Numerico Logico Caracter
tags:
  - pseint
  - tipos-de-datos
  - variables
created: 2026-03-26
version: "pseint-20250218"
---
\n
← [[02-Estructura-General]] | [[00-Indice-Principal]] | Siguiente: [[04-Variables-e-Identificadores]] →

---

> [!info] Concepto clave
> PSeInt maneja **tres tipos de datos fundamentales**: Numérico, Lógico y Carácter/Cadena. Cada [[04-Variables-e-Identificadores|variable]] tiene un tipo asociado y **no puede cambiar de tipo** durante la ejecución.

---

## Los tres tipos fundamentales

| Tipo | Palabras clave aceptadas | Descripción |
|---|---|---|
| **Numérico** | `Numerico`, `Numero`, `Entero`, `Real` | Enteros y decimales |
| **Lógico** | `Logico` | Solo `Verdadero` o `Falso` |
| **Carácter / Cadena** | `Caracter`, `Texto`, `Cadena` | Secuencias de caracteres |

---

## Tipo Numérico

Almacena números, tanto **enteros** como **decimales**.

```
Definir edad Como Entero;
Definir precio Como Real;
Definir cantidad Como Numerico;
```

> [!note] Separador decimal
> El punto `.` es el separador decimal en PSeInt: `3.14`, `2.5`, `0.001`
> No se usa la coma como en español coloquial.

**Constante especial:** `PI` ≈ 3.14159... (disponible desde versión `20130331`)

```
Proceso AreaCirculo
    Definir radio, area Como Real;
    Leer radio;
    area <- PI * radio ^ 2;
    Escribir "Área: ", area;
FinProceso
```

Ver también: [[13-Funciones-Matematicas]]

---

## Tipo Lógico

Solo puede tomar dos valores: `Verdadero` o `Falso`.

```
Definir aprobado Como Logico;
aprobado <- Verdadero;
```

Los [[05-Expresiones-y-OperadoresOperadores-Relacionales|operadores relacionales]] y [[05-Expresiones-y-OperadoresOperadores-Logicos|lógicos]] producen valores de tipo lógico:

```
Definir esMayor Como Logico;
esMayor <- (edad >= 18);   // Verdadero o Falso
```

Se usa principalmente en condiciones de [[07-Condicional-Si-Entonces]], [[09-Lazo-Mientras]] y [[10-Lazo-Repetir-Hasta-Que]].

---

## Tipo Carácter / Cadena

Almacena cero, uno o más caracteres arbitrarios. **No tienen longitud máxima**.

```
Definir nombre Como Texto;
Definir letra Como Caracter;
Definir mensaje Como Cadena;
```

Las constantes de cadena se escriben entre **comillas dobles** `"`:

```
nombre <- "Alex";
letra <- "A";
mensaje <- "Hola, mundo!";
```

> [!note] Lectura de tipos distintos como cadena
> Si se declara una variable como `Texto` y el usuario ingresa un número (`42`) o un valor lógico (`Verdadero`), se almacenará como la cadena `"42"` o `"Verdadero"`. Para convertir, ver [[14-Funciones-de-Cadena]].

---

## Declaración con `Definir`

```
Definir <variable> Como <TipoDeDato>;
Definir <var1>, <var2>, <var3> Como <TipoDeDato>;
```

```
// Ejemplos
Definir nombre Como Texto;
Definir edad Como Entero;
Definir promedio Como Real;
Definir aprobado Como Logico;
Definir a, b, c Como Entero;
```

---

## Sintaxis alternativa (Perfil Flexible)

Con [[17-Perfiles-de-Lenguaje|Sintaxis Flexible]] habilitada se pueden usar las palabras `Es` y `Son`:

```
x Es Real
a, b, c Son Cadenas
respuesta Es Logico
```

En modo flexible también es posible **omitir la declaración** — las variables se crean al momento de asignarles un valor por primera vez.

---

## Tipado fuerte en tiempo de ejecución

> [!important] Regla de tipado
> Una vez que una variable tiene un tipo, **no puede cambiar**. Si se intenta asignar un tipo incorrecto, se produce un **error en tiempo de ejecución**.

```
Definir numero Como Entero;
numero <- 42;         // ✅ correcto
numero <- "Hola";     // ❌ ERROR: tipo incorrecto
```

Para convertir entre tipos numérico y cadena, usar:
- `ConvertirANumero(cadena)` → ver [[14-Funciones-de-Cadena]]
- `ConvertirATexto(numero)` → ver [[14-Funciones-de-Cadena]]

---

## Arreglos de cualquier tipo

Los [[12-Arreglos]] pueden ser de cualquiera de los tres tipos:

```
Dimension notas(10);           // arreglo numérico
Dimension nombres(5);          // arreglo de texto
Dimension aprobados(10);       // arreglo lógico
```

---

## Resumen visual

```
TIPOS DE DATOS EN PSeInt
│
├── Numérico ──── Entero, Real, Numero, Numerico
│   └── Ejemplo: 42, 3.14, -7, 0.001
│
├── Lógico ────── Logico
│   └── Valores: Verdadero / Falso
│
└── Carácter ──── Caracter, Texto, Cadena
    └── Ejemplo: "Hola", "A", "", "123"
```

---

← [[02-Estructura-General]] | [[00-Indice-Principal]] | Siguiente: [[04-Variables-e-Identificadores]] →
