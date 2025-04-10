---
title: Bases de datos biológicas
subtitle: Maestría en bioinformática y Biología de Sistemas
author: |
  | Javier Iserte
  |
  | UNNOBA
date: 2025
theme: Singapore
class: lead
colortheme: dove
fontfamily: noto-sans
header-includes:
  - \usepackage[usenames,dvipsnames]{xcolor}
  - \usepackage[utf8]{inputenc}
  - \usepackage{lmodern}
  - \usepackage{amssymb}
  - \usepackage{pgfpages}
  - \usepackage{fontspec}
  - \usepackage{fontawesome}
  - \renewcommand{\familydefault}{\sfdefault}
  - \newcommand{\cmkg}{\textcolor{SpringGreen}{\faCheck}}
  - \newcommand{\cmkb}{\textcolor{blue}{\faCheck}}
  - \newcommand{\cmkr}{\textcolor{red}{\faCheck}}

fontsize: 10pt
---

## <!--- Empty title 2 -->

\begin{center}
\Huge
Revisión de programación en Python
\end{center}

## Características de Python

- Lenguaje de programación interpretado
- Tipado dinámico
  - Se puede anotar con _type hints_
- Permite programación multiparadigma
  - Orientado a objetos
  - Funcional
- Entornos de ejecución lento (muy lento)
- Lenguaje muy expresivo
- Es relativamente fácil interactuar con código en otros lenguajes de bajo
  nivel:
  - C y C++
  - Rust

## Sintaxis básica - Variables y estructuras de datos

### Separación de _scope_ por indentación

- No se utilizan llaves para definir bloques de código.
- Se utiliza la indentación para definir el _scope_ de las estructuras de
  control.

  ```python
  if x > 5:
      print("Mayor a 5")
      if x < 10:
          print("... y menor a 10")
  ```

### Variables

- Declaración de variables sin necesidad de especificar el tipo.

  ```python
  x = 10  # Entero
  y = 3.14  # Flotante
  z = "Hola, mundo"  # Cadena
  ```

## Estrucutras de Datos Nativas

En general todas las estructuras de datos en Python son no homogéneas.

- Listas:

  ```python
  lista = [1, 2, 3, 4]
  ```

- Tuplas, son inmutables:

  ```python
  tupla = (1, 2, 3, 4)
  ```

- Diccionarios:

  ```python
  diccionario = {"clave": "valor", "edad": 25}
  ```

- Conjuntos:

  ```python
  conjunto = {1, 2, 3, 4}
  ```

## Listas

- Creación de listas:

  ```python
  lista = [1, 2, 3, 4]
  ```

- Acceso a elementos:

  ```python
  print(lista[0])
  ```

- Modificación de elementos:

  ```python
  lista[0] = 10
  ```

- Operaciones con listas:

  ```python
  lista.append(5) # Agrega un elemento al final
  lista.pop() # Elimina y devuelve el último elemento
  ```

## Diccionarios

- Diccionarios:

  ```python
  mdr_passwords = {
    "mark.s": "1234",
    "dylan.g": "qwerty"
  }
  print(passwords["mark.s"])
  print(passwords.get("mrs cassey", "Not Found"))
  mdr_passwords["jsmith"] = "password"
  mdr_passwords["helly.r"] = "cold.harbor"
  mrd_passwords.update(
    { "irving.b": "burt" }
  )
  del mdr_passwords["mark.s"]
  ```

## Tuplas

- Tuplas:

  ```python
  tupla = (1, 2, 3, 4)
  ```

- Acceso a elementos:

  ```python
  print(tupla[0])
  ```

- Desempaquetado de tuplas:

  ```python
  a, b, c, d = tupla
  a, c, *resto = tupla
  ```

## Estructuras de Control

- Condicionales:

  ```python
  if x > 5:
    print("Mayor a 5")
  elif x == 5:
    print("Igual a 5")
  else:
    print("Menor a 5")
  ```

- Bucles:

  ```python
  for i in range(5):
      print(i)
  else:
      print("Fin del bucle")

  while x > 0:
      print(x)
      x -= 1
  ```

## Funciones

- Definición de funciones:

  ```python
  def suma(a, b):
      return a + b
  ```

- Funciones anónimas:

  ```python
  # Las funciones anónimas solo pueden ser una expresión
  suma = lambda a, b: a + b
  ```

## Manejo de Excepciones

- Uso de `try` y `except`:

  ```python
  try:
      resultado = 10 / 0
  except ZeroDivisionError:
      print("Error: División por cero")
  ```

## Comprensión de listas

```python
numeros = [1, 2, 3, 4]
sucesivos = [x+1 for x in numeros]
```

```python
numeros = [1, 2, 3, 4]
numeros_pares = [
  x
  for x in numeros
  if x % 2 == 0
]
```

## Comprensión de diccionarios y sets

```python
numeros = [1, 2, 3, 4]
sucesivos = {
  x: x+1 for x in numeros
}
```

```python
numeros = [1, 2, 3, 4, 4, 5]
sucesivos = { x+1 for x in numeros }
```

## Importación de Módulos

- Importar módulos estándar o externos:

  ```python
  import math
  print(math.sqrt(16))

  from math import sqrt
  print(sqrt(16))

  from math import sqrt as raiz
  print(raiz(16))

  import math as m
  print(m.sqrt(16))
  ```

## Programación Orientada a Objetos / Clases

- Definición de clases:

  ```python
  class Persona:
      def __init__(self, nombre, edad):
          self.nombre = nombre
          self.edad = edad

      def saludar(self):
          print(f"Hola, soy {self.nombre}")
  ```

- Creación de objetos:

  ```python
  persona = Persona("Juan", 25)
  persona.saludar()
  ```

## Programación Orientada a Objetos / Herencia

- Herencia:

  ```python
  class Estudiante(Persona):
      def __init__(self, nombre, edad, carrera):
          super().__init__(nombre, edad)
          self.carrera = carrera

      def estudiar(self):
          print(f"Estudiando {self.carrera}")
  ```

## Dunder methods

- Los dunder methods son funciones con nombres que comienzan y terminan con
  doble guion bajo (\_\_nombre\_\_).
- Se usan para definir comportamientos especiales en las clases:
  - la representación de objetos
  - la sobrecarga de operadores
  - la personalización de estructuras de datos.
- "Dunder" viene de "Double UNDERscore".

## Ejemplo de dunder methods

```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def __str__(self):
        return f"{self.nombre} ({self.edad} años)"

    def __eq__(self, otro):
        return self.nombre == other.nombre and self.edad == other.edad

    def __add__(self, otro):
        return Persona(
          f"{self.nombre} y {other.nombre}",
          self.edad + other.edad
        )
```

## Duck typing

- **Duck Typing** es el tipado que se basa en el comportamiento de un
  objeto en lugar de su tipo explícito.
- **"Si camina como un pato y suena como un pato, entonces probablemente sea un
  pato."**
- Python no verifica el tipo explícito de un objeto
- Si tiene los métodos o atributos necesarios, confía en que el objeto tenga el
  comportamiento esperado.
- Permite tener polimorfismo muy sencillamente.
- Fuente de muchos errores.

## Ejemplo de Duck Typing

```python
def add(a, b):
    return a + b

add(1, 2)

add("Hola", "Mundo")

add([1, 2, 3], [4, 5, 6])

add({1, 2, 3}, {4, 5, 6})

add(1, "Hola") # Error en tiempo de ejecución

```

## Anotaciones de tipos (Type Hints)

Si bien el tipo de las variables en Python se definen en tiempo de ejecución,
el posible anotar las variables con un tipo específico.

- Las anotaciones son ayudas para del programador y herramientas de análisis estático.
- No afectan el comportamiento del programa.
- Se pueden utilizar para documentar el código.
- Los tipos reales pueden no coincidir con el anotado.

```python
def suma(a: int, b: int) -> int:
    return a + b
```

## Programación Orientada a Objetos / Protocolos

- Protocolos:

  ```python
  from typing import Protocol
  class Estudiante(Protocol):
      def estudiar(self):
          pass

  class EstudianteBiologia(Estudiante):
      def estudiar(self):
          print("Estudiando biologia")

  class EstudianteInformatica(Estudiante):
      def estudiar(self):
          print("Estudiando informatica")

  def estudiar(estudiante: Estudiante):
      estudiante.estudiar()
  ```

## Manipulación de archivos

```python
file_pointer = open("classes/data/amino_frq.csv", "r", encoding="utf-8")
for line in file_pointer:
    line = line.strip()
    fields = line.split("\t")
    print(fields)
file_pointer.close()

```

## Context Managers

- Son objetos que representan un scope de ejecución particular
- Un context manager se encarga de inicializar el contexto y limpíarlo
  después de que se ha utilizado

```python
with open("file", "r") as file: # En este punto se inicializa el contexto
  for line in file:
    line = line.strip()
# Al salir del scope the with se limpia el contexto
# En este caso se cierra el archivo
```

## Instalación de Python

- Desde la página oficial de Python: [https://www.python.org/](https://www.python.org/)
  - Para windows hay ejecutables de instalación.
  - Para Linux y MacOS se debe instalar desde el código fuente.
- En Linux, se puede instalar desde el gestor de paquetes:

  ```bash
  sudo apt install python3
  ```

- Usando Anaconda/Miniconda:
  - [https://www.anaconda.com/products/distribution](https://www.anaconda.com/products/distribution)
  - [https://www.anaconda.com/docs/getting-started/miniconda/main](https://www.anaconda.com/docs/getting-started/miniconda/main)
- UV package manager:
  - [https://docs.astral.sh/uv/](https://docs.astral.sh/uv/)

## Entornos virtuales

- Los entornos virtuales permiten tener diferentes versiones de Python,
  paquetes y librerías en un mismo sistema.
- Util para evitar conflictos entre versiones de paquetes cuando se trabaja en
  varios proyectos.
- Se pueden crear con el módulo `venv` de Python:

  ```bash
  python3 -m venv myenv
  source myenv/bin/activate # Para entrar en el entorno virtual
  deactivate # Para salir del entorno virtual
  ```

- Anaconda y UV tienen formas específicas de crear entornos virtuales.

## Uso en bioinformática y data science

- Python es uno de los lenguajes más utilizados en bioinformática y data
  science.
- Existen librerías y paquetes específicos para trabajar con datos biológicos y
  científicos. Que suelen estar desarrolladas en lenguajes de bajo nivel.
- Algunas de las librerías más utilizadas son:
  - NumPy: Arrays multidimensionales
  - SciPy: Análisis estadísticos
  - Pandas: Estructuras de datos tabulares
  - statsmodels: Modelado estadístico
  - Scikit-learning: Machine learning
  - PyTorch: Deep learning
  - TensorFlow: Deep learning
  - Matplotlib: Visualización de datos
  - Biopython: Herramientas para bioinformática
  - Jupyter: Notebooks interactivas
