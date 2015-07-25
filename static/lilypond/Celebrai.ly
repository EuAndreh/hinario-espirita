\version "2.16.0"
\pointAndClickOff

\header {
  title = "Celebrai"
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
  
  r4 b8 b a( g~) g g | b b b b a4( g) |
  r4 b4 a8 g g g | b b b a~ a g~ g4 |
  r4 c4 c c8 c | c c c c d c~ c4 | 
  r8 d,8 d' d d d~ d d | d d d e~ e d b( a | 
  
  g4) b4 a g8 g | b b~ b a~( a g~ g4) 
  r4 b4 a g8 g | b b b a~ a g~ g4
  r4 c8 c c c~ c c | c c~ c d~ d c~ c4
  r8 d,8 d' d d4. d8 | d d~ d e~( e d b a |
  
  g1)
  \bar "|."
}

letra = \lyricmode {
  Ce -- le -- brai, com jú -- bi -- lo,_o Se -- nhor,  
  Vós to -- dos mo -- ra -- do -- res da Ter -- ra,  
  Ser -- vi o Se -- nhor com a -- le -- gri -- a,  
  A -- pre -- sen -- tai- -- vos a E -- le com cân -- ti -- co.  
    
  Sa -- ber que_o Se -- nhor é bom,  
  E -- ter -- na_é a Su -- a bon -- da -- de,  
  E a Su -- a fi -- de -- li -- da -- de  
  De ge -- ra -- ção a ge -- ra -- ção.  
}

harmonia = \chordmode {
  g\breve e:m c d:7
  g\breve e:m c d:7
  g1
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
