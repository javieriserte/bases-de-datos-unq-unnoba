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

## <!--- Empty title 1 -->

\begin{center}
\Huge
APIs y Acceso Programático a Bases de Datos Biológicas
\end{center}

## Interacción con bases de datos

La interacción con las bases de datos puede hacerse con distintos objetivos.

Cada una de estas tareas puede ser realizadas por un bioinformático, pero
requiere distintos perfiles de conocimiento.

Por ejemplo:

- Obtener datos para un análisis de datos único.
- Automatizar un análisis periódico o generar datos repetibles en el tiempo.
- Desarrollar una aplicación que utiliza y/o requiere datos a pedido de un
  usuario.

Cada tarea requiere una forma de interacción diferente con la base de datos.

## ¿Cómo podemos acceder a una base de datos en la Web?

Las formas más frecuentes de obtener información de las bases de datos son:

- Acceso por una página Web.
- Acceso FTP u otro método de descarga masiva de datos.
- Acceso programático.

## Acceso a bases de datos / Pagina web

### Acceso por una página Web

- Útil para la exploración de pocos datos.
- Interacción fácil con otras bases de datos
- Permite hacer consultas sobre los datos antes de descargarlos.
- Permite obtener datos específicos.
- Suele estar bien documentada.
- Puede ser suficiente para obtener datos para hacer un análisis en particular.
- Recuperar grandes cantidades de datos puede ser tedioso y lento.
- No se puede automatizar.

## Acceso a bases de datos / decarga masiva

### Acceso FTP u otro método de descarga masiva de datos

- La mayoría de los proveedores permiten la descarga de los datos crudos, en
  paquetes grandes que contienen la totalidad o grandes porciones de los datos
  disponibles.
- Suele haber poca documentación.
- No se pueden hacer consultas sobre los datos antes de dascargarlos.
- Útil para hacer análisis a gran escala, que requiere todos los datos
  disponibles.
- No permite obtener datos particulares.
- Puede resultar útil si se está desarrollando una aplicación que se actualiza
  en períodos de tiempo largo.

## Acceso a bases de datos / APIs

### Acceso programático

- Útil para la automatización de tareas y la creación de aplicaciones.
- Poca documentación.
- Permite hacer consultas sobre los datos antes de descargarlos.
- Permite obtener datos específicos.
- Restricciones para evitar el abuso.
- Poco eficiente para descarga masiva de datos.
- Requiere más conocimientos informáticos y de programación.
- El acceso programático va a ser el principal enfoque de este curso.

## Formas de acceso programático

Hay varios protocolos generales para el acceso programático a servicios web,
no solo bases de datos. El más utilizado actualmente es **REST**, pero hay otros:

- REST \cmkg (Representational State Transfer)
  - Basado en HTTP.
  - Utiliza JSON o XML como formato de intercambio de datos.
  - Es el más utilizado actualmente.
- SOAP (Simple Object Access Protocol)
  - Basado en HTTP.
  - Más complejo que REST.
  - Más utilizado en aplicaciones empresariales.
- GraphQL
  - Basado en HTTP.
  - Permite hacer consultas más complejas y específicas.
  - Más moderno y más dificil de implementar para el proveedor y más difícil de
    usar para el usuario.

## Representational State Transfer (REST) API

Es un estilo arquitectónico para diseñar servicios web.

- Permite la comunicación entre aplicaciones a través de HTTP.

  Usa métodos estándar como GET, POST, PUT, DELETE.

- Basada en Recursos

  Los datos se representan como URLs.

- Formato de Respuesta Estándar

  Generalmente usa JSON o XML.

- Stateless (Sin Estado)

  Cada petición es independiente y no mantiene sesiones.

- Soporta Filtrado y Paginación

  Permite obtener solo los datos relevantes.

## Ejemplo: Obtener información de un gen (Ensembl)

### Petición REST (GET)

```http
GET https://rest.ensembl.org/lookup/symbol/homo_sapiens
  /BRCA1?content-type=application/json
```

### Respuesta JSON

```json
{
  "id": "ENSG00000012048",
  "symbol": "BRCA1",
  "description": "DNA repair associated",
  "biotype": "protein_coding"
}
```

## Formatos de respuestas de las APIs / JSON

Es el formato de intercambio de información entre servicios Web más común y
simple.

### ¿Qué es JSON?

- JavaScript Object Notation (formato ligero de intercambio de datos).
- Independiente del lenguaje de programación.
- Usado para almacenar y transmitir datos estructurados.

## Sintaxis de JSON

### Pares clave-valor

```json
{
  "gen": "BRCA1",
  "longitud": 8112,
  "esCanceroso": true
}
```

- Claves: siempre entre comillas dobles.
- Valores: números, cadenas, booleanos, arrays, objetos o null.

## Tipos de datos soportados en JSON

### Primitivos

- Strings ("cadena"), números (100, 3.14), booleanos (true/false), null.

### Estructurados

- Arrays: ["ADN", "ARN", "proteína"]
- Objetos anidados:

```json
    {
      "muestra": {
        "id": "SAM001",
        "tejido": "pulmón"
      }
    }
```

## Ventajas clave

- Ligero: Menos verboso que otros formatos.
- Legible: Fácil de interpretar por humanos y máquinas.
- Compatibilidad:
  - Integrable con Python, R, JavaScript, etc.
  - Formato estándar en APIs (NCBI, EBI, etc.).
- Estructura jerárquica: Ideal para datos complejos (ej: genomas, metadatos).

## XML: Estándar de intercambio estructurado

### ¿Qué es XML?

- eXtensible Markup Language (lenguaje de marcado extensible).
- Independiente de plataforma y lenguaje.
- Diseñado para almacenar, transportar y estructurar datos jerárquicos.

## Estructura básica y sintaxis de XML

### Etiquetas y elementos

```xml
<gen nombre="BRCA1">
  <longitud>8112</longitud>
  <es_canceroso>true</es_canceroso>
</gen>

```

- Reglas clave
  - Elementos y valores anidados con etiquetas de apertura/cierre.
  - Atributos opcionales dentro de las etiquetas ("nombre").
  - Sensible a mayúsculas y minúsculas.

## Encabezado en archivos XML

### ¿Qué es la primer linea?

```xml
  <?xml version="1.0" encoding="UTF-8" standalone="no"?>
  <genoma>
    <especie>Arabidopsis thaliana</especie>
    <cromosomas>5</cromosomas>
  </genoma>
```

- Llamado prólogo XML o declaración XML.
- Componentes del prólogo
  - version: Versión de XML (generalmente "1.0" o "1.1").
  - encoding: Codificación de caracteres (ej: UTF-8, ISO-8859-1).
  - standalone (opcional): Indica si el XML depende de recursos externos ("yes"
  o "no").
- Puede seguirlo una linea !DOCTYPE que define el tipo de documento.

```xml
  <!DOCTYPE blast-output PUBLIC ... >
```

## Namespaces en XML

### ¿Qué son?

- Mecanismo para evitar colisiones de nombres de elementos o atributos.
- Permiten combinar vocabularios XML diferentes en un mismo documento.
- \<secuencia\> podría significar "ADN" en un contexto y "proteína" en otro.

### Sintaxis básica

```xml
<root xmlns:bio="http://ejemplo.org/bio">
  <bio:secuencia>...</bio:secuencia>
</root>
```

- Partes clave:
  - xmlns:prefix: Declara el namespace (ej:```xmlns:bio="http://ejemplo.org/bio```").
  - URI: Identificador único (no necesita ser una URL funcional).

## Ventajas clave de XML

- **Extensible**: Permite definir etiquetas personalizadas
  (ej: `<secuencia_adn>...</secuencia_adn>`).
- **Autodescriptivo**: La estructura explica el significado de los datos.
- **Validación estricta**: Ideal para estándares regulados (ej: datos clínicos).

## Comparación con otros formatos

| Característica | JSON       | XML        | CSV                   |
|----------------|------------|------------|-----------------------|
| Legibilidad    | Alta       | Media      | Baja (sin estructura) |
| Peso           | Ligero     | Pesado     | Muy ligero            |
| Estructura     | Jerárquica | Jerárquica | Tabular               |

## Protocolo HTTP

El HTTP (Hypertext Transfer Protocol, Procolo de transferencia de hipertexto) es
un protocolo para la comunicación de datos de cualquier medio, de forma
distribuida y colaborativa.

El el protocolo base que usan diversas APIs.

En este protocolo hay dos actores principales:

- El cliente (client): Es quien hace la petición de conexión y hace los pedidos
  (request) al servidor, solicitando un recurso.
- El servidor (server): Es quien recibe los pedidos del cliente y devuelve una
  respuesta (response) devolviendo los recursos solicitados en ese pedido.
- Los recursos se espcifican con una ruta (URL) en el servidor.
  - Por ejemplo: ```http://www.unnoba.edu.ar/estudiantes/```

## Protocolo HTTP / Esquema

\begin{center}
  \includegraphics[width=0.98\textwidth]{images/http-schema.pdf}
\end{center}

## Principios del protocolo HTTP

### Sin conexión permanente

El cliente comienza una conexión mediante un pedido. El cliente espera al
servidor que tiene que procesar el pedido y luego envía la respuesta al cliente.
Cuando el cliente recibe la respuesta la conexión termina y tanto el cliente y
el servidor dejan de tener conocimiento de cada uno.

### Sin estado

Ni el cliente ni el servidor pueden mantener información entre distintas conexiones.

### No tiene restricciones de los medios que se transfieren

Se puede transferir datos de cualquier tipo, siempre que el cliente y el
servidor sepan como interpretarlos.

## Pedidos y respuestas HTTP

Los **pedidos** y las **respuestas** HTTP tienen una estructura fija y contienen
datos definidos.

### Pedidos HTTP

Los pedidos contienen dos partes.

- La primera, llamada **encabezado** (**header**), contiene datos que definen el
tipo de pedido y el destinatario. Los elementos más importantes del encabezado
son:
  - Método: Define el tipo acción que debe realizar el **servidor** al recibir
    el pedido. Los dos métodos más comunes son:
    - GET: Para recuperar información del servidor.
    - POST: Para subir datos que requerirá el servidor para procesar el
      **pedido**.
  - Recurso: Ruta del recurso (por ejemplo un archivo al que se dirige el
    **pedido**).
  - Host: Nombre del **servidor**.
- La segunda parte es el cuerpo del pedido (**body**). Esta parte es opcional y
  no siempre se envía.

## Envio de datos en un pedido HTTP

Los datos se pueden enviar de distintas formas.

- Codificados en la URL del pedido, como un par de clave-valor.
  - Por ejemplo: ```http://www.unnoba.edu.ar/estudiantes/?nombre=Juan&apellido=Lopez```
- En el encabezado del pedido, como un par de clave-valor.
- En el cuerpo del pedido
  - como un par de clave-valor.
  - como un archivo (por ejemplo un archivo de texto o
  binario).
  - como un JSON o XML.

## Ejemplo de pedido HTTP

```http
POST /Blast.cgi?db=nucleotide&term=TP53 HTTP/2
Host: blast.ncbi.nlm.nih.gov
User-Agent: Mozilla/5.0
Content-Length: 1000
Origin: https://blast.ncbi.nlm.nih.gov
Connection: keep-alive
...

ADV_VIEW=on&ALIGNMENTS=100&ALIGNMENT_VIEW=Pairwise
```

- POST es el método.
- Blast.cgi?db=nucleotide&term=TP53 es el recurso.
- Host: blast.ncbi.nlm.nih.gov es el servidor.
- ADV_VIEW=on&ALIGNMENTS=100 son los datos enviados en el pedido.

## Respuestas HTTP

- Las respuestas tambien tienen un encabezado y luegos los datos propios que nos
pueden ser de interés.
- Los encabezados de una repuesta tiene un formato similar al de un pedido,
pero no van a ser relevantes para nosotros, con exceptión del código de estado.
- El código de estado (**status code**) es un número que refleja si la consulta
fue exitosa o si hubo algún tipo de problema.
- Algunos de los códigos de estados más comunes son:
  - 200 OK : La consulta se procesó exitosamente.
  - 301 Moved Permanently: La url no se encuentra en el lugar indicado, la nueva
    url se pasa en la respuesta.
  - 400 Bad Request: El servidor no entiende el pedido.
  - 404 Not found: El recurso que se busca no se encontró.
  - 500 Internal Server Error: El servidor encontró una situación que no sabe
    como manejar.

## REST API

Los servidores webs pueden ofrecer sus datos y permitir hacer consultas por
medio de una interfaz programática independiente de la representación de una
página web.

Esta interfaz suele ser del tipo REST API.

- Está conformada por una colección de URLs diferentes.
- Cada una de ellas provee una funcionalidad específica.
- Por ejemplo, estas son algunas de las URLs de NCBI.
  - ```https://eutils.ncbi.nlm.nih.gov/entrez/eutils/einfo.fcgi```
  - ```https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi```
  - ```https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi```
- Como programadores, podemos interactuar con esta interfaz para llevar las
  tareas que necesitemos.

## Ejemplo de uso

- ¿Cómo se que recursos debo solicitar, que datos debo enviar, que método HTTP
  debo usar?
- La respuesta a estas preguntas está en la documentación de la API.

```http
GET https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi
  ?db=pubmed&term=BRCA1&retmode=xml
```

## <!--- Empty title 2 -->

\begin{center}
\Huge
Entrez / Eutils REST API
\end{center}

## Entrez / Eutils REST API

- Entrez es un sistema de búsqueda y recuperación de información biológica
desarrollado por el NCBI (National Center for Biotechnology Information).
- Entrez permite acceder a una variedad de bases de datos biológicas, incluyendo
PubMed, GenBank, entre otras.
- Entrez E-utilities es un conjunto de herramientas que permite acceder a las
bases de datos de Entrez a través de una API RESTful.
- Entrez E-utilities permite realizar búsquedas, recuperar datos y realizar
análisis de datos biológicos de manera programática.

## Entrez Programming Utilities (E-utilities)

Es un conjunto de nueve programas en servidores web que parmiten acceder al
sistema Entrez:

Se accede a cada uno de estos programas con una URL particular y permite:

- hacer consultas mediante una REST-API por HTTP.
- Las respuestas con generalmente en formato XML,
- pero puede ser fasta u otro formato especial para algunos pedidos.

## Programas de E-Utilities / 1

### 1 - EInfo (database statistics)

url: eutils.ncbi.nlm.nih.gov/entrez/eutils/einfo.fcgi

Provee datos de cada base de datos, como ser la fecha de la última
actualización, cantidad de registros, los campos de cada registros.

### 2 - ESearch (text searches)

url: eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi

Permite hacer búsqueda por texto. Devuelte una lista de identificadores de los
registros seleccionados para ser luego usados en otros servicios como ESummary,
EFetch o Elink.

## Programas de E-Utilities / 2

### 3 - ESummary (document summary downloads)

url: eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi

Devuelve resúmenes de cada registro a partir de una lista de identificadores.

### 4 - EFetch (data record downloads)

url: eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi

Devuelve registros completos a partir de una lista de identificadores.

## Otros programas de E-Utilities

- ELink (Entrez links):  Acepta una lista de identificadores y devuelve una
  lista de identificadores de registros relacionadoes de la misma base de datos
  u otra base de datos.
- EPost (UID uploads): Acepta una lista de identificadores que se almacenan en
  un History Server, lo que permite acceder a ellos más tarde.
- EGQuery (global query): Hace una búsqueda de texto global en todas las bases
  de datos.
- ESpell (spelling suggestions): Recupera sugerencias de escritura para entradas
  de texto.
- ECitMatch (batch citation searching in PubMed): Recupera PMCIDs para una
  listas de citas.

## Flujo de trabajo con E-utilities

1. Usando ESearch se hace un pedido de búsqueda a una base de datos de NCBI
   con los criterios que uno quiera.
2. Se obtiene una lista de identificadores (UIDs) de los registros que
   cumplen con los criterios de búsqueda.
3. Con ESummary se obtiene un resumen de los registros a partir de la lista de
   identificadores.
4. Con EFetch se obtienen los registros completos a partir de la lista de
   identificadores.

## Leer archivos Genbank en python

Un archivo GenBank generalmente contiene:

- **Metadata (Metadatos)**: Información sobre el locus, definición, número de
  acceso (accession), entre otros.
- **Features (Características)**: Anotaciones biológicas como genes, CDS
  (secuencias codificantes), mRNA, etc.
- **Sequence (Secuencia)**: La secuencia nucleotídica completa.

## Leer archivos Genbank en python (cont.)

```python
from Bio import SeqIO

# Parse the GenBank file
for record in SeqIO.parse("your_file.gb", "genbank"):
  print("ID:", record.id)
  print("Name:", record.name)
  print("Description:", record.description)
  print("Sequence length:", len(record.seq))
  print("Features:")
  for feature in record.features:
    print(" -", feature.type, feature.location)
```

## Leer archivos Genbank en python (cont. 2)

```python
for record in SeqIO.parse("your_file.gb", "genbank"):
  for feat in record.features:
    if feat.type == "CDS":
      g_name = feat.qualifiers.get("gene", ["N/A"])[0]
      prot_id = feat.qualifiers.get("protein_id", ["N/A"])[0]
      trans = feat.qualifiers.get("translation", ["N/A"])[0]
      print(f"Gene: {gene_name}, Protein ID: {protein_id}")
      print("Protein:", trans[:30] + "...")  # first 30 aa
```

## <!--- Empty title 3 -->

\begin{center}
\Huge
¡¡¡ Muchas Gracias !!!
\end{center}
