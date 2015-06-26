\version "2.16.0"
\pointAndClickOff

\header {
  title = "Depende de Você"
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
  \key f \major
  \time 4/4
  \tempo 4 = 75
  \clef treble

  \partial 16 c16 |
  f8 e16 f~ f g8 c,16~ c4. r16 c16 | f8 e16 f~ f16 g8 g16~ g a8. r8. a16 |
  a8 g16 f~ f e8 d16~ d4.. c16 | c8 d bes c a4 g8. c16 |
  
  f8 e16 f~ f g8 c,16~ c4. r16 c16 | f8 e16 f~ f16 g8 g16~ g a8. r8. a16 |
  a8 g16 f~ f e8 f16~ f e8. d8 c | c d bes c a4 c |
  f2. r8 d8 | d f f g f4 g \bar "||"
  
  r8 c8 c bes a4 g8 a~ | a8 c8 c bes a4 g8 f~ |
  f8 d f d bes'4 a8 g~ | g c, d c a'4 g8 a~ |
  a8 c8 c bes a4 g8 a~ | a8 c8 c bes a4 g8 f~ |
  f8 d f d bes'4 a8 g~ | g c, d c a'4 a |
  f1 \bar "|."
}

letra = \lyricmode {
  A -- mi -- go, bri -- lha_o Sol  
  A -- lém de sua ja -- ne -- la,  
  Per -- ce -- ba_ao seu re -- dor  
  O quan -- to_a vi -- da_é be -- la.  
    
  A -- cen -- da em vo -- cê  
  O bri -- lho que dor -- mi -- ta,  
  Li -- ber -- te_as a -- sas, vo -- e  
  Ao en -- con -- tro do mais pu -- ro_a -- mor,  
  A -- bra -- ce_o in -- fi -- ni -- to.  

  Des -- per -- te pa -- ra_a luz,  
  Dei -- xe_o a -- mor bro -- tar,  
  Fru -- ti -- fi -- car de vez,  
  Que_a vi -- da_é mui -- to mais.  
      
  De -- pen -- de de vo -- cê  
  Que -- rer a -- cre -- di -- tar  
  Que po -- de ser fe -- liz  
  E_en -- fim se li -- ber -- tar.  
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  s16
  f1:maj7 d:m7 bes:maj7 c:7
  f1:maj7 d:m7 bes:maj7 c:7
  bes:maj7 c2:7sus4 c:7
  
  f1:maj7 d:m7 bes:maj7 c:7
  f:maj7 d:m7 bes:maj7 c:7
  f:maj7 
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
