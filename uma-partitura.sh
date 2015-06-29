#!/bin/bash

fname=$(basename "$1" .ly)
printf "Gerando '$fname.pdf'... "
cd LilyPond
lilypond "$(basename "$1")"
timidity "$fname.midi" -Ov
timidity "$fname.midi" -Ow
lame "$fname.wav" "$fname.mp3"
rm "$fname.wav"
cd ../
printf "pronto.\n"
