\version "2.16.0"
\pointAndClickOff

\header {
  title = "O Essencial"
  composer = "Carlos Faria Jr."
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
  \key d \major
  \time 4/4
  \tempo 4 = 120
  \clef treble

  a'4 a8 a b a fis d | a'4 r8 a8 b a fis e | 
  d4 r8 d8  d b d b | \times 2/3 { fis'2 fis4 } \times 2/3 { g4 fis e}
  \times 2/3 { d2 d4 } \times 2/3 {d4 e fis} | \times 2/3 { e2 e4 } \times 2/3 {e4 d e}
  fis2~( fis8 g fis e~ | e1)
  
  a4. a8 b a fis d | a'8 a r8 a8 b a fis e | 
  d8 d  r8 d8~ d b d b | fis'8 fis r8 fis8 g8 fis e d |
  d8 d r8 d8 \times 2/3 {d4 e fis} | \times 2/3 { e2 e4 } \times 2/3 {e4 d e}
  d1 | r1 |
  
  b'8 a b a b a b d | b2 b8 a b d | 
  b2 b8 a fis d | fis4 fis e d | 
  e4 e8 e fis e d b | e4. e8 fis e d b |
  e8 e8~ e e fis e d b | a'1
  
  a4 a8 a b a fis d | a'8 a r8 a8 b a fis e | 
  d8 d r8 d8  d b d b | fis'4 r8 g8~ g8 fis e d 
  \repeat volta 2 {
    d d r8 d8 d d e fis | e4 r8 e8 fis e d e 
  } 
  \alternative {
    { d1 | r4. g8~ g fis e d }
    { d1 }
  }
}

letra = \lyricmode {
  To -- da ma -- gi -- a do a -- mor es -- tá no pró -- prio ser,  
  Em a -- cor -- dar e ver o di -- a nas -- cer,  
  Pen -- san -- do no bem, num mun -- do fe -- liz.  
    
  O es -- sen -- ci -- al à vi -- da é a sa -- be -- do -- ri -- a,  
  Pa -- ra con -- du -- zí- -- la, fa -- zer de ca -- da di -- a  
  Um di -- a de paz, um di -- a fe -- liz.   
    
  To -- do bem que se pos -- sa fa -- zer  
  Se de -- ve fa -- zer, sem he -- si -- ta -- ção.  
  Pom, pom, pom.
  Dar sem pen -- sar em re -- ce -- ber,  
  O_a -- mor sem -- pre pre -- sen -- te em ca -- da co -- ra -- ção.  
    
  Es -- se ca -- mi -- nho le -- va_o ho -- mem que bus -- ca a ver -- da -- de  
  A en -- con -- trar a paz,  
  A fra -- ter -- ni -- da -- de, e_a -- ju -- da_a cons -- tru -- ir um mun -- do mais ir -- mão. 
  
  A fra -- ter -- ni 
  mão.
  
  
}

harmonia = \chordmode {
  \repeat percent 2 {d1} b:m fis:m g a:7 d a:7
  \repeat percent 2 {d1} b:m fis:m g a:7 d d:7
  
  \repeat percent 3 {g} b:m 
  \repeat percent 3 {e:m} a:7
  
  \repeat percent 2 {d1} b:m fis:m 
  \repeat volta 2 {
    g a:7 
  }
  \alternative {
    { d b:m }
    { d }
  }
}

musica =   <<
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