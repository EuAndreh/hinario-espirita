#!/bin/bash

fname=`basename $1 .tex`
titulo=$(grep beginsong musicasTex/a-arvore.tex | sed -r 's/.*beginsong\{(.*?)\}.*/\1/')
letra=$(perl -pe 's/\\\w+//' $1 | \
    perl -pe 's/\\\[.*?\]//g' | \
    perl -pe 's/\^//g' | \
    perl -pe 's/.*\\bfseries.*//' | \
    perl -pe 's/\{.*?\}//')
export titulo letra
envsubst < template-lilypond.ly > "LilyPond/$fname.ly"
