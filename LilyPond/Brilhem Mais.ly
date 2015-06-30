\version "2.16.0"
\pointAndClickOff

\header {
  title = "Brilhem Mais"
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
  \tempo 4 = 160
  \clef treble

  e8 e e g~ g2~ | g1 | g8 g g g~ g2~ | g2 r8 a8~ a b |
  c8 c4 c c c8~ | c e,4 e a a8~ | a g4 g8~ g2~ | g2. a8 g | 
  f f4 f f f8~ | f4 r8 c4 c f8~ | f e4 e8~ e2~ | e2. e8 e |
  f f4 f f f8~ | f f4 f a a8~ | a g4 g8~ g2~ | g1 \bar "||"
  
  e4. g8~ g2~ | g1 | g8 g g g~ g2~ | g2 r8 a8~ a b |
  c8 c4 c c c8~ | c e,4 e a a8~ | a g4 g8~ g2~ | g2. a8 g | 
  f f4 f f f8~ | f c4 c c f8~ | f e4 e8~ e2~ | e2. e8 e |
  f f4 f f f8~ | f f4 f a a8~ | a g4 g8~ g2~ | g1 \bar "||"
  
  e4. g8~ g2 | g4. a8~ a4 b | c4. a8~ a2 | a8 a a g~ g4 f |
  c4. e8~ e4 f | g4. a8~ a4 b | c4. a8~ a4 a | a4. g8~ g4 f |
  c4. e8~ e4 f | g4.( a8~ a4) b | c4. a8~ a4 a | a4. g8~ g4 f |
  c4. e8~ e4 f | g4. a8~ a4 b | c4. a8~ a2 | e'8 e4 d c c8~( |
  
  c1 | b | a) | e'8 e4 d c c8~( |
  c1 | b | a) | e'8 e4 d c c8~ | c1
  \bar "."
}

letra = \lyricmode {
  Si -- ga ir -- mão, ve -- nha pra_a luz,  
  Ve -- nha com to -- do a -- mor pra en -- con -- trar Je -- sus.  
  Ve -- nha com to -- do_o seu ser en -- con -- trar a paz,  
  E_es -- se mun -- do que é be -- lo se -- rá mui -- to mais.  
    
  O -- lhe, ve -- ja_es -- te céu,  
  E_es -- ta ter -- ra que dis -- se -- ram bro -- tar lei -- te_e mel.  
  Nos -- sas vi -- das de mãos da -- das sem -- pre vão fi -- car,  
  E a nos -- sa a -- mi -- za -- de sem -- pre vai du -- rar.  
    
  Vi -- va, can -- te e vi -- bre.  
  Fa -- ça do mun -- do_a -- mor.  
  Si -- ga sem -- pre_o e -- xem -- plo do nos -- so Se -- nhor.  
  On -- de quer que an -- de, se -- mei -- e a paz,  
  E_que_es -- sas lu -- zes que bri -- lham,  
  Sem -- pre bri -- lhem mais.  
  Sem -- pre bri -- lhem mais.  
  Sem -- pre bri -- lhem mais.  
}

harmonia = \chordmode {
  c\breve g a:m e:m f c f g:7
  c g a:m e:m f c f g:7
  
  c1 g d:m f
  c g d:m f
  c g d:m f
  c g d:m f
  c g d:m f
  c g d:m f
  c
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
