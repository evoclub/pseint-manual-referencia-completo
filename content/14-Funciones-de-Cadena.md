---
title: "14 — Funciones de Cadena"
aliases:
  - Funciones de cadena PSeInt
  - Longitud Subcadena Concatenar
  - Mayusculas Minusculas PSeInt
  - Funciones texto PSeInt
tags:
  - pseint
  - funciones
  - cadenas
  - texto
  - predefinidas
created: 2026-03-26
version: "pseint-20250218"
---

# 14 — Funciones de Cadena

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/13-Funciones-Matematicas">← 13 — Funciones Matemáticas</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/15-SubProcesos-y-Funciones">15 — SubProcesos y Funciones →</a>
</div>

---

> [!info] Disponibilidad
> Las funciones de cadena están disponibles desde la versión `20121010` (octubre 2012). Requieren que el perfil de lenguaje las tenga habilitadas. Si aparecen errores, revisar `Configurar → Opciones del Lenguaje`.

---

## Tabla completa de funciones de cadena

| Función               | Descripción                           | Ejemplo                  | Resultado |
| --------------------- | ------------------------------------- | ------------------------ | --------- |
| `Longitud(S)`         | Cantidad de caracteres de la cadena S | `Longitud("Hola")`       | `4`       |
| `Mayusculas(S)`       | Copia de S en mayúsculas              | `Mayusculas("hola")`     | `"HOLA"`  |
| `Minusculas(S)`       | Copia de S en minúsculas              | `Minusculas("HOLA")`     | `"hola"`  |
| `Subcadena(S,X,Y)`    | Parte de S desde posición X hasta Y   | `Subcadena("Hola",1,2)`  | `"Ho"`    |
| `Concatenar(S1,S2)`   | Une S1 y S2 en una nueva cadena       | `Concatenar("Ho","la")`  | `"Hola"`  |
| `ConvertirANumero(S)` | Convierte cadena numérica a número    | `ConvertirANumero("42")` | `42`      |
| `ConvertirATexto(N)`  | Convierte número a cadena             | `ConvertirATexto(42)`    | `"42"`    |

---

## `Longitud(S)` — largo de una cadena

```
Proceso EjemploLongitud
    Definir frase Como Texto;
    Escribir "Ingrese una frase: ";
    Leer frase;
    Escribir "La frase tiene ", Longitud(frase), " caracteres.";
FinProceso
```

---

## `Mayusculas(S)` y `Minusculas(S)` — conversión de caso

```
Proceso ConvertirCaso
    Definir nombre Como Texto;
    Leer nombre;
    Escribir "Mayúsculas: ", Mayusculas(nombre);
    Escribir "Minúsculas: ", Minusculas(nombre);
FinProceso
```

> [!tip] Uso en comparaciones
> Para comparar cadenas **sin importar si son mayúsculas o minúsculas**, normalizar primero:
> ```
> Si Minusculas(respuesta) = "si" Entonces
>     Escribir "Confirmado";
> FinSi;
> ```

---

## `Subcadena(S, X, Y)` — extraer parte de una cadena

```
// Extraer los primeros 3 caracteres
inicial <- Subcadena(nombre, 1, 3);

// Extraer el último carácter
ultimo <- Subcadena(texto, Longitud(texto), Longitud(texto));

// Recorrer letra por letra
Para i <- 1 Hasta Longitud(frase) Hacer
    letra <- Subcadena(frase, i, i);
    Escribir letra;
FinPara;
```

> [!warning] Base de índices
> La posición de inicio depende del [[17 - Perfiles de Lenguaje|perfil de lenguaje]]:
> - **Perfil estándar:** índices desde **1** (la primera letra es la posición 1)
> - **Perfil alternativo:** índices desde **0** (la primera letra es la posición 0)

---

## `Concatenar(S1, S2)` — unir cadenas

```
Proceso ConcatenarNombre
    Definir nombre, apellido, completo Como Texto;
    Leer nombre;
    Leer apellido;
    completo <- Concatenar(nombre, Concatenar(" ", apellido));
    Escribir "Nombre completo: ", completo;
FinProceso
```

> [!note] Alternativa con `Escribir`
> Para mostrar texto concatenado, `Escribir` ya acepta múltiples valores separados por coma:
> ```
> Escribir "Hola, ", nombre, " ", apellido;
> ```
> `Concatenar` es útil cuando necesitas **guardar** el resultado en una variable.

---

## `ConvertirANumero(S)` y `ConvertirATexto(N)` — conversión de tipos

```
Proceso ConversionTipos
    Definir numStr Como Texto;
    Definir num Como Real;

    numStr <- "3.14";
    num <- ConvertirANumero(numStr);
    Escribir "El número es: ", num;
    Escribir "El doble es: ", num * 2;

    // Convertir número a texto para concatenar
    Definir resultado Como Texto;
    resultado <- Concatenar("El resultado es: ", ConvertirATexto(num * 2));
    Escribir resultado;
FinProceso
```

---

## Ejemplo completo — Contar vocales

```
Proceso ContarVocales
    Definir frase, vocales Como Texto;
    Definir i, j, cantVocales Como Entero;

    Escribir "Ingrese una frase: ";
    Leer frase;
    frase <- Minusculas(frase);
    vocales <- "aeiouáéíóúü";
    cantVocales <- 0;

    Para i <- 1 Hasta Longitud(frase) Hacer
        Para j <- 1 Hasta Longitud(vocales) Hacer
            Si Subcadena(frase, i, i) = Subcadena(vocales, j, j) Entonces
                cantVocales <- cantVocales + 1;
            FinSi;
        FinPara;
    FinPara;

    Escribir "La frase contiene ", cantVocales, " vocal(es).";
FinProceso
```

---

## Ejemplo — Invertir una cadena

```
Proceso InvertirCadena
    Definir original, invertida Como Texto;
    Definir i Como Entero;

    Escribir "Ingrese una palabra: ";
    Leer original;
    invertida <- "";

    Para i <- Longitud(original) Hasta 1 Con Paso -1 Hacer
        invertida <- Concatenar(invertida, Subcadena(original, i, i));
    FinPara;

    Escribir "Invertida: ", invertida;
FinProceso
```

---

## Comparación de cadenas

PSeInt es **sensible a mayúsculas** al comparar cadenas:

```
Si "Hola" = "hola" Entonces    // Falso (diferente caso)
    Escribir "Iguales";
FinSi;

// Para comparar sin distinción de caso:
Si Minusculas(cad1) = Minusculas(cad2) Entonces
    Escribir "Son iguales (sin importar caso)";
FinSi;
```

---

## Relación con otros temas

- [[03 - Tipos de Datos#Tipo Carácter / Cadena|Tipo Carácter/Cadena]] — el tipo de dato que manejan estas funciones
- [[05 - Expresiones y Operadores]] — las funciones se usan dentro de expresiones
- [[11 - Lazo Para]] — recorrer una cadena letra por letra
- [[07 - Condicional Si–Entonces]] — comparar subcadenas para tomar decisiones
- [[10 - Lazo Repetir–Hasta Que]] — validar texto ingresado por el usuario
- [[13 - Funciones Matemáticas]] — funciones equivalentes para números
- [[15 - SubProcesos y Funciones]] — encapsular operaciones de cadena en subprocesos

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/13-Funciones-Matematicas">← 13 — Funciones Matemáticas</a>
  <a class="nav-pill nav-home" href="/00-Indice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/15-SubProcesos-y-Funciones">15 — SubProcesos y Funciones →</a>
</div>

<p class="credit-line">Creado con Quartz v4.5.2 © 2026 | Contribución: Alexis Carrillo | Círculo Interno • EvoClub</p>
