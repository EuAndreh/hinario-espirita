# hinario-espirita - Spiritist Songbook website
[![Build Status](https://travis-ci.org/EuAndreh/hinario-espirita.svg?branch=master)](https://travis-ci.org/EuAndreh/hinario-espirita)
[![Circle CI](https://circleci.com/gh/EuAndreh/hinario-espirita.svg?style=svg)](https://circleci.com/gh/EuAndreh/hinario-espirita)
[![Coverage Status](https://coveralls.io/repos/EuAndreh/hinario-espirita/badge.svg?branch=master)](https://coveralls.io/r/EuAndreh/hinario-espirita?branch=master)

## TODO
- Rock
- qlot
- Roswell. ros scripts?... in process
- roswell + Server::Starter: start_server clackup
- refactor sass: deixar link ser comprido, footer layout, teirar borda do qrcode
- add docstrings
- refactor scripts: consertar bonecos
- Add https
- escrever (muitos) testes e usar travis, circle e coveralls
- upar readme (em inglês?)
- lquery: http://jquery-plugins.net/jquery-confirm-multipurpose-web-alert-and-confirm
- fazer gerador hinário geral em múltiplos idiomas
- Fazer favicon
- fazer codex
- Clake?
- Fazer uma struct de idioma
- Usar digital ocean

## Usage
```lisp
* (ql:quickload :hinario-espirita)
; => (:HINARIO-ESPIRITA)
* (hinario-espirita:start)
; => T
```
Go to [http://localhost:1111](http://localhost:1111)

## Author
+ [André Miranda](https://github.com/EuAndreh)

## License
[LLGPL](https://tldrlegal.com/license/lisp-lesser-general-public-license#fulltext).
