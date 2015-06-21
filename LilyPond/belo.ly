\version "2.16.0"

\pointAndClickOff

\header {
  title = "Belo"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://euandre.org/hinario-espirita"
    \line { "euandre.org/hinario-espirita" }
  }
}

melodia = \relative c' {
  \key d \major
  \time 6/8
  \tempo 4 = 60
  \clef treble

  % 1
  \clef treble
  d4.~ d8 d d | d4.~ d8 cis d | fis4.~ fis8 e d | a4.~ a8 d d |
  d4.~ d8 d d | d4.~ d8 cis d | a'4.~ a8 g fis | e4.~ e4 a8 |
  a4.~ a8 g a | b8 b4~ b4 a8 | g4.~ g8 e g | a4.~ a4 g8 |
  fis4.~ fis8 fis fis | fis fis4~ fis8 g fis | e e e e fis e | a( b a g fis e) |
  \bar "||"
  d4.~ d8 d d | d4.~ d8 cis d | fis4.~ fis8 e d | a4.~ a8 d d |
  d4.~ d8 d d | d8 d4~ d8 cis d | a'4.~ a8 g fis | e4.~ e4 a8 |
  a4.~ a8 g a | b8 b4~ b4 a8 | g4.~ g8 e g | a4.~ a4 g8 |
  fis4.~ fis8 fis fis | fis4.~ fis4 a8 | g2. | cis, | d |
}

letra = \lyricmode {
  Be -- lo pra mim é cri -- an -- ça_a brin -- car,
  É ou -- vir mil can -- ções nu -- ma con -- cha de mar,
  É chu -- va ca -- in -- do, é cam -- po em flor,
  E,_a -- ci -- ma de tu -- do, é o_a -- mor, é o_a -- mor, é o_a -- mor...

  Be -- lo pra mim, quan -- do_es -- tou a so -- frer,
  É nas tre -- vas da al -- ma que_eu co -- me -- ço_a cres -- cer.
  Lem -- brar com_a -- le -- gri -- a, que_a -- lém, mui -- to_a -- lém,
  À_es -- pe -- ra de mim e -- xis -- te_al -- guém.
  
  Lá lá lá iá, al -- guém, lá lá lá iá, al -- guém.
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  d2. | b:m7 | e:m7 | a:7 |
  d | b:m7 | e:m7 | a:7 |
  d | b:m7 | e:m7 | a:7 |
  d | b:m7 | e:m7 | a:7 |

  d | b:m7 | e:m7 | a:7 |
  d | b:m7 | e:m7 | a:7 |
  d | b:m7 | e:m7 | a:7 |
  d | b:m7 | e:m7 | a:7 |

  d | b:m7 | e:m7 | a:7 |
  d
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
