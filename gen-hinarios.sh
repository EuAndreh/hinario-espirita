#!/bin/bash

printf "Gerando 'musicas.sbd'... "
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
pdflatex Transparências.tex > /dev/null
printf "pronto.\n"

printf "Gerando 'Eslaides.pdf'... "
pdflatex Eslaides.tex > /dev/null
printf "pronto.\n"

printf "Gerando 'Partituras.pdf'... "
cd LilyPond
rm *.pdf *.midi
lilypond *.ly 2> /dev/null
cd ../
pdfunite Capa.pdf LilyPond/*.pdf Partituras.pdf
printf "pronto.\n"

if [ "$1" = "--with-ogg" ]; then
  printf "Gerando arquivos de áudio Ogg Vorbis...\n"
  cd LilyPond
  rm *.ogg
  for midi in $(ls *.midi); do
    printf "  $midi... "
    timidity $midi -Ov > /dev/null
    printf "pronto.\n"
  done
  cd ../
  printf "pronto.\n"
fi

printf "Removendo arquivos sujeira... "
rm *.aux *.out *.log *.sxd *.sbx *.sxc musicasTex/*.aux musicas.sbd
printf "pronto.\n"
