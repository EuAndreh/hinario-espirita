\version "2.16.0"
\pointAndClickOff

\header {
  title = "$titulo"
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
  \tempo 4 = 60
  \clef treble

  % 1
  c1
}

letra = \lyricmode {
  $letra
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
