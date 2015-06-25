\version "2.16.0"
%\pointAndClickOff

\header {
  title = "Bom Pastor"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

melodia = \relative c' {
  \key d \major
  \time 3/4
  \tempo 4 = 120
  \clef treble

  % 1
  \partial 4 a4 |
  d d fis8 e | d4 a fis' | e8 d e4 fis | d2 a4 |
  d d fis8 e | d4 a fis' | e8 d e4 fis | d2 \repeat volta 2 { a'4 |
  fis2 a4 | fis2 a4 | g8 fis g4 a | fis2 } r4 \bar "||"
}

letra = \lyricmode {
  Meu bom pas -- tor é Cris -- to,  
  Com e -- le an -- da -- rei.  
  Con -- duz me_a cal -- mas á -- guas,  
  Com e -- le an -- da -- rei.  
  \repeat volta 2 {
    Sem -- pre, sem -- pre, com e -- le an -- da -- rei. 
  }
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  s4 | \repeat percent 2 {d2.} a:7 
  \repeat percent 3 {d} a:7 
  d2 \repeat volta 2 {
    s4 \repeat percent 2 {s2.} a:7 d2 
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
