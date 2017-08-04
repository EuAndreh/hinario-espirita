\header {
  title = \markup { "Pelo Mestre com Amor" }
  composer = "Willi de Barros"
}

melodia = \relative c' {
  \key d \major
  \time 4/4
  \tempo 4 = 110

  fis8 g4 fis8 fis8 e4 d8 e8 fis4 fis8 fis8 e8 d8 e8
  fis8 g 4 fis8 fis8 e4 d8 cis4. d8 r4 d8 e8
  
  fis8 g4 fis8 fis8 e4 d8 e8 fis4 fis8 fis4. d8
  fis8 g4 fis8 fis8 e4 d8 cis4. d8 r4 d8 e8
  
  \repeat volta 2 {
  fis2 g2 a2 b2 cis2 d2~}
  \alternative {
    {d2 r4 d8 e8}
    {d2 r4. d,8}
  }
  g4. fis4 e4 d8 a'2 r8 d,8 d8 d8
  \repeat volta 2{
  a'8 d,2. d8 b'8 a4 g4 fis4 e8~ e2.~ e8 a,8
  a'8 g4 fis4 e4 d8~ d2.~ d8 d8 g8 fis4 e4 d4 a'8~
  a2 g4 fis8 e8~ }
  \alternative{
    {e2 r8 d8 d8 d8}
    {e2. r4}
  }
}




letra = \lyricmode {
  Há-um jar di -- nei -- ro que plan -- ta jar -- dins em ou -- tra 
  ter -- ra com ou -- tra se -- men -- te,
  
  que cul -- ti -- va suas flo -- res em vo -- cê e-em mim,
  que cui -- da de nós pa -- ci -- en -- te.
  
  Es -- pe -- ran -- do nos -- sos bro -- tos
%  A -- guar -- dan -- do a pri -- ma -- ve -- ra
%  Pois tem certeza que
%As nossas flores
%Um dia irão nascer
%Em paz vão florescer
%E seu perfume vai se espalhar
%E será festa em cada coração
%Em que nascer a flor
%Plantada pelo mestre com amor

}

\score {
  <<
    \new Staff <<
      \new Voice = "melodia" { \melodia }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \layout {}
  \midi {}
}
