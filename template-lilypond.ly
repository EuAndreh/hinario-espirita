\version "2.16.0"

\pointAndClickOff

\header {
  title = ""
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
  bla
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
