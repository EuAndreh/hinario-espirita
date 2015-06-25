\version "2.16.0"
\pointAndClickOff

\header {
  title = "Abelhinha"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

melodia = \relative c' {
  \key e \major
  \time 4/4
  \tempo 4 = 110
  \clef treble

  % 1
  r4 e8 e e gis gis gis | gis4. fis8 e2 | 
  a4 a8 a cis4 cis8 cis | b4 b8 a gis4 gis |
  b4 b b b8 cis | b4 a gis e |
  e gis gis gis8 gis | cis,4 dis e e |
  e e e4. e8 | b8 b4 e8~ e2 |
  gis4 gis b4. cis8 | b a4 gis8~ gis2 |
  b4 b b4. cis8 | b8 a4 gis e4. |
  e4 gis gis4. gis8 | cis,8 dis4 e8~ e2 \bar "|."
}

letra = \lyricmode {
  A -- be -- lhi -- nha que me dá o mel,  
  Ra -- io de Sol que_i -- lu -- mi -- na o di -- a.  
  Go -- ta d'á -- gua que ma -- ta_a se -- de,  
  Tam -- bém que -- ro ser -- vir à vi -- da.  
    
  Rá rá rá, vou tra -- ba -- lhar.  
  Rei, rei, rei, se -- me -- a -- rei  
  Ri, ri, ri, com a -- le -- gri -- a,  
  Ro, ro, ro, com mui -- to_a -- mor.    
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  \repeat percent 2 {e1}
  a~ a2 e
  b1:7~ b2:7 e~ e a b:7 e~
  e1 b2:7 e2~
  e1 b2:7 e2~
  e1 b2:7 e2~
  e1 b2:7 e2~
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
