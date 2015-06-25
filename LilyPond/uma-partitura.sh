#!/bin/bash

fname=${1%.*}
printf "Gerando '$fname.pdf'... "
lilypond "$1"
timidity "$fname.midi" -Ov
mv "$fname.ogg" ../Partituras/audio/
mv "$fname.midi" ../Partituras/midi/
mv "$fname.pdf" ../Partituras/pdf/
pdfunite ../Capa/Capa.pdf ../Partituras/pdf/*.pdf ../Partituras/Partituras.pdf
printf "pronto.\n"
