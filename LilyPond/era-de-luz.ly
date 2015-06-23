\version "2.16.2"
\pointAndClickOff

\header {
  title = "Era de Luz"
  composer = "Alexandre Paredes"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  fis1:m7 cis:m7 d:maj7 e:7
  fis1:m7 cis:m7 d:maj7 e:7
  b:m7 cis:m7 d:maj7 f:dim
  a cis:min7/gis fis:m7 fis:m7/e
  d:maj7 a/cis b:m7.9 e2:7sus4.9 e2:7.9

  % Refrão
  d1:maj7 e:7 cis:m7 fis:m7
  d:maj7 e:7 fis:7sus4.9 fis:7.9
  d:maj7 e:7 cis:m7 fis:m7
  b:m7.9 e2:7sus4.9 e:7.9 \repeat percent 2 {a1}

  % Estrofe 2
  fis1:m7 cis:m7 d:maj7 e:7
  fis1:m7 cis:m7 d:maj7 e:7
  b:m7 cis:m7 d:maj7 f:dim
  a cis:min7/gis fis:m7 fis:m7/e
  d:maj7 a/cis b:m7.9 e2:7sus4.9 e2:7.9

  % Refrão
  d1:maj7 e:7 cis:m7 fis:m7
  d:maj7 e:7 fis:7sus4.9 fis:7.9
  d:maj7 e:7 cis:m7 fis:m7
  b:m7.9 e2:7sus4.9 e:7.9 a1:6 a:7.13- a:6

}

letra = \lyricmode {
  É fi -- nal,  si -- nal de~u -- ma no -- va e -- ra que vi -- rá.
  Her -- da -- rá  a nos -- sa Ter -- ra quem ti -- ver no co -- ra -- ção
  A man -- si -- dão, o bem e~o a -- mor,
  Dei -- xar pa -- ra trás a dor e~a~i -- lu -- são.
  O~úl -- ti -- mo bon -- de vai pas -- sar % o ultimo?
  Le -- van -- do quem não ti -- ver em si
  A E -- ra de Re -- ge -- ne -- ra -- ção

  Da~es -- cu -- ri -- dão nas -- ce u -- ma~es -- tre -- la,
  É nos -- sa Ter -- ra de a -- ma -- nhã.
  Dei -- xa~eu con -- tar, não há ne -- nhum se -- gre -- do:
  Bus -- ca a luz quem quer a luz.

  To -- da luz  nas -- ceu um di -- a~em me -- io~às tre -- vas.
  Se~ho -- je~a dor  pa -- re -- ce mais for -- te
  É por -- que~es -- pe -- ra de to -- dos nós % porque ao inv´es de que???
  A de -- cis -- ão de re -- no -- va -- ção,
  Plan -- tar a se -- men -- te vi -- va do~a -- mor.
  Da tem -- pes -- ta -- de, nas -- ce~a flor,
  E sem a -- lar -- de há de sur -- gir
  O bem, a ver -- da -- de, a paz e~a luz.

  Da~es -- cu -- ri -- dão nas -- ce u -- ma~es -- tre -- la,
  É nos -- sa Ter -- ra de a -- ma -- nhã.
  Dei -- xa~eu con -- tar, não há ne -- nhum se -- gre -- do:
  Bus -- ca a luz quem quer a luz.
}

melodia = \relative c' {
  \clef treble
  \key a \major
  \time 4/4
  \tempo 4 = 140

  % Estrofe 1
  fis4 cis8 e~ e2~ | e4 r8 cis8 cis d e d~ | d8 cis4 b a b8~ | b cis4 cis4. r4 |
  fis4 gis8 e~ e2~ | e4 r4 cis8 d e d~ | d8 cis4 b a cis8~ | cis b4 a gis fis8~ |
  fis4 r4 fis8 gis a gis~ | gis b4 b a8 gis a~ | a4 r8 d,8 d fis cis' b~ | b cis4 cis b a8~ |
  a8 cis4 r8 e8 d cis b~ | b cis4 cis4. a8 a~ | a4 r8 e'8 e d cis b~ | b cis4 cis4. a8 a~ |
  a4 r8 fis'8 fis e d cis~ | cis4. e4 d8 cis b~ | b1 | r1 \bar "||"

  % Refrão
  r2 a8 d a' gis~ | gis4. gis4 a8 b gis~ | gis8 b2.. | a1 |
  r2 a,8 d a' gis~ | gis b4 b a gis8 | fis1 | r1 |
  r2 a,8 d a' gis~ | gis4 gis8 gis4 a8 b gis~ | gis8 b2( cis4) cis8~ | cis1 |
  r2 e8 d cis d~ | d cis4 b a a8~ | a1 | r1 \bar "||"

  % Estrofe 2
  fis4 cis8 e~ e2~ | e4 r4 cis8 d e d~ | d8 cis4 b a b8~ | b( cis4) cis4. r4 |
  fis4 gis8 e~ e2~ | e4 r8 cis8 cis d e d~ | d8 cis4 b a8 a cis8~ | cis b4 a gis8 gis4 |
  fis4 r4 fis8 gis a gis~ | gis b4 b a4 gis8 | a4 r8 d,8 d fis cis' b~ | b cis4 cis b a8 |
  cis4 r4 e8 d cis b~ | b cis4 cis4. a8 a~ | a4 r4 e'8 d cis b~ | b cis4 cis4 cis8 a a~ |
  a4 r8 fis'8 fis e d cis~ | cis4 e8 e4 d8 cis b~ | b1 | r1 |%\bar "||"

  % Refrão
  \repeat volta 2 {
    r2 a8 d a' gis~ | gis4. gis4 a8 b gis~ | gis8 b2.. | a1 |
    r2 a,8 d a' gis~ | gis b4 b a gis8~ | gis fis2.. | r1 |
    r2 a,8 d a' gis~ | gis gis4 gis4 a8 b gis~ | gis8 b2( cis4) cis8~ | cis1 |
    r2 e8 d cis d~ | d cis4 b a a8~ | a1 | }
  \alternative {
   { r1 | }
   { r1 | }}
    \bar "||"
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

