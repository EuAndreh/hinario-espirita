\version "2.16.0"
\pointAndClickOff

\header {
  title = "Doce"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

melodia = \relative c' {
  \key c \major
  \time 4/4
  \tempo 4 = 72
  \clef treble

  % 1
  c2 e4 f | g1 | a4 g f a | g2( e)|
  c'2 b4 a | g2 e | f4 f e d | c1 |
  
  % 9
  c2 e4 f | g1 | a4 g f a | g2 g|
  c2 b4 a | g2 e | f4 f e d | c2 c |
 
  %17
  r4 e4 f g | e2 e4. e8 | d4 c d4. f8 | e1 |
  r4 e4 f g | e2.. e8 | d4 c d4. c8 | c1 
  \mark \markup { \musicglyph #"scripts.coda" }
  \bar "||"

  c2 e4 f | g2 g | a4 g f a | g2 g|
  c2 b4 a | g2 e | f4 f e d | c2 c |
  
  c2 e4 f | g2 g4. g8 | a4 g f a | g2 g|
  c2 b4 a | g2 e4. e8 | f4 f e d | c2 c |
  c'2 b4 a | g2 e4. e8 | f4 f e d | c2 c \bar "||"
  s1*1^\markup {"D.S. al Coda" }
  \bar "||"
}

letra = \lyricmode {
  Do -- ce_é sen -- tir que_em meu co -- ra -- ção,
  Hu -- mil -- de -- men -- te, vai nas -- cen -- do_a -- mor.
  Do -- ce_é sa -- ber: não es -- tou so -- zi -- nho;
  Sou u -- ma par -- te de_u -- ma_i -- men -- sa vi -- da

  Que, ge -- ne -- ro -- sa, re -- luz de_en -- con -- tro_a mim.
  I -- men -- so dom do Seu a -- mor sem fim.

  O céu nos des -- tes, as es -- tre -- las cla -- ras,
  Nos -- so ir -- mão Sol, nos -- sa_ir -- mã a Lu -- a;
  Nos -- sa mãe Ter -- ra, com fru -- tos cam -- pos, flo -- res;
  O fo -- go_e_o ven -- to, o ar e_a á -- gua pu -- ra:
  Fon -- te de vi -- da de Su -- a cri -- a -- tu -- ra.
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  % 1
  c1 | e:m | f2 g:7 | c1 | 
  a1:m | e:m | f2 g:7 | \repeat percent 2 {c1} |

  e:m | f2 g:7 | c1 | 
  a:m | e:m | f2 g:7 | c1 
  \mark \markup { \musicglyph #"scripts.segno" }
  \bar "||"

  % 17
  a:m | e:m | f2 g:7 | c1 |
  a:m | e:m | f2 g:7 | \repeat percent 2 {c1} |

  | e:m | f2 g:7 | c1 | 
  a:m | e:m | f2 g:7 | \repeat percent 2 {c1} |
  
  e:m | f2 g:7 | c1 | 
  a:m | e:m | f2 g:7 | c1 |
  a:m | e:m | f2 g:7 | c1 |
}

\score {
  <<
    \new ChordNames { \harmonia }
    \new Staff <<
      \new Voice = "melodia" { \melodia }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \layout {}
  \midi {}
}
