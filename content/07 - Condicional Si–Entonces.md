---
title: "07 — Condicional Si–Entonces"
aliases:
  - Si Entonces PSeInt
  - Condicional PSeInt
  - IfThen PSeInt
tags:
  - pseint
  - condicional
  - estructuras-de-control
  - si-entonces
created: 2026-03-26
version: "pseint-20250218"
---

# 07 — Condicional Si–Entonces

<div class="nav-bar nav-top">
  <a class="nav-pill nav-left" href="/06---Entrada-y-Salida">← 06 — Entrada y Salida</a>
  <a class="nav-pill nav-home" href="/00---Índice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/08---Selección-Múltiple-Según">08 — Selección Múltiple — Según →</a>
</div>

---

> [!info] Concepto clave
> La instrucción `Si–Entonces` ejecuta una secuencia de instrucciones **solo si** una condición lógica es verdadera. Es la estructura de control más fundamental de cualquier lenguaje de programación.

---

## Forma básica — Sin rama Sino

```
Si <condición> Entonces
    <instrucciones_si_verdadero>
FinSi
```

```
Proceso EjemploSimple
    Definir nota Como Real;
    Leer nota;
    Si nota >= 6 Entonces
        Escribir "Aprobado";
    FinSi;
FinProceso
```

Si la condición es `Falso`, no se ejecuta nada y el programa continúa con la instrucción siguiente.

---

## Forma completa — Con rama Sino

```
Si <condición> Entonces
    <instrucciones_si_verdadero>
SiNo
    <instrucciones_si_falso>
FinSi
```

```
Proceso ClasificarEdad
    Definir edad Como Entero;
    Leer edad;
    Si edad >= 18 Entonces
        Escribir "Mayor de edad";
    SiNo
        Escribir "Menor de edad";
    FinSi;
FinProceso
```

> [!note] Reglas
> - `Entonces` es **obligatorio**
> - `SiNo` es **opcional**
> - La condición debe ser una [[05 - Expresiones y Operadores|expresión lógica]] que produzca `Verdadero` o `Falso`

---

## Si anidado — múltiples condiciones

Los `Si` pueden anidarse para manejar más de dos casos:

```
Proceso ClasificarNota
    Definir nota Como Real;
    Leer nota;
    Si nota >= 9 Entonces
        Escribir "Sobresaliente";
    SiNo
        Si nota >= 7 Entonces
            Escribir "Notable";
        SiNo
            Si nota >= 5 Entonces
                Escribir "Aprobado";
            SiNo
                Escribir "Reprobado";
            FinSi;
        FinSi;
    FinSi;
FinProceso
```

> [!tip] Alternativa para muchos casos
> Cuando hay muchos valores numéricos posibles, considera usar [[08 - Selección Múltiple Según]] en lugar de anidar muchos `Si`.

---

## Condiciones compuestas con operadores lógicos

Usando los [[05 - Expresiones y Operadores#Operadores Lógicos|operadores lógicos]] se pueden combinar condiciones:

```
// Y — ambas condiciones deben ser verdaderas
Si (edad >= 18) & (edad <= 65) Entonces
    Escribir "En edad laboral";
FinSi;

// O — basta con que una sea verdadera
Si (dia = 6) | (dia = 7) Entonces
    Escribir "Es fin de semana";
FinSi;

// NO — invierte la condición
Si ~aprobado Entonces
    Escribir "Debe recuperar el examen";
FinSi;
```

---

## Condición directa con variable lógica

Si la condición ya es una [[04 - Variables e Identificadores|variable]] de [[03 - Tipos de Datos#Tipo Lógico|tipo Lógico]], puede usarse directamente:

```
Definir aprobado Como Logico;
aprobado <- promedio >= 6;

Si aprobado Entonces
    Escribir "Felicitaciones!";
SiNo
    Escribir "Debe mejorar";
FinSi;
```

---

## Ejemplo completo — Validación y clasificación

```
Proceso ClasificarIMC
    Definir peso, altura, imc Como Real;

    Escribir "Peso (kg): ";
    Leer peso;
    Escribir "Altura (m): ";
    Leer altura;

    Si altura <= 0 Entonces
        Escribir "Error: altura inválida";
    SiNo
        imc <- peso / (altura ^ 2);
        Escribir "IMC: ", imc;

        Si imc < 18.5 Entonces
            Escribir "Bajo peso";
        SiNo
            Si imc < 25 Entonces
                Escribir "Peso normal";
            SiNo
                Si imc < 30 Entonces
                    Escribir "Sobrepeso";
                SiNo
                    Escribir "Obesidad";
                FinSi;
            FinSi;
        FinSi;
    FinSi;
FinProceso
```

---

## Relación con otros temas

- [[05 - Expresiones y Operadores]] — las condiciones son expresiones lógicas
- [[03 - Tipos de Datos#Tipo Lógico|Tipo Lógico]] — el resultado de la condición
- [[08 - Selección Múltiple Según]] — alternativa para múltiples valores numéricos
- [[09 - Lazo Mientras]] — también usa condiciones lógicas
- [[10 - Lazo Repetir–Hasta Que]] — condición al final del ciclo
- [[15 - SubProcesos y Funciones]] — el `Si` puede usarse dentro de funciones

---

<div class="nav-bar nav-bottom">
  <a class="nav-pill nav-left" href="/06---Entrada-y-Salida">← 06 — Entrada y Salida</a>
  <a class="nav-pill nav-home" href="/00---Índice-Principal">⌂</a>
  <a class="nav-pill nav-right" href="/08---Selección-Múltiple-Según">08 — Selección Múltiple — Según →</a>
</div>

| Contribución: Alexis Carrillo | Círculo Interno • EvoClub | Creado con Quartz v4.5.2 © 2026
