\version "2.16.0"
\pointAndClickOff

\header {
  title = "Na Sua Casa"
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

global = {
  \key g \major
  \time 6/8
  \tempo 4. = 70
  \clef treble
}

introToSegno = \relative c' {
  \partial 4 d8 c16 b~ 
  b4. d8 d c | b4. d8 d b' | 
  a2. | r4. a8 a a | a4. a8 a a | a4. g8 b a |
  g2. | r4. d8 d c |

  b4. d8 d c | b4. d8 d b' | 
  a2. | r4. a8 a a | a4. a8 a a | a4 a8 g b a | g2.
}

segnoToCoda = \relative c' {
  \repeat volta 2 {
    r4. g'8 a b | c8~ c16 c c8 c c b16 a~ | a8 fis fis fis g a |
    b4 b c | b4. g8 a b |
    c c c c c b | a fis fis fis g a
  }
  \alternative {
    { b2. }
    { g2. }
  }
}

codaToEnd = \relative c' {
  \repeat volta 2 {
    r4. d8 d c | b4. d8 d c | b4. d8 d b' | 
    a2. | r4. a8 a a | a4. a8 a a | a4 a8 g b a | g2. 
  }
}


letra = \lyricmode {
  Deus me deu o meu vi -- ver, me fez nas -- cer,  
  Me viu cres -- cer, me deu a mão e_eu ca -- mi -- nhei.  
    
  Vou ca -- mi -- nhar sem me sol -- tar da su -- a mão,  
  Sem des -- gar -- rar co -- mo_a o -- ve -- lha que se per -- deu.   
    
  Na Su -- a ca -- sa, há mui -- tas mo -- ra -- das,  
  Que -- ro ir pra lá e fi -- car.  
  Es -- ta -- rei pron -- to sem -- pre tra -- ba -- lhan -- do  
  Quan -- do me cha -- mar. mar
    
  An -- tes de ir que -- ro mos -- trar ao meu ir -- mão  
  Que Deus é_a -- mor, é es -- pe -- ran -- ça, E -- le_é per -- dão.
}

introToSegnoChords = \chordmode {
  s4 g1. d\breve.:7
  g2. d:7
  g1. d\breve.:7 g2.
}

segnoToCodaChords = \chordmode {
  \repeat volta 2 {
    g2.:7 c d:7 g e:m a:m d:7 
  }
  \alternative {
    { g }
    { g }
  }
}

codaToEndChords = \chordmode {
  \repeat volta 2 {
    d2.:7
    g1. d\breve.:7
    g2.
  }
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \codaToEndChords
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno

        \mark \markup { \musicglyph #"scripts.segno" }
        \segnoToCoda
        \mark \markup { \musicglyph #"scripts.coda" }

        \codaToEnd
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \layout {}
}

\score {
  \unfoldRepeats
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \codaToEndChords
      \segnoToCodaChords
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        \segnoToCoda
        \codaToEnd
        \segnoToCoda
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \midi {}
}