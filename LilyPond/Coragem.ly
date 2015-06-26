\version "2.16.0"
%\pointAndClickOff

\header {
  title = "Coragem"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

melodia = \relative c'' {
  \key e \major
  \time 4/4
  \tempo 4 = 70
  \clef treble

  \partial 16 gis16 |
  gis8 a16 gis~ gis e8 e16~ e2
  fis8 fis16 fis~ fis e8 fis16~ fis4. r16 gis16 |
  gis8 e16 e~ e cis8 e16~ e16 e8.~ e8 cis16 dis |
  e16 e8 e16~ e e8. r8 a16 a a8 b | gis1
  
  b8 b16 b~ b gis8 b16~ b4. b16 b |
  b8 fis16 fis~ fis gis8 fis16~ fis4. r16 gis16 |
  gis gis8 gis16 gis8 e16 e~ e2
  e8 e e e e4 a8 b | gis1 |
  
  b8 b16 b~ b gis8 b16~ b4 gis8 e |
  fis16 fis8 fis16 fis8 gis16 fis~ fis4 \times 2/3 { fis8 gis fis }
  e8 cis~ cis2 r8 cis16 dis | e8 fis16 e~ e2. | 
  r8. fis16 fis fis8 e16 fis8 fis r16 e16 fis e | gis4 fis8 e16 fis~ fis fis8. r8 fis16 fis |
  fis8 e16 e~ e2 a8 b | gis4.( fis16 e fis4. e16 dis | cis1) | r1 |
  
  b'8 b16 b~ b gis8 b16~ b4. b16 b | b8 fis16 fis16~ fis gis8 a16 gis8 fis r16 e16 fis e |
  gis8 e16 e~ e cis8 e16~ e4. r16 e16 | e16 e8 e16~ e e8 e16~ e4 a8 b |
  gis16 e8 e16 e2 r8. b16 | b' b8 b16~ b b gis8 b4. r16 b16 |
  b8 fis16 fis~ fis gis8 fis16~ fis4. r16 gis16 | gis16 gis8 gis16 gis e8 e16~ e4 r8 cis16 dis | 
  e16 e8 e16 e e8 e16 r8 a8 a b | gis8 e16 e~ e cis8 e16~ e2(
  dis1) | gis( | e2) r8 a8 a b | gis8 e16 e~ e cis8 e16~ e2
  
  
}

letra = \lyricmode {
  Co -- ra -- gem, meu ir -- mão, o -- lhe pra vo -- cê.  
  En -- con -- tre seu ca -- mi -- nho, vi -- va su -- a vi -- da,  
  A -- me seu ir -- mão.  
    
  Fé no a -- ma -- nhã, pois a paz i -- rá rei -- nar.  
  Um mun -- do me -- lhor vi -- rá, dis -- se nos -- so Mes -- tre Je -- sus.
    
  O -- lhe pa -- ra_o al -- to e ve -- ja co -- mo re -- luz a -- que -- la_es -- tre -- la.  
  Ve -- ja_o Sol bri -- lhar, as flo -- res se_a -- brin -- do,  
  U -- ma cri -- an -- ça sor -- rin -- do, e os pás -- sa -- ros a can -- tar.
    
  Vem me dê a mão, ca -- mi -- nhe -- mos jun -- tos sem me -- do.
  O E -- van -- ge -- lho_é nos -- sa luz, o lu -- me que con -- duz ao ca -- mi -- nho_a se -- guir.  
    
  U -- na -- mos os co -- ra -- ções, e, jun -- tos, va -- mos ver  
  Um mun -- do no -- vo cres -- cer pa -- ra_a -- que -- les que sa -- bem ter  
  A es -- pe -- ran -- ça de_um cris -- tão.  
  
  Uh A es -- pe -- ran -- ça de_um cris -- tão.
}

harmonia = \chordmode {
  s16
  e1 b cis:m a \repeat percent 2 {e}
  b cis:m a \repeat percent 2 {e}
  b cis:m a fis:m b a
  e2 b cis1:m a
  e1 b cis:m a \repeat percent 2 {e}
  b cis:m a e
  b cis:m a \repeat percent 2 {e}

  
  
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
