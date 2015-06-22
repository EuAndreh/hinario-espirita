\version "2.16.0"

%\pointAndClickOff

\header {
  title = "Astro Rei"
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
  c1
}

letra = \lyricmode {
  Ve -- ja_o Sol  
  Tão lin -- do no_ho -- ri -- zon -- te,  
  De be -- le -- za sem par,  
  Al -- vo -- ra -- da é luz.   
    
  O -- lhe_o Sol  
  De bri -- lho_ir -- ra -- di -- an -- te.  
  Nos -- so co -- ra -- ção  se en -- che de_a -- mor.  
    
  A su -- a luz i -- lu -- mi -- na nos -- sos pas -- sos   
  O seu ca -- lor a -- li -- men -- ta nos -- sa vi -- da, nos -- so_e -- xis -- tir.  
    
  A -- me_o Sol,  
  Nos -- sa_es -- tre -- la gui -- a.  
  O prin -- cí -- pio da vi -- da,  cri -- a -- da por Deus   
    
  É o Sol  
  Que traz um no -- vo dia,  
  A -- fas -- tan -- do as tre -- vas,   
  Tra -- zen -- do_a -- le -- gri -- a.    
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
