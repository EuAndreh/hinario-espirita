\version "2.16.0"
\pointAndClickOff

\header {
  title = "O Dia"
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
  \key a \major
  \time 4/4
  \tempo 4 = 100
  \clef treble
}

introToSegno = \relative c' {
  r4 e8 e e4 d8 cis | e cis~ cis2 r8 cis8 |
  d4 e8 d~ d cis b cis | d d d d cis4 b |
  r4 e4 e d8 cis | e cis~ cis4 r8  cis8 b cis |
  d2 r8 cis8 b cis | d4. cis8~ cis2 | 
}

segnoToCoda = \relative c' {
  r4 e8 e e4 a | gis fis8( e~) e e e e |
  fis2 r4 d8 e | f f f f e4( d8 e~) |
  e4 e8 e e4 a | gis fis8( e8~) e4 e8 e |
  fis2 r4 d8 e | f4 e d f |
}

segundaEstrofe = \relative c' {
  e1 | r1 r r
  r4 e8 e e4 d8 cis | e cis~ cis2 b8 cis |
  d4. d8~ d r8 b cis | d d d d cis4 b |
  r4 e8 e e e d cis | e cis~ cis4 r8  cis8 b cis |
  d2 r8 cis8 b cis | d d d d cis4 b |
}

terceiraEstrofe = \relative c' {
  \repeat volta 2 {
    r4 e d cis | r gis' fis e( | fis1 | f) |
  }
}

letra = \lyricmode {
  Quan -- do_o di -- a_a -- ma -- nhe -- ce  
  O Sol se a -- bre_e i -- lu -- mi -- na_a na -- tu -- re -- za  
  Vi -- bran -- do_a -- le -- gri -- a no co -- ra -- ção da_Hu -- ma -- ni -- da -- de.  
    
  Quan -- do_o di -- a to -- ca o co -- ra -- ção  
  Nos u -- ni -- mos aos ir -- mãos,  
  Nos a -- pro -- xi -- ma -- mos de Je -- sus  
  Num só cli -- ma de_u -- ni -- ão.     
    
  Quan -- do_o di -- a des -- per -- ta  
  Nos -- sa men -- te pa -- ra_o_a -- mor e_a ca -- ri -- da -- de  
  Quan -- do_o di -- a ir -- ra -- di -- a e -- vo -- lu -- ção  
  Nos e -- du -- can -- do pa -- ra_a vi -- da.  
    
  O di -- a,  o di -- a.
}

introToSegnoChords = \chordmode {
  a1 cis:m d d:m6
  a1 cis:m d d:m6
}

segnoToCodaChords = \chordmode {
  a1 cis:m d d:m6
  a1 cis:m d d:m6
}

segundaEstrofeChords = \chordmode {
  a1 cis:m d d:m6
  a1 cis:m d d:m6
  a1 cis:m d d:m6
}

terceiraEstrofeChords = \chordmode {
  \repeat volta 2 {
    a1 cis:m d d:m6
  }
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \segundaEstrofeChords
      \terceiraEstrofeChords
      \chordmode { a }
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
        
        \segundaEstrofe
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
        \terceiraEstrofe
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
        r1
        \bar "|."
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
      \segundaEstrofeChords
      \segnoToCodaChords
      \terceiraEstrofeChords
      \segnoToCodaChords
      \chordmode { a }
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        \introToSegno
        \segnoToCoda
        \segundaEstrofe
        \segnoToCoda
        \terceiraEstrofe
        \segnoToCoda
        r1
        \bar "|."
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \midi {}
}
