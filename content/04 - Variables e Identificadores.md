---
title: "04 — Variables e Identificadores"
aliases:
  - Variables PSeInt
  - Identificadores
  - Asignación PSeInt
tags:
  - pseint
  - variables
  - identificadores
  - asignacion
created: 2026-03-26
version: "pseint-20250218"
---

# 04 — Variables e Identificadores

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/03---Tipos-de-Datos">← 03 — Tipos de Datos</a>
  <a class="nav-pill nav-home" href="/00---Índice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/05---Expresiones-y-Operadores">05 — Expresiones y Operadores →</a>
</div>

---

> [!info] Concepto clave
> Una **variable** es un espacio con nombre donde se guarda un valor. Un **identificador** es el nombre de ese espacio. En PSeInt, la asignación se hace con la flecha `<-`, **no con** `=`.

---

## Identificadores — reglas de nombres

Un identificador es el nombre de una variable, proceso o subproceso.

| Regla | Detalle |
|---|---|
| Debe comenzar con... | Una **letra** |
| Puede contener... | Letras, números y guión bajo `_` |
| No puede contener... | Espacios, operadores, tildes, diéresis, ñ (salvo Sintaxis Flexible) |
| No puede coincidir con... | Palabras reservadas del lenguaje |

### Ejemplos válidos

```
A
total
Lado1
promedio_final
NombreYApellido
direccion_email
contador_1
```

### Ejemplos inválidos

```
1numero         // ❌ empieza con número
mi variable     // ❌ contiene espacio
Mientras        // ❌ es palabra reservada
año             // ❌ contiene ñ (en perfil estricto)
```

> [!tip] Con [[17 - Perfiles de Lenguaje|Sintaxis Flexible]] activada, sí se permiten tildes (`á`, `é`, etc.), diéresis y ñ en los identificadores.

---

## Declaración de variables — `Definir`

```
Definir <variable> Como <TipoDeDato>;
Definir <var1>, <var2>, ..., <varN> Como <TipoDeDato>;
```

Ver los tipos disponibles en [[03 - Tipos de Datos]].

```
Definir nombre Como Texto;
Definir edad Como Entero;
Definir promedio Como Real;
Definir aprobado Como Logico;
Definir a, b, resultado Como Entero;
```

> [!note] En [[17 - Perfiles de Lenguaje|Perfil Flexible]]
> No es necesario declarar variables con `Definir`. Se crean automáticamente al asignarles un valor por primera vez. En perfil estricto la declaración es **obligatoria**.

---

## Asignación — operador `<-`

La asignación guarda un valor en una variable:

```
<variable> <- <expresión>;
```

> [!warning] No se usa `=` para asignar
> En PSeInt, `=` es el **operador de comparación** (igual que). La asignación siempre usa `<-`.

```
// Asignación de constantes
contador <- 0;
nombre <- "Alex";
aprobado <- Verdadero;

// Asignación de expresiones
area <- base * altura;
promedio <- (nota1 + nota2 + nota3) / 3;
esMayor <- edad >= 18;
```

Al ejecutarse la asignación:
1. Se evalúa la **expresión** de la derecha.
2. El resultado se almacena en la **variable** de la izquierda.
3. El [[03 - Tipos de Datos|tipo]] de la variable y de la expresión deben coincidir.

---

## Ciclo de vida de una variable

```
Proceso EjemploVariables
    // 1. Declaración
    Definir contador Como Entero;
    Definir mensaje Como Texto;

    // 2. Asignación inicial
    contador <- 0;
    mensaje <- "Inicio";

    // 3. Uso y modificación
    Escribir mensaje, ": ", contador;
    contador <- contador + 1;

    // 4. Nuevo uso
    Escribir "Fin: ", contador;
FinProceso
```

---

## Constantes especiales

Aunque PSeInt no tiene una palabra clave `Constante`, hay valores predefinidos:

| Constante | Valor | Tipo |
|---|---|---|
| `Verdadero` | true | Lógico |
| `Falso` | false | Lógico |
| `PI` | 3.14159265... | Numérico |

```
area <- PI * radio ^ 2;     // PI es una constante predefinida
```

---

## Ejemplo completo

```
Proceso CalcularPromedio
    Definir nota1, nota2, nota3, promedio Como Real;
    Definir aprobado Como Logico;
    Definir mensaje Como Texto;

    Escribir "Ingrese tres notas:";
    Leer nota1, nota2, nota3;

    promedio <- (nota1 + nota2 + nota3) / 3;
    aprobado <- promedio >= 6.0;

    Si aprobado Entonces
        mensaje <- "APROBADO";
    SiNo
        mensaje <- "REPROBADO";
    FinSi;

    Escribir "Promedio: ", promedio;
    Escribir "Estado: ", mensaje;
FinProceso
```

---

## Relación con otros temas

- [[03 - Tipos de Datos]] — tipos válidos para las variables
- [[05 - Expresiones y Operadores]] — qué puede ir en el lado derecho de `<-`
- [[06 - Entrada y Salida]] — cómo leer valores desde el teclado hacia variables
- [[12 - Arreglos]] — variables que almacenan múltiples valores
- [[15 - SubProcesos y Funciones]] — paso de variables como parámetros

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/03---Tipos-de-Datos">← 03 — Tipos de Datos</a>
  <a class="nav-pill nav-home" href="/00---Índice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/05---Expresiones-y-Operadores">05 — Expresiones y Operadores →</a>
</div>

| Contribución: Alexis Carrillo | Círculo Interno • EvoClub | Creado con Quartz v4.5.2 © 2026
