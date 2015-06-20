# Hinário Espírita
Hinário de músicas espíritas

Construído a partir dos programas LaTeX [songs](http://songs.sourceforge.net/), e [Lilypond](http://www.lilypond.org/).

## Executar
Certifique-se que os programas [songs](http://songs.sourceforge.net/) e [Lilypond](http://www.lilypond.org/) estão corretamente instalados.
```shell
$ git clone https://github.com/EuAndreh/hinario-espirita.git
$ cd hinario-espirita
$ chmod +x gen-hinario.sh
$ ./gen-hinarios.sh
```

## Contribuindo
Se você gostaria de contribuir, inclua a gravação (na qualidade que for - até uma gravação simples de voz e violão realizada no celular) no pull request para que eu possa conferir =].

Lembre-se de escrever as cifras no padrão das publicações do Almir Chediak.

### LaTeX
Baseie-se no arquivo `template-latex.tex` para inserir uma nova música.

Detalhes:
- O nome do arquivo não deve possuir espaços nem acentos. De preferência, usar somente letras minúsculas. Já o nome da música dentro do `\beginsong{}` no arquivo pode ter tanto acentos quanto espaços.
- Se possível, ajuste o valor `\Huge` para `\LARGE` ou `\Large` na segunda linha do `template-latex.tex` para que a música ocupe apenas 1 página no arquivo `Transparências.pdf`.

### Lilypond
Baseie-se no arquivo `template-lilypond.ly` para inserir uma nova partitura.

Detalhes:
- O nome do arquivo é livre. Buscando consistência, uso o mesmo padrão que os arquivos LaTeX: letras minúsculas, sem espaços e sem acentos.
- Seja detalhista quanto às elisões de sílabas e melismas.

## Licença
[![Creative Commons](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)

## TODO
- custom domain
- capa
- website
  - "Propaganda"
  - Estímulo à divulgação
  - Estímulo à contribuição: nome+gravação, hinário + gravação
