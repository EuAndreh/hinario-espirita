\version "2.16.0"
\pointAndClickOff

\header {
  title = "Usa, Senhor, as Minhas Mãos"
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
  \key e \major
  \time 6/8
  \tempo 8 = 140
  \clef treble

  % 1
  e8 e e e gis e | fis4. r4 dis8 | dis dis dis dis fis dis | e4. r4 b8 |
  e8 e e e gis e | fis4. r4 b8 | b b b a gis fis | gis4. r4 b8 |
  b b b b cis b | b a gis a4 cis,8 | a'8 a a a b a | a gis fis gis4 b,8 |
  gis'8 gis gis gis a gis | gis fis eis fis4. | b4. b8 cis b 
  b cis b a gis fis | e2. \bar "|."
}

letra = \lyricmode {
  U -- sa, Se -- nhor, as minhas mãos  
  No gran -- de plan -- ti -- o do bem.  
  Os ho -- mens são to -- dos ir -- mãos  
  Na Ter -- ra_e nos mun -- dos do_a -- lém.  
    
  Que_eu sai -- ba ser bom de ver -- da -- de, Se -- nhor;  
  Que_eu sai -- ba plan -- tar ca -- ri -- da -- de_e a -- mor;  
  Que_eu pos -- sa ser -- vir de_ins -- tru -- men -- to da paz;  
  Oh! Quan -- do_o Se -- nhor mi -- nhas mãos u -- sa -- rás?  
}

harmonia = \chordmode {
  e2. fis:m b:7 \repeat percent 2 {e} fis:m b:7
  e e:7 a a:m e cis:m fis:m \repeat percent 2 {b:7}
  e
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
