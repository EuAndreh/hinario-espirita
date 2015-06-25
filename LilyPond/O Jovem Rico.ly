\version "2.16.0"
\pointAndClickOff

\header {
  title = "O Jovem Rico"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}
global = {
  \key e \major
  \tempo 4. = 60
  \clef treble
}

introToSegno = \relative c'' {
  \time 9/8 gis4 gis8 gis4 gis8 a4 gis8 | \time 12/8 fis4. r8 fis8 fis fis4 a8 gis4 fis8 | 
  e4. r8 e8 e e4 gis8 fis4 e8 | dis4. dis4 cis8 bis4 cis8 dis4 e8 | \time 6/8 cis2. 
}

segnoToCoda = \relative c'' {
  \time 9/8 gis4 gis8 gis4 gis8 a a gis | \time 12/8 fis4. fis fis fis8 gis fis | 
  e4. e e e8 fis e | dis4. dis dis dis8 e dis | 
  
  gis4. gis gis8 gis4 gis8 a gis | fis4. fis fis fis8 gis fis | 
  e4. e e4 e8 e fis e | dis4. dis dis dis8 e dis
}

codaToEnd = \relative c' {
  \time 6/8 cis4. r4 b8 |
  
  \time 9/8 gis'4 gis8 gis4 gis8 a4 gis8 | \time 12/8 fis8 fis4 r8 fis8 fis fis4 a8 gis4 fis8 |
  e8 e4 r8 e8 e e4 gis8 fis4 e8 | dis4. dis4 cis8 bis4 cis8 dis4 e8 | \time 6/8 cis2.
  
}

letra = \lyricmode {
  Cer -- to di -- a_al -- guém che -- gou e ao mes -- tre per -- gun -- tou:  
  "\"O" que_es -- pe -- ra Deus de mim, co -- mo pos -- so ser fe -- "liz?\""
    
  Vá e ven -- de tu -- do_o que tens e dá a quem não tem a -- mor,  
  Dá de ti mes -- mo sem na -- da_es -- pe -- rar,  
  E vol -- ta, pe -- ga tua cruz e vem, se -- gue co -- mi -- go_as -- sim,  
  Sem na -- da_a pe -- dir te -- rás tu -- do en -- fim.  
    
  A -- que -- le jo -- vem foi -se_em -- bo -- ra,  
  Dei -- xou tu -- do pra_ou -- tra ho -- ra,  
  Mas Je -- sus ain -- da nos diz: "\"É" tem -- po de ser fe -- "liz.\""
  fim.
}

introToSegnoChords = \chordmode {
  e1 s8 b1.:7 a gis:7 cis2.:m
}

segnoToCodaChords = \chordmode {
  e1 s8 b1.:7 a gis:7 cis2.:m
  e2. b1.:7 a gis:7 
}

codaToEndChords = \chordmode {
  cis2.:m e1 s8 b1.:7 a gis:7 cis2.:m
}

\score {
  <<
    \new ChordNames { 
      \set majorSevenSymbol = \markup { 7M }
      \introToSegnoChords
      \segnoToCodaChords
      \codaToEndChords
      \chordmode { cis:m }
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        
        \mark \markup { \musicglyph #"scripts.segno" }
        \bar "."
        \segnoToCoda
        \bar "."
        \mark \markup { \musicglyph #"scripts.coda" }
       
        \codaToEnd
        \bar "."
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
        cis'2.
        \bar "|."
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \layout {}
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \codaToEndChords
      \segnoToCodaChords
      \chordmode { cis:m }
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        \segnoToCoda
        \codaToEnd
        \segnoToCoda
        cis'2.
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \midi {}
}
