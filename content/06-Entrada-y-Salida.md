---
title: "06 — Entrada y Salida"
aliases:
  - Leer Escribir PSeInt
  - Entrada salida PSeInt
  - Instrucciones E/S
tags:
  - pseint
  - entrada
  - salida
  - leer
  - escribir
created: 2026-03-26
version: "pseint-20250218"
---

# 06 — Entrada y Salida

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/05-Expresiones-y-Operadores">← 05 — Expresiones y Operadores</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/07-Condicional-Si-Entonces">07 — Condicional Si–Entonces →</a>
</div>

---

> [!info] Concepto clave
> Las instrucciones de **entrada** (`Leer`) y **salida** (`Escribir`) son el canal de comunicación entre el algoritmo y el usuario. Sin ellas, el programa no puede recibir datos ni mostrar resultados.

---

## Entrada — `Leer`

Lee uno o más valores desde el teclado y los asigna a las [[04 - Variables e Identificadores|variables]] indicadas.

```
Leer <variable1>, <variable2>, ..., <variableN>;
```

```
// Leer un solo valor
Leer edad;

// Leer múltiples valores (el usuario los ingresa uno por uno)
Leer nombre, edad, promedio;

// Leer en un arreglo
Leer notas(1);
```

> [!note] Comportamiento
> - Cada variable recibe el valor que el usuario escribe y presiona Enter.
> - Si se leen múltiples variables, el usuario ingresa cada valor por separado.
> - El tipo del valor ingresado debe coincidir con el [[03 - Tipos de Datos|tipo de la variable]].

---

## Salida — `Escribir`

Muestra en pantalla los valores de una o más expresiones.

```
Escribir <expr1>, <expr2>, ..., <exprN>;
```

```
// Texto literal
Escribir "¡Hola, mundo!";

// Variable
Escribir nombre;

// Combinación de texto y variable
Escribir "Tu nombre es: ", nombre;

// Expresión calculada
Escribir "El área es: ", base * altura;

// Múltiples valores
Escribir "Suma de ", a, " y ", b, " es ", a + b;
```

### Sinónimos de `Escribir`

Dependiendo del [[17 - Perfiles de Lenguaje|perfil de lenguaje]] activo:

| Palabra | Disponibilidad |
|---|---|
| `Escribir` | Siempre |
| `Imprimir` | Perfil flexible |
| `Mostrar` | Perfil flexible |
| `Visualizar` | Perfil flexible |

---

## `Sin Saltar` — salida en la misma línea

La cláusula `Sin Saltar` evita el salto de línea automático al final del `Escribir`:

```
Escribir Sin Saltar "Ingrese su edad: ";
Leer edad;
Escribir "Tu edad es: ", edad;
```

Salida en consola:
```
Ingrese su edad: 25
Tu edad es: 25
```

> [!tip] Uso típico de `Sin Saltar`
> Se usa para que el cursor quede en la misma línea del mensaje de solicitud, dando una apariencia más limpia al pedir datos al usuario.

---

## Limpiar Pantalla

Borra todo el contenido de la consola:

```
Limpiar Pantalla;
```

Útil en menús interactivos o para mejorar la presentación visual del algoritmo.

---

## Ejemplo completo — Calculadora de área

```
Proceso AreaRectangulo
    Definir base, altura, area Como Real;

    Limpiar Pantalla;
    Escribir "=== Calculadora de Área ===";
    Escribir Sin Saltar "Ingrese la base: ";
    Leer base;
    Escribir Sin Saltar "Ingrese la altura: ";
    Leer altura;

    area <- base * altura;

    Escribir "El área del rectángulo es: ", area;
FinProceso
```

---

## Ejemplo — Lectura múltiple

```
Proceso PromedioDeTresNotas
    Definir n1, n2, n3, promedio Como Real;

    Escribir "Ingrese las tres notas:";
    Leer n1;
    Leer n2;
    Leer n3;

    promedio <- (n1 + n2 + n3) / 3;
    Escribir "Promedio: ", promedio;
FinProceso
```

---

## Lectura dentro de ciclos

`Leer` es especialmente útil dentro de [[09 - Lazo Mientras]], [[10 - Lazo Repetir–Hasta Que]] y [[11 - Lazo Para]] para cargar datos en [[12 - Arreglos]]:

```
Proceso CargarArreglo
    Definir datos(5) Como Entero;
    Definir i Como Entero;

    Para i <- 1 Hasta 5 Hacer
        Escribir Sin Saltar "Dato ", i, ": ";
        Leer datos(i);
    FinPara;

    Escribir "Datos ingresados correctamente.";
FinProceso
```

---

## Salida de valores de cadena y conversión

Para mostrar números como texto o viceversa, ver [[14 - Funciones de Cadena]]:

```
Definir numero Como Real;
numero <- 3.14;
Escribir "El número es: ", ConvertirATexto(numero);
```

---

## Relación con otros temas

- [[04 - Variables e Identificadores]] — las variables que `Leer` llena y `Escribir` muestra
- [[03 - Tipos de Datos]] — el tipo de dato determina qué se puede leer/escribir
- [[05 - Expresiones y Operadores]] — `Escribir` acepta expresiones completas
- [[11 - Lazo Para]] — combinación típica de `Leer` en ciclos
- [[12 - Arreglos]] — `Leer` y `Escribir` con arreglos indexados
- [[14 - Funciones de Cadena]] — conversión entre tipos para la salida

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/05-Expresiones-y-Operadores">← 05 — Expresiones y Operadores</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/07-Condicional-Si-Entonces">07 — Condicional Si–Entonces →</a>
</div>

<p class="credit-line">Creado con Quartz v4.5.2 © 2026 | Contribución: Alexis Carrillo | Círculo Interno • EvoClub</p>
