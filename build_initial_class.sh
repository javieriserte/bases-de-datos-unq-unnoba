pandoc -f markdown \
	-t beamer \
	--pdf-engine=xelatex \
	-o 00_clase_inicial.pdf \
	00_clase_inicial.md