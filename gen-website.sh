#!/bin/bash

printf "Copiando pdfs..."
cp ../hinario-espirita/Hinário.pdf .
cp ../hinario-espirita/Cifras.pdf .
cp ../hinario-espirita/Transparências.pdf .
cp ../hinario-espirita/Slides.pdf .
cp ../hinario-espirita/Capa/Cartaz.pdf .
printf "pronto.\n"

printf "Copiando midis e oggs..."
cp ../hinario-espirita/LilyPond/*.pdf partituras/data/
cp ../hinario-espirita/LilyPond/*.ogg partituras/data/
cp ../hinario-espirita/LilyPond/*.midi partituras/data/
printf "pronto.\n"

printf "Compilando Sass... "
sass style.sass style.css
printf "pronto.\n"

printf "Compilando HAML... "
haml index.haml index.html
haml partituras/index.haml partituras/index.html
printf "pronto.\n"

printf "Removendo arquivos sujeira... "
rm style.css.map
rm -rf .sass-cache/
printf "pronto.\n"
