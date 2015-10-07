\version "2.16.0"
\pointAndClickOff

\header {
  title = "Dê Um Sorriso"
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
  \key d \major
  \time 4/4
  \tempo 4 = 150
  \clef treble
  
  \partial 2. a4 fis d 
  \repeat volta 2 {
    e e8 e~ e e d cis | d4 d4. fis8 e d |
    e4 e8 e~ e e d cis
  }
  \alternative {
    { d4 a' fis d } 
    { d4 d cis b }
  }
  a4 cis8 cis~ cis cis b cis | d4 fis8 fis fis e fis g~ |
  g e g g g fis g a~ | a4 a fis d | 
  e4 g8 g~ g e d cis | d4 fis8 fis fis e fis g~ |
  \repeat volta 2 {
    g e e e e d cis d~
  }
  \alternative {
    { d4 fis8 fis fis e fis g }
    { d1 }
  }
  \bar "|."
}

letra = \lyricmode {
  Dê um sor -- ri -- so só,  
  Sor -- ri -- so_a -- ber -- to,  
  Sor -- ri -- so cer -- to, chei -- o de a -- mor.
  Dê um sor -- mor.
    
  Quem tem Je -- sus e gos -- ta de can -- tar  
  Es -- tá sem -- pre sor -- rin -- do, mes -- mo quan -- do não dá.  
    
  Tro -- pe -- ça_a -- qui, ho! ho!  
  Cai a -- co -- lá!  
  Mas de no -- vo le -- van -- ta_E con -- ti -- nu -- a_a can -- tar.
  Mas de no -- vo le -- van
}

harmonia = \chordmode {
  s2.
  \repeat volta 2 {
    a1:7 d a:7
  } 
  \alternative {
    { d }
    { d }
  }
  a:7 d a:7 d a:7 d 
  \repeat volta 2 {
    a:7
  }
  \alternative {
    { d }
    { d }
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
