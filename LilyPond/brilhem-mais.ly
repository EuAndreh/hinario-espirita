\version "2.16.0"

%\pointAndClickOff

\header {
  title = "A Árvore"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://euandre.org/hinario-espirita"
    \line { "euandre.org/hinario-espirita" }
  }
}

melodia = \relative c' {
  \key c \major
  \time 4/4
  \tempo 4 = 60
  \clef treble

  % 1
  e8 e e g~ g2~ | g2 r2 | g8 g g g~ g2~ | g2 r8 a8~ a b | 
  c8 c~ c c~ c c~ c c~ | c e,~ e e~ e a~ a a~ | a g~ g g~ g2~ | g2 r4 g8 f |
  f8 f~ f f~ f f~ f f~ | f4. c8~ c c~ c f~ | f e~ e e~ e2~ | e r4 e8 e | 
  f8 f~ f f~ f f~ f f~ | f f~ f f~ f a~ a a~ | a g~ g
}

letra = \lyricmode {
  Si -- ga ir -- mão, ve -- nha pra luz,  
  Ve -- nha com to -- do a -- mor pra en -- con -- trar Je -- sus.  
  Ve -- nha com to -- do_o seu ser en -- con -- trar a paz,  
  E_es -- se mun -- do que é be -- lo se -- rá mui -- to mais.  
        
  O -- lhe, ve -- ja_es -- te céu,  
  E_es -- ta ter -- ra que dis -- se -- ram bro -- tar lei -- te_e mel.  
  Nos -- sas vi -- das de mãos da -- das sem -- pre vão fi -- car,  
  E a nos -- sa a -- mi -- za -- de sem -- pre vai du -- rar.  
 
  Vi -- va, can -- te e vi -- bre.  
  Fa -- ça do mun -- do a -- mor.  
  Si -- ga sem -- pre_o e -- xem -- plo do nos -- so se -- nhor.  
  On -- de quer que an -- de, se -- mei -- e a paz,  
  E que es -- sas lu -- zes que bri -- lham,  
  Sem -- pre bri -- lhem mais.
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
