#!/bin/bash

data_folder=../../hinario-espirita.github.io/partituras/data

fname=${1%.*}
printf "Gerando '$fname.pdf'... "
lilypond "$1"
timidity "$fname.midi" -Ov
mv "$fname.ogg" $data_folder
mv "$fname.midi" $data_folder
mv "$fname.pdf" $data_folder
pdfunite ../Capa/Capa.pdf ../../hinario-espirita.github.io/partituras/data/*.pdf ../Partituras.pdf
printf "pronto.\n"
