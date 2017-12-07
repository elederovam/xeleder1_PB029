# Makro (proměnná) se jménem dokumentu, které pak můžeme používat dále
# v Makefile zadáním „${NAME}“.
# Hodnoty maker se dají snadno přepisovat při spuštění zpracování Makefile bez
# zázsahu přímo do Makefile tak, že make z příkazového řádku voláme ve tvaru:
#   make NAME=<jiné_jméno> <cíle>
NAME=odplist
PART1=dokument1
PART2=dokument2
BMP=portret.png
VECTOR=hvezdicka
BIB=databaze-literatury.bib

#.DELETE_ON_ERROR: ${PART2}.pdf
#	pdflatex $<
#	while grep 'Rerun to get ' $*.log ; do pdflatex $< ; done
  

# Používej interpret příkazů BASH. (Užitečné zejména na Ubuntu, kde je výchozí
# shell pro make DASH, který není s BASH plně kompatibilní. Některé konstrukce
# pak „záhadně nefungují“, protože si uživatel obvykle neuvědomí, že make
# používá jiný shell než uživatel interaktivně v terminálu.)
SHELL=/bin/bash

# V .PHONY uvádíme „falešné“ cíle, tzn. naše symbolická jména pro cíle, které
# neprodukují stejně pojmenované soubory jako výsledek své činnosti.
#.PHONY: pdf pdf1 pdf2
pdf1: ${PART1}.pdf
pdf2: ${PART2}.pdf
pdf: ${NAME}.pdf

${PART1}.pdf: ${PART1}.tex ${BMP}
	pdflatex ${PART1}.tex
  
${VECTOR}-001.mps: ${VECTOR}.mp
	mpost -tex=latex ${VECTOR}
  
${PART2}.bbl: ${PART2}.bcf
	biber ${PART2}.bcf

${PART2}.bcf: ${PART2}.tex ${BIB}
	pdflatex ${PART2}.tex
  
${PART2}.ind: ${PART2}.idx
	texindy -I latex --language czech --codepage utf8 ${PART2}.idx
  
${PART2}.idx: ${PART2}.tex
	pdflatex ${PART2}.tex

${PART2}.pdf: ${PART2}.tex ${VECTOR}-001.mps ${PART2}.bbl ${PART2}.ind
	pdflatex ${PART2}.tex

${NAME}.pdf: ${NAME}.tex ${PART1}.pdf ${PART2}.pdf scanexam.cls odplist.sty
	pdflatex ${NAME}.tex
 
clean:
	-rm ${NAME}.{aux,blg,dvi,log,out,pdf,ps,run.xml}
	-rm ${PART1}.{aux,blg,dvi,log,out,pdf,ps,run.xml}
	-rm ${PART2}.{aux,bbl,bcf,blg,dvi,idx,ind,log,out,pdf,ps,run.xml}
	-rm ${VECTOR}.log
	-rm ${VECTOR}-001.mps