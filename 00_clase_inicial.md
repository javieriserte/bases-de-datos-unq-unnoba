---
title: Bases de datos biológicas
subtitle: UNNOBA
author: Javier Iserte
date: 2022
theme: Malmoe
marp: true
class: lead
colortheme: dove
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

![](./images/pfam_domain.png)

---

# Diferentes aspectos de una base de datos biológica

- Desde el punto de vista informático (consulta/desarrollo)
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

# Modos de acceso

- La forma de acceso más común es a través de una página web.
  - Es la forma más intuitiva de consultar una base de datos
  - Visualizar unos pocos elementos
- Varias bases de datos permiten la descarga parcial o total de los datos "crudos"
- En muchos casos ofrecen una interfaz de de programación de aplicaciones (API)
  para hacer consultas de forma programática
  - Automatizar tareas
  - Crear aplicaciones propias que consulten a esas bases de datos

---

# Tipos de bases de datos biológicas

## Bases de datos primarias

Archivan datos derivados directamente de resultados experimentales que son
subidos por científicos. Por ejemplo:

- Secuencias de ácidos nucleócidos
  - NCBI GenBank
- Estructuras de proteínas.
  - Protein Data Bank (PDB)

Cada dato tiene asignado un número de acceso (**Accession number**), que
identifica estos datos de forma única y nunca cambia.

---

# Tipos de bases de datos biológicas

## Bases de datos secundarias

Los datos que almacenan provienen del análisis de los datos de las bases de datos primarias. Muchas veces los resultados son curados por expertos.

Las bases de datos secundarias suelen contener datos de **mejor** calidad que
las bases de datos primarias.

Por ejemplo:

- Pfam (Protein families)
- Uniprot Knowledgebase
- NCBI Refseq

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

# ¿Quién da soporte a las bases de datos biológicas?

La mayoría de las bases de datos de mayor relevancia son mantenidas directa o
  indirectamente por:

- NCBI/NLM/NIH
- EBI/EMBL

Estas suelen ser las más genérales.

Otras son matenidas por consorcios, instituciones más pequeñas o por grupos de
investigación. Estas suelen ser las más específicas y con menor nicho de
usuarios, y con menor mantenimiento.

---

# Bases de datos de secuencias biológicas

## Genbank (NCBI)

- Es una colección anotada de secuencias de todas las secuencias de ADN que
  están publicamente disponibles.

- Es parte del consorcio INSDC (International Nucleotide Sequence Database
  Collaboration), junto con ENA (Europa) y DDBJ (Japón). Todas tienen la misma
  información.

https://www.ncbi.nlm.nih.gov/genbank/

---

### Genbank (NCBI) - Estadísticas

![](images/genbank_stats.pdf)

---

## RefSeq (NCBI Reference Sequence Database)

Es una colección de secuencias de referencia para:

- ADN genómico
- Transcriptos
- Proteinas

Contiene secuencias no redundantes y bien anotadas. Sirve como una marco de
referencia estables para otras bases de datos, proyectos, anotación de
variantes, etc.

https://www.ncbi.nlm.nih.gov/refseq/

---

## NCBI Nucleotide (nuccore)

Es una colección más inclusiva de secuencias de ADN y ARN.

Incluye las secuencias de GenBank, RefSeq y PDB.

https://www.ncbi.nlm.nih.gov/nuccore

---

## Sequence Read Archive

Es una colección se secuencias generadas en experimentos de secuenciación
masiva:

- Experimentos de RNA-Seq
- Experimentos de ChIP-Seq
- Proyectos de Metagenómica
- Muestras ambientales

https://www.ncbi.nlm.nih.gov/sra

---

## Uniprot

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

https://www.uniprot.org/

---

# Bases de datos de grupos de proteínas

## Pfam

- Es una colección de dominios de familias de proteínas.
- Cada familia está representada por un alineamiento múltiple y un modelo   oculto de Markov (HMM).
- Cada familia está definida por un pequeño alineamiento semilla, con este se construye un HMM. Y un alineamiento completo de todas las secuencias detectables a partir del HMM en bases de datos primarias de proteínas.
- Algunos conjuntos de familias se agrupan en clanes, que tienen que tener un origen evolutivo común.

https://pfam.xfam.org/

\begin{center}
  \includegraphics[width=0.5\textwidth]{images/hmm.pdf}
\end{center}

---

## UniRef

- Es una base de datos de proteínas que tienen similitud secuencial.
- Hay diferentes versiones según el grado de identidad de secuencia.
  - UniRef100 combina secuenias idénticas y fragmentos de cualquier organismo.
  - UniRef90 resulta del agrupamiento de secuencias de Uniref100 al 90% de identidad y 80% de sobreposición con la secuencia de mayor longitud.
  - Uniref50 resulta del agrupamiento de secuencias de Uniref90 al 50% de identidad y 80% de sobreposición con la secuencia de mayor longitud.

https://www.uniprot.org/uniref/

---

# Bases de datos de genes, genomas y variantes


## NCBI Gene

- Contiene datos entrelazados de distintas fuentes para un gen:
  - Mapa de la organización del gen.
  - Secuencias disponibles
  - Resultado de expresión génica
  - Transcriptos
  - Anotaciones funcionales
  - Fenotipos asociados
  - Variantes con importancia clínica

https://www.ncbi.nlm.nih.gov/gene

---

## NCBI Genome

- Contiene datos genomas de diferentes organismos:
  - Secuencias de genómicas
  - Enlaces los proyectos de ensamblado
  - Mapas de la organización génica
  - Anotaciones funcionales
  - Organización cromosómica

https://www.ncbi.nlm.nih.gov/genome

## ENSEMBL / ENSEMBLGenomes

- Es la contraparte Europea de NCBI Genome.
- Contiene esencialmente el mismo tipo de información.

https://ensemblgenomes.org/

---

## Online Mendelian Inheritance in Man - OMIM

- Es una colección de genes, desordenes genéticos y fenotipos.

## dbVar

- Es una base de datos de variantes estructurales del Genoma Humano
- Pueden ser inserciones, deleciones, duplicaciones, inversiones, elementos móviles, translocaciones y otra variantes complejos de un tamaño mayor a 50pb.

https://www.ncbi.nlm.nih.gov/dbvar/

---

## dbGaP

- Tiene datos de resultados de estudios de asociación genotipo / fenotipo en humanos.
- Al tener datos sensibles de pacientes, tiene un acceso restringido.

https://www.ncbi.nlm.nih.gov/gap/

## ClinVar

- Colecta información acerca variantes genómicas que tienen relevancia clínica.

https://www.ncbi.nlm.nih.gov/clinvar/

## Cosmic (Catalog of somatic mutations in Cancer)

- Contiene información de mutaciones somáticas en células cancerígenas.

https://cancer.sanger.ac.uk/cosmic

---

# Bases de datos de estructuras de proteínas

## Protein data bank - PDB

- Tiene resultados experimentales de estructuras de proteínas:
  - X-ray, NMR, Criofractura, etc
- Tiene datos de coordenadas x, y, z para los átomos.
- Tiene emsamblados macromoleculares de algunos complejos proteícos
- Mayoritariamente contiene proteínas, pero también tiene ácidos nucleicos y moléculas pequeñas.

https://www.rcsb.org

## NCBI Structure

- Tiene esencialmente la misma información que PDB.
- Pueden tener distinta información adicional que PDB.

https://www.ncbi.nlm.nih.gov/structure

---

# Bases de datos de información médica

## MeSH (Medical subject headings)

- Es un vocabulario controlado de términos médicos.
- Está organizado en en DAG (*directed acyclic graph*)
- Se usa para indexar y catalogar información biomédica, por ejemplo PubMed.

https://meshb.nlm.nih.gov/

\begin{center}
  \includegraphics[width=0.5\textwidth]{images/dag.pdf}
\end{center}

---

## MEDGEN

- Tiene información sobre medicina génetica.
  - Tiene descripciones de las enfermedades
  - Síntomas médicos
  - Guías para profesionales de la salud
  - Datos de estudios clínicos

https://www.ncbi.nlm.nih.gov/medgen

---

# Bases de datos de Bibliografia médica

## Pubmed

- Es la base de datos de publicaciones científicas en medicina/salud más grande que existe.

https://www.ncbi.nlm.nih.gov/pubmed

## PMC

- Es un subconjunto de pubmed que tiene las publicaciones producidas como parte de proyectos financiados por el NIH/NLM.

https://www.ncbi.nlm.nih.gov/pmc

---

# Bases de datos de vías metabólicas

## Reactome

- Contiene vías del metabólismos intermedio, metabolismo de protínas, enfermedades, etc.

https://reactome.org/

## Kyoto Encyclopedia of Genes and Genomes

- Es una base de datos que contiene información sobre sistemas biológicos de alto nivel de alto nivel.
- Esencialmente contiene información sobre vías metabólicas, genes, genomas, enzimas y reacciones químicas involucradas.

https://www.genome.jp/kegg/

---

# Bases de datos de Interacciones moleculares

## IntACT / String / Biogrid

- Son tres bases de datos que recopilan interacciones moleculares, principalmente entre proteínas.
- Obtienen las interacciones a partir de literatura y/o métodos predictivos.
- Aunque las tres tienen el mismo objetivo hay diferencias en los métodos que usan y las redes que se generan son diferentes.

String: https://string-db.org

IntAct: https://www.ebi.ac.uk/intact/

Biogrid: https://thebiogrid.org/

---

# Bases de datos de organismos modelos

## TAIR - The Arabidopsis Information Resource

- TAIR es una base de datos sobre el organismo modelo *Arabidopsis thaliana*
- Contiene:
  - Secuencias y anotaciones del genomas.
  - Productos génicos.
  - Expresión génica.
  - Marcadores fenotípicos.
  - Visualizadores, etc


---

https://www.arabidopsis.org/

## Wormbase

- Es una base de datos del nematodo *C. elegans* y otros relacionados.

- Contiene:
  - Secuencias y anotaciones genómicas.
  - Información de expresión génica.
  - Herramientas para análisis.
  - Mapas genéticos, etc.


https://wormbase.org/

---

## Otras bases de datos de organismos modelos

- Flybase: Base de datos de Drosophila melanogaster y relacionadas.

https://flybase.org/

- Phytozome: Es una colección de genomas de diversas plantas.

https://phytozome-next.jgi.doe.gov/

- Xenbase: Base de datos de Xenopus.

http://www.xenbase.org/entry/
