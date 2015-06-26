\version "2.16.0"
\pointAndClickOff

\header {
  title = "Olhe para o Céu"
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

melodia = \relative c' {
  \key d \minor
  \time 4/4
  \tempo 4 = 80
  \clef treble

  r4 f16 e d e f2 | r4 f16 e d e f2 | r4 g16 f e f g8 g~ g8. e16 | f8  e16 e~ e2. |
  r4 f16 e d e f8 f4. | r4 f16 e d e f8 f4. | r4 g16 f e f g8 g~ g8. e16 | f8  e16 e~ e2~ e8 a8 |
  \bar "||"
  
  d2 r8 a8 d c | c8. bes16~ bes8 bes16 a c8. bes16~ bes8 d |
  c2 r8 g8 c bes | bes8. a16~ a8 a16 g bes8. a16~ a8 f |
  bes2 r8 f8 bes a | a8. g16~ g8 g16 f a8. g16~ g8 e |
  a2 r8 e8 f g | bes a~( a g fis4) r8 a8 |
  
  d2 r8 a8 d c | c8. bes16~ bes8 bes16 a c8. bes16~ bes8 d |
  c2 r8 g8 c bes | bes8. a16~ a8 a16 g bes8. a16~ a8 f |
  bes2 r8 f16 f bes8 a | a8. g16~ g8 g16 f a8. g16~( g4 |
  
  a2) f8. e f8 | e8. d16~ d2 r8 d8 | d2. r8 d8 | d2. r8 d8 | d2( cis) |
  r4 f16 e d e f8( e f4~ | f1) \bar "|."
}

letra = \lyricmode {
  O -- lhe pa -- ra_o céu,  
  O -- lhe pa -- ra_o mar  
  Vê que ma -- ra -- vi -- lhas  
  Meu Deus cri -- ou!  
    
  Su -- ba lá nos mon -- tes,  
  O -- lhe pa -- ra_os bos -- ques  
  Vê que ma -- ra -- vi -- lhas  
  Meu Deus cri -- ou!  
    
  Se -- nhor, Tu és o Sol que nos a -- que -- ce!  
  Se -- nhor, Tu és a Lu -- a que_i -- lu -- mi -- na!  
  Se -- nhor, Tu és a_es -- tre -- la que_o -- ri -- en -- ta!  
  Se -- nhor, és o ca -- mi -- nho!  
    
  Se -- nhor, Te que -- ro sem -- pre ao meu la -- do.  
  Se -- nhor, és meu a -- mi -- go_e bem a -- ma -- do.  
  Se -- nhor, Te_a -- gra -- de -- ço pe -- los Teus cui -- da -- dos,  
  Fi -- ca co -- nos -- co  
  Se -- nhor, Se -- nhor, Se -- nhor  
  O -- lhe pa -- ra_o céu.  
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  d1:m7 d:m7/c g:m7 a:7
  d1:m7 d:m7/c g:m7 a:7
  
  d:7 g:m7 c:7 f:maj7 bes:maj7 g:m7 a:7 d
  d:7 g:m7 c:7 f:maj7 bes:maj7 g:m7 a:7 
  d1:m7 d:m7/c g:m7 a:7
  d:m7
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
