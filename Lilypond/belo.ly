\version "2.16.0"

\pointAndClickOff
% first, define a variable to hold the formatted date:
date = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = ""
  composer = ""
  subtitle = ""
  subsubtitle = \date
}

\paper {
  top-system-spacing #'basic-distance = #10
  score-system-spacing #'basic-distance = #20
  system-system-spacing #'basic-distance = #20
  last-bottom-spacing #'basic-distance = #10
}

global = {
  \key c \major
  \time 4/4
  \dynamicUp % Será isso melhor?
}


sopMusic = \relative c'' {
  c2 \p \< d c d \f
}
sopWords = \lyricmode {
  do do do do
}


altoMusic = \relative c'' {
  c2\p d c d
}
altoWords = \lyricmode {
  re re re re
}


tenorMusic = {
  \clef "G_8"
  c2\mp d c d
}
tenorWords = \lyricmode {
  mi mi mi mi
}


bassMusic = {
  \clef bass
  c2\mf d c d
}
bassWords = \lyricmode {
  mi mi mi mi
}


\score {
<<
\new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopMusic
      >>
      \lyricsto "soprano" \new Lyrics \sopWords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altoMusic
      >>
      \lyricsto "alto" \new Lyrics \altoWords
    >>
    \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenorMusic
      >>
      \lyricsto "tenor" \new Lyrics \tenorWords
    >>
    \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassMusic
      >>
      \lyricsto "bass" \new Lyrics \bassWords
    >>
  >>
  \new PianoStaff <<
    \new Staff <<
      \set Staff.printPartCombineTexts = ##f
      \partcombine
      << \global \sopMusic >>
      << \global \altoMusic >>
    >>
    \new Staff <<
      \clef bass
      \set Staff.printPartCombineTexts = ##f
      \partcombine
      << \global \tenorMusic >>
      << \global \bassMusic >>
    >>
  >>
>>
\layout {}
\midi {}
}
