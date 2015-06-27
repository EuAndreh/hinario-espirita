\version "2.16.0"
\pointAndClickOff

\header {
  title = "O Brilho da Estrela"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  composer = "Alexandre Lacerda"
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
  copyright = \markup {
    \with-url #"https://creativecommons.org/licenses/by-sa/4.0/"
    \line { "Creative Commons Attribution ShareAlike" }
  }
}

melodia = \relative c' {
  \key g \major
  \time 4/4
  \tempo 4 = 100
  \clef treble
  
  \partial 8. d16 e fis |
  
  g8 g b, c~ c c e d~ | d2. r16 d e fis | g8 g~ g g~ g g a e~( | e d~) d2 r8 e16 fis |
  g8 g g g~ g g g b~ | b c d a( g4) r8 g16 a | b8 b b a~ a g e a~ | a2. r8 g16 a | 
  % novo dia rapidinho? 
  b8 d~ d a~ a g g e'~ | e d b d~ d a~ a8. a16  | b8 b b a~ a g g e16 g16~ | g8 g a a~ a4 r8 b16 a |
  g8 g g g~ g4~ g8 e'~ | e d b d~ d a r8 a16 b | c8 c c c~ c d e e~( | e d~) d2.~ | d2. r8 b16 c 
  
  \repeat volta 2 {
    d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~ | a2. r8 b16 a |
    g8 g g g~ g g~ g e'~ | e d b d~ d4 r16 a16 a b 
  }
  \alternative {
    { c8 c c c~ c b c a~ | a2. r8 b16 c }
    { c8 c d, a'8~ a g fis g~ | g1 }
  }
  \bar "|."
}

letra = \lyricmode {
  Em cer -- tos di -- as a pres -- sa~é mai -- or.
  Ou a tris -- te -- za quer nos ven -- cer.
  Um pro -- ble -- ma bem sim -- ples pa -- re -- ce pi -- or
  É a ho -- ra~en -- tão de~a -- cre -- di -- tar
  
  Que a tem -- pes -- ta -- de não cai pa -- ra sem -- pre
  % E depois ou Depois????
  E de -- pois da noi -- te~um no -- vo di -- a vi -- rá
  Há~u -- ma for -- ça mai -- or den -- tro da gen -- te
  Que nos le -- va a re -- co -- me -- çar
  
  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  E tu -- do~em vol -- ta se~i -- lu -- mi -- na -- rá. 
  
  Quan -- do_a
  vol -- ta se~i -- lu -- mi -- na -- rá.
}

harmonia = \chordmode {
  s8.
  g4. c2 s8 | g4. d2 s8 | g4. c2 s8 | g4. d2 s8 | 
  g4. c2 s8 | g4. d2 s8 | g4. c2 s8 | d1:7 | 
  e4.:m c2 s8 | g4. d2 s8 | e4.:m c2 s8 | g4. d2 s8 | 
  e4.:m c2 s8 | g4. d2 s8 | c1 | \repeat percent 2 {d1:7}
  
  \repeat volta 2 {
    g4. c2 s8 | g4. d2 s8 | g4. c2 s8 | d1:7 | 
    e4.:m c2 s8 | g4. d2 s8
  }
  \alternative {
    { c1 | d:7 }
    { c4. d2:7 s8 | g }
  }
}

musica = <<
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