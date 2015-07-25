\version "2.16.0"
\pointAndClickOff

\header {
  title = "Buscai Primeiro"
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
  \key c \major
  \time 4/4
  \tempo 4 = 80
  \clef treble
 
  e4 e8 f g4 e8 d | c8( b) c d e2 | f4 g8( f) e4 f8 e | d2 d |
  e4 e8 f g4 e8 d | c8 b c d e4 e | f4 g8( f) e4 f8 e | d2 c |
  
  \bar "||"
  e4 e8 f g4. d8 | c8 b c d e2 | f4 g8( f) e4 f8 e | d2 d |
  e4 e8( f) g4 e8 d | c8( b) c d e2 | f4 g8( f) e4 f8 e | d2 c |

  \bar "||"
  e4 e8 f g4 e8 d | c8( b) c d e2 | f4 g8 f e4 f8 e | d1 |
  e4 e8 f g4 e8 d | c8 b c d e2 | f4 g8( f) e4 f8 e | d2 c |

  \bar "||"
  c'2 b a g a g | g4 a8 b b2
  c2 b a g | f4 g8( f) e4 f8 e | d2 c 
  \bar "|."
}

letra = \lyricmode {
  Bus -- cai pri -- mei -- ro o rei -- no de Deus  
  E a su -- a jus -- ti -- ça;  
  E tu -- do mais vos se -- rá a -- cres -- cen -- ta -- do.  
  A -- le -- lu -- ia,_a -- le -- lu -- ia.  
    
  Nem só de pão o ho -- mem vi -- ve -- rá,  
  Mas de to -- da pa -- la -- vra  
  Que pro -- ce -- de da bo -- ca de Deus.  
  A -- le -- lu -- ia,_a -- le -- lu -- ia.  
    
  Se vos per -- se -- guem por cau -- sa de Deus,  
  Não es -- que -- çais o por -- quê.  
  Não é o ser -- vo mai -- or que_o seu se -- nhor.  
  A -- le -- lu -- ia,_a -- le -- lu -- ia. 
  
  A -- le -- lu -- ia, a -- le -- lu -- ia, a -- le -- luia, a -- le -- lu -- ia,_a -- le -- lu -- ia.
}

harmonia = \chordmode {
  c2 g a:m e:m f c g1:7
  c2 g a:m e:m f c g:7 c2

  c2 g a:m e:m f c g1:7
  c2 g a:m e:m f c g:7 c2

  c2 g a:m e:m f c g1:7
  c2 g a:m e:m f c g:7 c2

  c2 g a:m e:m f c g1:7
  c2 g a:m e:m f c g:7 c2
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
