#!/bin/bash

fname=$(basename "$1" .ly)
printf "Gerando '$fname.pdf'... "
cd LilyPond
lilypond "$(basename "$1")"
timidity "$fname.midi" -Ov
cd ../
printf "pronto.\n"
