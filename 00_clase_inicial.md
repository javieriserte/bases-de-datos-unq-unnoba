---
title: Bases de datos biológicas
subtitle: Bioquímica II
author: Javier Iserte
date: 2022
theme: Singapore
marp: true
class: lead
colortheme: seagull
fontfamily: noto-sans
header-includes:
- \usepackage{cmbright}
- \usepackage{chemfig}
- \usepackage[version=4]{mhchem}
- \usetikzlibrary{decorations.pathmorphing}
- \usepackage[T1]{fontenc}
- \usepackage{lmodern}

fontsize: 10pt
---

# Bases de datos biológicas

---

# ¿Cómo está organizado el curso?

Primer encuentro:

- Algunos conceptos teóricos.
- Interactuar manualmente con diferentes bases de datos.
  - Consultas básicas y avanzadas.

Segundo encuentro:

- Introducción al lenguage de programación R.
- Acceso programático a bases de datos.

Tercer encuentro:

- Acceso programático a bases de datos.
- Ejercicios de acceso programático a bases de datos.

---

# ¿Cómo vamos a trabajar en el curso?

- 50% teórico, 50% práctico (más o menos).
- Vamos a trabajar con Jupyter notebooks en la plataforma Colab de Google.
- Trabajo final con evaluación a entregar quince días a un mes después del
  último encuentro.

---

# ¿Qué es una base de datos?

Es una colección organizada de información estructurada, almacenada en
un sistema informático.

La forma en que está estructurada la información permite:

- Realizar facilmente recuperar información.
- Reducir el tamaño de la información.
- Procesar información de manera más rápida.
- Actualizar la información.

Una base de datos está controlada por un sistema de gestión de base de datos (DBMS). Algunos ejemplos de DBMS son: MySQL, Microsoft Access, PostgreSQL, Oracle, SQL Server, etc.

---

# ¿Qué es una base de datos?

Los datos en una base de datos suelen estar modelados como una serie de  tablas, con filas y columnas.

Las filas se corresponden con los elementos que se quieren representar y las columnas con los atributos de cada elemento. Los elementos tienen una (o más) columnas que contienen un **identificador único**.

Una base de datos suele contener varias tablas entrelazadas entre ellas.

---

# Ejemplo de Pfam

![height:600px](./images/pfam_domain.png)

---

# Diferentes aspectos de una base de datos biológica

- Desde el punto de vista informático
  - Estructura de los datos.
  - Modos de acceso programático.
  - Límites en las consultas.
  - Estrategias específicas para manipular datos biológicas.

- Desde el punto de vista de usuario biólogo.
  - Interfaz de usuario.
  - Origen biológicos de los datos.
  - Interacción con otras bases de datos.
  - Diferencias entre bases de datos similares.

---

# Tipos de bases de datos biológicas

## Bases de datos primarias

Archivan datos derivados directamente de resultados experimentales que son subidos por científicos. Por ejemplo:

- Secuencias de ácidos nucleócidos
  - NCBI GenBank
- Secuencias de proteínas.
  - NCBI protein
- Estructuras de proteínas.
  - Protein Data Bank (PDB)

Cada dato tiene asignado un número de acceso (**Accession number**), que identifica estos datos de forma única y nunca cambia.

---

# Tipos de bases de datos biológicas

## Bases de datos secundarias

Los datos que almacenan provienen del análisis de los datos de las bases de datos primarias. Muchas veces los resultados son curados por expertos.

Las bases de datos secundarias suelen contener datos de **mejor** calidad que
las bases de datos primarias.

Por ejemplo:

- Pfam (Protein families)
- Uniprot Knowledgebase

---

## Bases de datos específicas/compuestas

- Contienen información sobre tópicos específicos
  - por ejemplo un organismo modelo
- Colectan información de varias otras bases de datos
- Combinan varios aspectos que biológicamente están relacionados, pero cuyos
datos provienen de diferentes fuentes.

Por ejemplo:

- TAIR (The Arabidopsis Information Resource)
- IntAct DB

---

## Bases de datos de secuencias biológicas

### Genbank (NCBI)

- Es una colección anotada de secuencias de todas las secuencias de ADN que
  están publicamente disponibles.

- Es parte del consorcio INSDC (International Nucleotide Sequence Database
  Collaboration), junto con ENA (Europa) y DDBJ (Japón). Todas tienen la misma
  información.

https://www.ncbi.nlm.nih.gov/genbank/

---

![](images/genbank_stats.pdf)

---

### RefSeq (NCBI Reference Sequence Database)

Es una colección de secuencias de referencia para:

- ADN genómico
- Transcriptos
- Proteinas

Contiene secuencias no redundantes y bien anotadas. Sirve como una marco de
referencia estables para otras bases de datos, proyectos, anotación de
variantes, etc.

https://www.ncbi.nlm.nih.gov/refseq/

---

### NCBI Nucleotide (nuccore)

Es una colección más inclusiva de secuencias de ADN y ARN.

Incluye las secuencias de GenBank, RefSeq y PDB.

https://www.ncbi.nlm.nih.gov/nuccore

---

### Sequence Read Archive

Es una colección se secuencias generadas en experimentos de secuenciación
masiva:

- Experimentos de RNA-Seq
- Experimentos de ChIP-Seq
- Proyectos de Metagenómica
- Muestras ambientales

---

### Uniprot

- Uniprot provee secuencias y anotaciones funcionales de proteinas.
- Es el principal recurso sobre secuencias proteínas.
- Consiste de varias bases de datos:
  - Uniparc: Colección de proteinas no redundantes de la mayor parte de las
    secuencias de proteinas disponibles. La mayoría no tiene anotaciones de
    calidad.
  - UniprotKB: Colección de secuencias de proteínas con anotaciones funcionales.
    - Swiss-Prot: Contiene anotaciones curadas manualmente (~550.000)
    - TrEMBL: Contiene anotaciones generadas automáticamente (~230.000.000). No
      están revisadas a mano.
  - Proteomes: Colección de proteínas por organismo.

---

### Bases de datos de grupos de proteínas



<!-- --- -->
<!--
3. Composite Databases :

The data entered in these types of databases are first compared and then filtered based on desired criteria. 
The initial data are taken from the primary database, and then they are merged together based on certain conditions. 
It helps in searching sequences rapidly. Composite Databases contain non-redundant data. 
Examples –

Examples of Composite Databases are as follows.

Composite Databases -OWL,NRD and Swissport +TREMBL -->

<!-- ---

Revisión por varias bases de datos:

---

- Bases de datos de NCBI
  - nucleotide
  - protein
  - GEO
  - sra
  - Taxonomy
  - Genes

---

- Uniprot
- pfam
- Ensembl
- Ensembl genome
- PDB

---

Bases de datos por organismos modelos
- Flybase
- Wormbase
- TAIR
- Araport

---

Mobidb
PED
STRING
Intact -->