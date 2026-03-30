---
title: "17 — Perfiles de Lenguaje"
aliases:
  - Perfiles PSeInt
  - Sintaxis flexible estricta
  - Configuración PSeInt
tags:
  - pseint
  - perfiles
  - configuracion
  - sintaxis
created: 2026-03-26
version: "pseint-20250218"
---
\n
← [[16-Comentarios]] | [[00-Indice-Principal]] | Siguiente: [[18-Exportacion-y-Herramientas]] →

---

> [!info] Concepto clave
> Los **perfiles de lenguaje** permiten configurar el **grado de rigor sintáctico** que PSeInt exige al alumno. Van desde una sintaxis muy flexible (casi lenguaje natural) hasta una sintaxis estricta similar a un lenguaje de programación real.

---

## Espectro de perfiles

```
FLEXIBLE ──────────────────────────────────── ESTRICTO
   │                                               │
   │  Sin declarar variables                       │  Definir obligatorio
   │  Sin punto y coma                             │  ; obligatorio
   │  Sinónimos y variantes                        │  Solo una sintaxis
   │  Coloquial, más natural                       │  Más cercano a código real
```

---

## Cómo acceder a la configuración

```
Configurar → Opciones del Lenguaje
```

Desde ahí se puede seleccionar el perfil y ajustar opciones específicas como:
- Declaración obligatoria de variables (`Definir`)
- Punto y coma obligatorio al final de instrucciones
- Aceptar sinónimos de palabras clave
- Funciones de cadena habilitadas
- Base de índices de arreglos (0 o 1)

---

## Perfil Flexible

El perfil más permisivo. Pensado para comenzar a aprender sin distracciones de sintaxis.

**Características:**
- Variables se crean al asignarles un valor (sin `Definir`)
- El punto y coma `;` es **opcional**
- Se aceptan sinónimos: `Algoritmo`/`Proceso`, `Mostrar`/`Escribir`, `Es`/`Como`, `Y`/`&`, etc.
- Nombres de variables pueden contener tildes y ñ
- Permite sintaxis más coloquial y natural

```
// Perfil FLEXIBLE — más coloquial
Algoritmo Suma
    Escribir "Ingrese dos números"
    Leer a, b
    resultado = a + b
    Mostrar "La suma es " resultado
FinAlgoritmo
```

---

## Perfil Estricto

El perfil más riguroso. Prepara al alumno para la transición a lenguajes reales.

**Características:**
- `Definir` **obligatorio** antes de usar cualquier variable
- Punto y coma `;` **obligatorio** al final de cada instrucción
- Solo se acepta la sintaxis oficial (sin sinónimos)
- Los identificadores no pueden tener tildes, diéresis ni ñ
- Más cercano a cómo funciona un lenguaje de programación real

```
// Perfil ESTRICTO — más formal
Proceso Suma
    Definir a, b, resultado Como Entero;
    Escribir "Ingrese dos números: ";
    Leer a, b;
    resultado <- a + b;
    Escribir "La suma es: ", resultado;
FinProceso
```

---

## Tabla comparativa

| Característica | Flexible | Estricto |
|---|---|---|
| Declaración de variables | Opcional | **Obligatoria** |
| Punto y coma `;` | Opcional | **Obligatorio** |
| Sinónimos (`Algoritmo`, `Mostrar`...) | Aceptados | Solo `Proceso`, `Escribir`... |
| Tildes y ñ en identificadores | Permitidas | No permitidas |
| Asignación `=` como alternativa a `<-` | Permitida | Solo `<-` |
| Funciones de cadena | Configurables | Configurables |
| Base de arreglos (0 o 1) | Configurable | Configurable |

---

## Perfiles intermedios

PSeInt ofrece **tres variantes de sintaxis flexible** para control más fino:
1. Completamente flexible
2. Flexible con declaración de variables
3. Flexible con punto y coma

---

## Perfiles institucionales incluidos

PSeInt incluye perfiles predefinidos para numerosas instituciones de Hispanoamérica. Algunos ejemplos:

| Perfil | Institución |
|---|---|
| `UTN-FRSN` | Universidad Tecnológica Nacional — FR San Nicolás |
| `UNSM-FISI` | Universidad Nacional de San Martín — FISI |
| `FIME-UANL` | UANL — Facultad de Ingeniería Mecánica |
| `TECSUP` | TECSUP (Perú) |
| `UNL` | Universidad Nacional del Litoral |
| `UCAD` | UCAD |
| `UVM-Hispano` | Universidad del Valle de México |
| `FACPYA-UANL` | UANL — FACPYA |

> [!tip] Perfiles de Argentina, Colombia, México, Perú y España
> Si tu institución no aparece, puedes crear un **perfil personalizado** o usar el perfil más cercano.

---

## Efecto en funciones de cadena y arreglos

La configuración del perfil también afecta:

- **Funciones de cadena** ([[14-Funciones-de-Cadena]]): deben estar habilitadas en el perfil para poder usar `Longitud`, `Subcadena`, etc.
- **Base de arreglos** ([[12-Arreglos]]): índice inicial puede ser `0` o `1` según el perfil

---

## Crear un perfil personalizado

En `Configurar → Opciones del Lenguaje → Personalizar`, se pueden ajustar individualmente:
- Cada regla sintáctica
- Qué funciones están disponibles
- Los sinónimos aceptados
- El nombre del perfil personalizado

---

## Recomendación pedagógica

> [!tip] Progresión recomendada en educación
> 1. **Inicio:** Perfil completamente flexible — el alumno se enfoca en la lógica
> 2. **Intermedio:** Activar declaración de variables — introduce el concepto de tipos
> 3. **Avanzado:** Perfil estricto — prepara para la transición a Python, Java, C, etc.

---

## Relación con otros temas

- [[02-Estructura-General]] — la palabra clave del proceso varía según el perfil
- [[04-Variables-e-Identificadores]] — si `Definir` es obligatorio depende del perfil
- [[12-Arreglos]] — la base de índices (0 o 1) depende del perfil
- [[14-Funciones-de-Cadena]] — las funciones de cadena deben estar habilitadas en el perfil
- [[16-Comentarios]] — los comentarios funcionan igual en todos los perfiles

---

← [[16-Comentarios]] | [[00-Indice-Principal]] | Siguiente: [[18-Exportacion-y-Herramientas]] →
