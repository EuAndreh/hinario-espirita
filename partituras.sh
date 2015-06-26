#!/bin/bash

printf "Gerando 'Partituras/Partituras.pdf'...\n"
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
cd LilyPond
for ly in $(ls *.ly); do
  printf "  ${ly%.*}.pdf... "
  lilypond $ly 2> /dev/null
  printf "pronto.\n"
done
cd ../
printf "pronto.\n"

if [ "$1" = "--with-ogg" ] || [ "$1" = "-o" ]; then
  printf "Gerando arquivos de áudio Ogg Vorbis...\n"
  cd LilyPond
  for midi in $(ls *.midi); do
    printf "  ${midi%.*}.ogg... "
    timidity $midi -Ov > /dev/null
    printf "pronto.\n"
  done
  cd ../
  printf "pronto.\n"
fi

pdfunite Capa/Capa.pdf LilyPond/*.pdf Partituras.pdf

IFS=$SAVEIFS

echo "'Partituras.pdf' com $(ls -l LilyPond/*.ly | wc -l) músicas."
