#!/bin/bash

printf "Gerando 'musicas.sbd'... "
rm musicas.sbd
for f in $(ls musicasTex/*.tex); do
  echo "\\include{$f}" | sed -e 's/.tex//' >> "musicas.sbd"
done
printf "pronto.\n"

gen_song() {
  printf "Gerando '%b.pdf'... " "$1"
  pdflatex -halt-on-error "$1.tex" > /dev/null
  songidx "Indice$(echo $1 | sed 'y/áê/ae/').sxd" 2> /dev/null
  pdflatex -halt-on-error "$1.tex" > /dev/null
}

gen_latex() {
  gen_song $1
  printf "pronto.\n"
}

gen_boneco() {
  gen_song "$1"
  ./boneco.pl "$1.pdf"
  printf "pronto.\n"
}

gen_latex "Hinário"
gen_latex "Cifras"
gen_latex "Transparências"
gen_latex "Slides"

gen_boneco "HinárioBoneco"
gen_boneco "CifrasBoneco"

printf "Removendo arquivos sujeira... "
rm *.aux *.out *.log *.sxd *.sbx *.sxc musicasTex/*.aux
printf "pronto.\n"

echo "'Hinário Espírita' com $(ls -l musicasTex/*.tex | wc -l) músicas."
