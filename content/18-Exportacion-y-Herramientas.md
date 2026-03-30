---
title: "18 — Exportación y Herramientas"
aliases:
  - Exportación PSeInt
  - Diagrama de flujo PSeInt
  - Herramientas PSeInt
  - Exportar a Python Java C
tags:
  - pseint
  - exportacion
  - diagrama-de-flujo
  - herramientas
created: 2026-03-26
version: "pseint-20250218"
---

# 18 — Exportación y Herramientas

← [[17-Perfiles-de-Lenguaje]] | [[00-Indice-Principal]]

---

> [!info] Concepto clave
> PSeInt ofrece herramientas adicionales que van más allá de la escritura y ejecución del pseudocódigo: generación de **diagramas de flujo**, **exportación a lenguajes reales** y funciones de **depuración** que facilitan el aprendizaje.

---

## Diagrama de Flujo

PSeInt genera diagramas de flujo **automáticamente** a partir del pseudocódigo. La sincronización es bidireccional:

- Editar el **pseudocódigo** → el diagrama se actualiza
- Editar el **diagrama** → el pseudocódigo se actualiza

### Tipos de representación disponibles

| Tipo | Descripción |
|---|---|
| **Nassi-Shneiderman** | Diagramas de bloques anidados sin flechas. Muy visual para estructuras de control |
| **Clásico** | Rombos para decisiones, rectángulos para procesos, flechas de flujo |
| **Coloreado** | Variante del clásico donde cada tipo de estructura usa un color distinto |

### Acceso

```
Menú → Ver → Diagrama de Flujo
```

O mediante el botón de la barra de herramientas.

---

## Exportación a lenguajes de programación

PSeInt puede exportar el pseudocódigo al código equivalente en varios lenguajes reales.

```
Archivo → Exportar → [Lenguaje destino]
```

### Lenguajes soportados

| Lenguaje | Notas |
|---|---|
| **C** | Código C estándar compatible con GCC |
| **C++** | Incluye exportación de constantes `Verdadero`/`Falso` |
| **C#** | Compatible con .NET |
| **Java** | Genera clase con método `main` |
| **JavaScript** | Código JS ejecutable en navegador o Node.js |
| **PHP** | Scripts PHP |
| **Python** | Compatible con Python 3 |
| **Visual Basic .NET** | VB.NET |
| **Matlab** | Scripts Matlab/Octave |

> [!warning] El código exportado es una aproximación
> La exportación genera código funcional como punto de partida, pero puede requerir ajustes manuales, especialmente con:
> - Tipos de datos avanzados
> - Funciones específicas del sistema
> - Manejo de cadenas complejas

### Ejemplo — mismo algoritmo exportado a Python y C

**PSeInt:**
```
Proceso Factorial
    Definir n, resultado Como Entero;
    Leer n;
    resultado <- 1;
    Mientras n > 1 Hacer
        resultado <- resultado * n;
        n <- n - 1;
    FinMientras;
    Escribir resultado;
FinProceso
```

**Python (exportado):**
```python
n = int(input())
resultado = 1
while n > 1:
    resultado = resultado * n
    n = n - 1
print(resultado)
```

**C (exportado):**
```c
#include <stdio.h>
int main() {
    int n, resultado;
    scanf("%d", &n);
    resultado = 1;
    while (n > 1) {
        resultado = resultado * n;
        n = n - 1;
    }
    printf("%d\n", resultado);
    return 0;
}
```

---

## Ejecución paso a paso

Una de las herramientas más poderosas para aprender y depurar:

| Función | Descripción |
|---|---|
| **Ejecutar normal** | Corre el algoritmo completo |
| **Ejecutar paso a paso** | Ejecuta una instrucción a la vez |
| **Pausar** | Detiene la ejecución en cualquier punto |
| **Ver variables** | Panel lateral con el valor actual de cada variable |

### Funciones adicionales de ejecución

- **Modificar algoritmo en caliente:** puedes editar el código y los cambios se reflejan en la próxima ejecución sin necesidad de reingresar los datos
- **Modificar datos selectivamente:** puedes cambiar el valor de una variable específica durante una ejecución ya finalizada para analizar cómo cambia el resultado

---

## Archivos de ejercicios especiales

PSeInt puede abrir archivos `.psc` especiales que contienen:

- **Plantilla de pseudocódigo** — estructura base que el alumno debe completar
- **Enunciado del problema** — la consigna visible en el entorno
- **Casos de prueba** — entradas y salidas esperadas

PSeInt verifica automáticamente si el algoritmo del alumno produce los resultados correctos para cada caso de prueba. Es útil para docentes que quieren que los alumnos autoevalúen sus algoritmos.

---

## Editor de código

El editor de PSeInt incluye:

| Característica | Descripción |
|---|---|
| **Autocompletado** | Sugiere palabras clave y estructuras al escribir |
| **Plantillas de comando** | Los botones del panel lateral insertan la estructura completa |
| **Ayuda rápida** | Muestra la descripción de la estructura al escribirla |
| **Resaltado de sintaxis** | Colorea palabras clave, cadenas, comentarios |
| **Marcado de errores** | Los errores de sintaxis se marcan en el editor Y en el diagrama |
| **Drag & drop de texto** | Se puede mover fragmentos seleccionados arrastrando |
| **Fuente configurable** | Fuente por defecto: `Inconsolata`; tamaño configurable para impresión |

---

## Impresión

```
Archivo → Imprimir
```

- Se puede imprimir el código fuente
- El tamaño de fuente para impresión es configurable
- Se evitan páginas en blanco en las impresiones

---

## Versión portátil

Disponible para Windows y Linux. No requiere instalación — solo descomprimir y ejecutar. Ideal para:
- Aulas con restricciones de instalación
- Equipos compartidos
- Llevar PSeInt en una memoria USB

---

## Configuración del entorno

Opciones destacadas de configuración:

```
Configurar → Opciones del Lenguaje    → Perfil sintáctico (ver [[17-Perfiles-de-Lenguaje]])
Configurar → Colores del editor        → Personalizar colores de sintaxis
Configurar → Diagrama de flujo         → Tipo de diagrama y colores por estructura
Configurar → Fuente                    → Tamaño y tipo de fuente del editor
```

---

## Recursos oficiales

| Recurso | URL |
|---|---|
| Sitio oficial | https://pseint.sourceforge.net |
| Descargas | https://pseint.sourceforge.net/index.php?page=descargas.php |
| Pseudocódigo oficial | https://pseint.sourceforge.net/index.php?page=pseudocodigo.php |
| Ejemplos oficiales | https://pseint.sourceforge.net/index.php?page=ejemplos.php |
| Características | https://pseint.sourceforge.net/features.php |
| Registro de cambios | https://pseint.sourceforge.net/index.php?page=actualizacion.php |
| Blog del autor | https://cucarachasracing.blogspot.com |
| Foro de soporte | https://sourceforge.net/p/pseint/discussion/ |

---

## Relación con todos los temas

Las herramientas de PSeInt se complementan con todos los temas del vault:

- [[02-Estructura-General]] — el diagrama refleja la estructura del `Proceso`
- [[07-Condicional-Si-Entonces]] — aparece como rombo de decisión en el diagrama
- [[09-Lazo-Mientras]] — aparece como ciclo en el diagrama de flujo
- [[11-Lazo-Para]] — aparece como estructura iterativa en el diagrama
- [[15-SubProcesos-y-Funciones]] — se exportan como funciones en el lenguaje destino
- [[17-Perfiles-de-Lenguaje]] — afecta la validación durante la ejecución

---

← [[17-Perfiles-de-Lenguaje]] | [[00-Indice-Principal]]

---
> *PSeInt © 2003–2025 Pablo Novara — Licencia GPL v2*  
> *Vault creado para Obsidian 1.12.7 (Installer 1.8.9) · Versión `pseint-20250218`*
