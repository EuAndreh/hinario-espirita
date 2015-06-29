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
  printf "Gerando arquivos de áudio...\n"
  cd LilyPond
  for midi in $(ls *.midi); do
    printf "  ${midi%.*}.ogg... "
    timidity $midi -Ov > /dev/null
    printf "pronto.\n"

    printf "  ${midi%.*}.wav... "
    timidity $midi -Ow > /dev/null
    printf "pronto.\n"

    printf "  ${midi%.*}.mp3... "
    lame "${midi%.*}.wav" "${midi%.*}.mp3" 2> /dev/null
    rm "${midi%.*}.wav"
    printf "pronto.\n\n"
  done
  cd ../
  printf "pronto.\n"
fi

IFS=$SAVEIFS

echo "'Partituras.pdf' com $(ls -l LilyPond/*.ly | wc -l) músicas."
