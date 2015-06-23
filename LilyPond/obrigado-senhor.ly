\version "2.16.0"

%\pointAndClickOff

\header {
  title = "Obrigado, Senhor!(com acento?)"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://euandre.org/hinario-espirita"
    \line { "euandre.org/hinario-espirita" }
  }
}

melodia = \relative c' {
  \key d \major
  \time 4/4
  \tempo 4 = 90
  \clef treble

  % 1
   a
}

letra = \lyricmode {
    
    
    
  Obrigado, Senhor,  porque és meu amigo,  
  Porque sempre comigo  Tu estás a falar  
  No perfume das flores,  na harmonia das cores,  
  E no mar que murmura  o Teu nome a rezar.  
    
    
   Escondido Tu estás  
  No verde da floresta,   
  Nas aves em festa,   
  No Sol a brilhar,   
  Nas sombras que abrigam,   
  Na brisa amiga,   
  Na fonte que corre   
  Ligeira a cantar.  
    
    
  Te agradeço, ainda,  porque na alegria,  
  Ou na dor de cada dia  posso Te encontrar.  
  Quando a dor me consome  murmuro o Teu nome  
  E, mesmo sofrendo,  eu posso cantar.  
    
    
  
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  c1:maj7
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
