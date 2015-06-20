#!/bin/bash

printf "Gerando 'musicas.sbd'... "
rm musicas.sbd
for f in $(ls musicasTex); do
  echo "\\include{musicasTex/$f}" | sed -e 's/.tex//' >> "musicas.sbd"
done
printf "pronto.\n"

printf "Gerando 'Hinario Cifrado.pdf'... "
pdflatex Hinário\ Cifrado.tex > /dev/null
songidx cbtitle.sxd 2> /dev/null
pdflatex Hinário\ Cifrado.tex > /dev/null
printf "pronto.\n"

printf "Gerando 'Hinário.pdf'... "
pdflatex Hinário.tex > /dev/null
songidx lbtitle.sxd 2> /dev/null
pdflatex Hinário.tex > /dev/null
printf "pronto.\n"

printf "Gerando 'Transparências.pdf'... "
pdflatex Transparencias.tex > /dev/null
printf "pronto.\n"

printf "Gerando 'Eslaides.pdf'... "
pdflatex Eslaides.tex > /dev/null
printf "pronto.\n"

printf "Gerando 'Partituras.pdf'... "
cd Lilypond
lilypond *.ly 2> /dev/null
cd ../
pdfunite capa.pdf Lilypond/*.pdf Partituras.pdf
printf "pronto.\n"

printf "Removendo arquivos sujeira... "
rm *.aux *.out *.log *.sxd *.sbx *.sxc musicasTex/*.aux
printf "pronto.\n"
