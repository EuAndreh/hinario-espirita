#!/bin/bash

titulo=$(grep beginsong musicasTex/a-arvore.tex | sed -r 's/.*beginsong\{(.*?)\}.*/\1/')
letra=$(perl -pe 's/\\\w+//' $1 | \
    perl -pe 's/\\\[.*?\]//g' | \
    perl -pe 's/\^//g' | \
    perl -pe 's/.*\\bfseries.*//' | \
    perl -pe 's/\{.*?\}//' | \
    perl -pe 's/$(.*)/  $1/g')
export titulo letra
arquivo_ly=$(basename $1 .tex).ly
envsubst < template-lilypond.ly > "LilyPond/$arquivo_ly"

echo "Arquivo $arquivo_ly gerado."
