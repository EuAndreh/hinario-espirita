# Hinário Espírita
Hinário de músicas espíritas

Construído a partir dos programas LaTeX [songs](http://songs.sourceforge.net/), e [LilyPond](http://www.lilypond.org/).

Repositório do site também [disponível](https://github.com/hinario-espirita/hinario-espirita.github.io).

## Executar
Certifique-se que os programas [songs](http://songs.sourceforge.net/), [LilyPond](http://www.lilypond.org/) e [TiMidity++](http://timidity.sourceforge.net/) estão corretamente instalados. Para a edição de partituras, eu recomendo o [Frescobaldi](http://frescobaldi.org/).
```shell
$ git clone https://github.com/EuAndreh/hinario-espirita.git
$ cd hinario-espirita
$ chmod +x hinario.sh 
$ ./hinarios.sh

# Para produzir partituras
$ chmod +x partituras.sh
$ ./partituras.sh

# Para produzir arquivos .ogg
$ ./partituras --with-ogg
# ou
$ ./partituras -o
```

## Contribuindo
Se você gostaria de contribuir, inclua a gravação (na qualidade que for - até uma gravação simples de voz e violão realizada no celular) no pull request para que eu possa conferir =].

Se for escrever tanto a partitura quanto a cifra, esforce-se ao máximo para que o tempo das cifras em ambos fique igual.

Lembre-se de escrever as cifras seguindo o padrão já estabelecido.

### LaTeX
Baseie-se no arquivo `template-latex.tex` para inserir uma nova música.

Detalhes:
- Se possível, ajuste o valor `\Huge` para `\LARGE` ou `\Large` na segunda linha do `template-latex.tex` para que a música ocupe apenas 1 página no arquivo `Transparências.pdf`.

### LilyPond
Baseie-se no arquivo `template-lilypond.ly` para inserir uma nova partitura.

Detalhes:
- Seja detalhista quanto às elisões de sílabas e melismas.
- Lembre-se de marcar as voltas e repetições tanto na melodia, quanto na harmonia.

Se for escrever a partitura de uma música que já existe:
```shell
$ ./extrair-letra.sh musicasTex/nome-da-musica.tex
```

Assim, o arquivo LilyPond da música é criado e a letra já é inserida no local apropriado.

## Licença
[![Creative Commons](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)

## TODO
- Add favicon
- Slides vs Eslaides
- Tìtulo da música clicável
- Explícitar que é um download.
- Consertar índice com prefixo "A" etc. + acentos
- Shrink Sass
- Download fonts
- Checar vírgulas no título
- s/sol/Sol/ s/lua/Lua/
