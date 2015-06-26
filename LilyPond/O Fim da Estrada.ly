\version "2.16.0"
\pointAndClickOff

\header {
  title = "O Fim da Estrada"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
  copyright = \markup {
    \with-url #"https://creativecommons.org/licenses/by-sa/4.0/"
    \line { "Creative Commons Attribution ShareAlike" }
  }
}

melodia = \relative c'' {
  \key g \major
  \time 4/4
  \tempo 4 = 140
  \clef treble

  % Primeira estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis1 |
  g8 g4 g4. e4 |

  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis |
  g4 g8 g~ g4 fis | a1~ | a2. g8 g |

  b4 b8 b~ b4 c | a4. g8 r4 g8 g | b4. b c4 | a2 a4 g4 | a1~ | a \bar "||"

  % Segunda estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis |
  g g4 g4. e4 |

  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis |
  g4 g8 g~ g4 fis | a1~ | a \bar "||"

  % Refrão 1
  r4 b8 a4 b4. | r4 b8 a4 b4. | r4 c8 c c c4 d8 | b2 b4 g |
  g4 b8 a4 b4. | r4 b8 a4 b4. | r4 c8 c c c4 d8 | b4. a4 b g8 |
  g4~ g2.~   \mark \markup { \musicglyph #"scripts.segno" } \bar "||" g1 |

  \compressFullBarRests
  R1*7

  % Interlúdio, parte 1
  r4 g8 g g g4 a8 | fis4. d8~ d4 d | e4 e8 e e4( c8) d8~ | d1 |
  r4 g8 g g g4 a8 | fis4. d d4 | g2. fis4 | a1~ | a2. g8 g \bar "||"

  % Interlúdio, parte 2
  g4 g8 g4 fis g8~ | g4( e8 d~ d4.) a'8 | b4 b8 b4 c b8~ | b2. b8 b | c4 c8 c4 b c8~ |
  c2. c8 c | e4 d8 d4 c d8~ | d1 \bar "||"

  % Refrão 2
  r4 \repeat volta 2 { b8 a4 b4. | r4 b8 a4 b4. | \times 2/3 { c4 c c } c8 c4 d8 | b4. a4 b g8 |
  g4 b8 a4( b4.) | r8 b4 a b4. | r4 c8 c c c4 d8 | b4. a4 b g8 |
  s1*0^\markup { \center-column { "D.S. al fine" } }
  g4~ }

  \repeat volta 2 { g2.~ |
  g1 |
  r4 c8 c c c4 d8 | b4. a4 b g8 | g4~ } g2.
  \bar "|."
}

letra = \lyricmode {
  Se vo -- cê quer a -- cre -- di -- tar nu -- ma luz que há
  Den -- tro de ca -- da um de nós bas -- ta ver em ca -- da~o lhar
  Que há sem -- pre uma~es -- pe -- ran -- ça,
  E uma no -- va cri -- an -- ça~a nas -- cer.
  Se~o teu ca -- mi -- nho~es -- cu -- re -- cer, nun -- ca pa -- re de can -- tar
  Que sem -- pre há de~a -- ma -- nhe -- cer e a luz te vol -- ta -- rá.

  É noi -- te,  é di -- a,  sem -- pre~há tem -- po pra re -- co -- me -- çar.
  De noi -- te,  de di -- a,  sei que~e -- xis -- te~u -- ma~es -- tre -- la~a nos gui -- ar.

  Sem -- pre vou te se -- guin -- do, mi -- nha~es -- tre -- la gui -- a
  Nes -- se lon -- go ca -- mi -- nho que não tem fim.
  Quan -- to tem -- po vou vi -- ver a -- té te en -- con -- trar?
  Só o tem -- po vai di -- zer
  E~es -- se di -- a vai che -- gar

  A -- mi -- go,  co -- mi -- go vai a -- cen -- der a~es -- pe -- ran -- ça de che -- gar.
  É~o fim da~es -- tra -- da,  que~é um no -- vo co -- me -- ço que vi -- rá.

  que~é um no -- vo co -- me -- ço que vi -- rá.
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }

  % Primeira estrofe
  g1:6 e:m7 b:m7 c:maj7
  g1:6 e:m7 b:m7 c:maj7  \repeat percent 2 {c:m6}
  b:m7 c:maj7 b:m7 c:maj7 \repeat percent 2 {d:7}

  % Segunda estrofe
  g1:6 e:m7 b:m7 c:maj7
  g1:6 e:m7 b:m7 c:maj7 \repeat percent 2 {c:m6}

  % Refrão 1
  g:6 e:m7 c:6 d:7.9
  g:6 e:m7 c:6 d:7.9 g:6
  e:m7 c:maj7 d:7.9 g:6
  e:m7 c:maj7 \repeat percent 2 {d:7.9}

  % Interlúdio 1
  c:maj7 b:m7 c:maj7 b:m7
  c:maj7 b:m7 c:maj7 \repeat percent 2 {c:m6}

  % Interlúdio 2
  \repeat percent 2 {a:m7} \repeat percent 2 {b:m7} \repeat percent 2 {c:6} \repeat percent 2 {d:7.9}

  % Refrão 2
  g4:6
  \repeat volta 2 {
    s2. e1:m7 c:6 d:7.9
    g:6 e:m7 c:6 d:7.9 g4:6
  }
  \repeat volta 2 {
    s2.
    e1:m7 c:6 d:7.9 g4:6
  }
}

musica =  <<
    \new ChordNames { \harmonia }
    \new Staff <<
      \new Voice = "melodia" { \melodia }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
\score {
  \musica
  \layout {}
}

\score {
  \unfoldRepeats
  \musica
  \midi {}
}
