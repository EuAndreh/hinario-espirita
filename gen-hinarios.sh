#!/bin/bash

echo "Hinário espírita com $(ls -l musicasTex/*.tex | wc -l) músicas e $(ls -l LilyPond/*.ly | wc -l) partituras."

printf "Gerando 'musicas.sbd'... "
rm musicas.sbd
for f in $(ls musicasTex); do
  echo "\\include{musicasTex/$f}" | sed -e 's/.tex//' >> "musicas.sbd"
done
printf "pronto.\n"

gen_latex() {
  printf "Gerando '%b'.pdf... " $1
  pdflatex "$1.tex" > /dev/null
  songidx "$1.sxd" 2> /dev/null
  pdflatex "$1.tex" > /dev/null
  printf "pronto.\n"
}

gen_latex "Hinário"
gen_latex "Cifras"
gen_latex "Transparências"
gen_latex "Eslaides"

printf "Gerando 'Partituras.pdf'...\n"
cd LilyPond
rm *.pdf *.midi
for ly in $(ls *.ly); do
  printf "  ${ly%.*}.pdf... "
  lilypond $ly 2> /dev/null
  printf "pronto.\n"
done
cd ../
pdfunite Capa.pdf LilyPond/*.pdf Partituras.pdf
printf "pronto.\n"

if [ "$1" = "--with-ogg" ] || [ "$1" = "-o" ]; then
  printf "Gerando arquivos de áudio Ogg Vorbis...\n"
  cd LilyPond
  rm *.ogg
  for midi in $(ls *.midi); do
    printf "  ${midi%.*}.ogg... "
    timidity $midi -Ov > /dev/null
    printf "pronto.\n"
  done
  cd ../
  printf "pronto.\n"
fi

printf "Removendo arquivos sujeira... "
rm *.aux *.out *.log *.sxd *.sbx *.sxc musicasTex/*.aux
printf "pronto.\n"
