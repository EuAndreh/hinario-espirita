#!/bin/bash

fname=${1%.*}
printf "Gerando '$fname.pdf'... "
lilypond "$1"
timidity "${1%.*}.midi" -Ov
printf "pronto.\n"
