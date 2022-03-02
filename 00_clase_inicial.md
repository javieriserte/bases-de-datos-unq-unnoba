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

## ¿Cómo está organizado el curso?

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

## ¿Cómo vamos a trabajar en el curso?

- 50% teórico, 50% práctico (más o menos).
- Vamos a trabajar con Jupyter notebooks en la plataforma Colab de Google.
- Trabajo final con evaluación a entregar quince días a un mes después del
  último encuentro.

---

## ¿Qué es una base de datos?

Es una colección organizada de información estructurada.

La forma en que está estructurada la información permite:

- Realizar facilmente recuperar información.
- Reducir el tamaño de la información.
- Procesar información de manera más rápida.
- Actualizar la información.

Una base de datos está controlada por un sistema de gestión de base de datos (DBMS). Algunos ejemplos de DBMS son: MySQL, Microsoft Access, PostgreSQL, Oracle, SQL Server, etc.

---

## ¿Qué es una base de datos?

Los datos en una base de datos suelen estar modelados como una serie de  tablas, con filas y columnas.

Las filas se corresponden con los elementos que se quieren representar y las columnas con los atributos de cada elemento. Los elementos tienen una (o más) columnas que contienen un **identificador único**.

Una base de datos suele contener varias tablas entrelazadas entre ellas.

---

## Ejemplo de Pfam

![height:600px](./images/pfam_domain.png)

---

## Diferentes aspectos de una base de datos biológica

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

## Tipos de bases de datos biológicas

1. Bases de datos primarias:

Archivan datos experimentales que son subidos por científicos. Por ejemplo,
secuencias de ácidos nucleócidos, proteínas


<!-- 1. Primary databases :

It can also be called an archival database since it archives the experimental results submitted by the scientists. The primary database is populated with experimentally derived data like genome sequence, macromolecular structure, etc. The data entered here remains uncurated(no modifications are performed over the data).
It obtains unique data obtained from the laboratory and these data are made accessible to normal users without any change.
The data are given accession numbers when they are entered into the database. The same data can later be retrieved using the accession number. Accession number identifies each data uniquely and it never changes.
Examples –

Examples of Primary database- Nucleic Acid Databases are GenBank and DDBJ  
Protein Databases are PDB,SwissProt,PIR,TrEMBL,Metacyc, etc.
2. Secondary Database :

The data stored in these types of databases are the analyzed result of the primary database. Computational algorithms are applied to the primary database and meaningful and informative data is stored inside the secondary database. 
The data here are highly curated(processing the data before it is presented in the database). A secondary database is better and contains more valuable knowledge compared to the primary database.
Examples –

Examples of Secondary databases are as follows.

InterPro (protein families, motifs, and domains)
UniProt Knowledgebase (sequence and functional information on proteins)  
3. Composite Databases :

The data entered in these types of databases are first compared and then filtered based on desired criteria. 
The initial data are taken from the primary database, and then they are merged together based on certain conditions. 
It helps in searching sequences rapidly. Composite Databases contain non-redundant data. 
Examples –

Examples of Composite Databases are as follows.

Composite Databases -OWL,NRD and Swissport +TREMBL -->

---

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
Intact
