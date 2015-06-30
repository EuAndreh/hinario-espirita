\version "2.16.0"
%\pointAndClickOff

\header {
  title = "Você com Cristo"
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
  \key f \major
  \tempo 4 = 75
  \clef treble
}

introToSegno = \relative c' {
  \time 2/4
  r8 f8 f g |
  \time 4/4
  a( bes16) g~ g4 r8 g16 f~ f8 e16 f~ | f2 r8 f16 e~ e8 d16 e~ | e1
  
  \time 2/4
  f8 g a bes | 
  \time 4/4
  a g~ g2 f8 e | f4 f2.
  
  \time 2/4
  f8 g a bes | 
  \time 4/4
  a g~ g2 f8 e | f4 f2.
  
  \time 2/4
  f8 g a bes | 
  \time 4/4
  a g~ g2 f8 e | f4 f2 f8 d |
  e2. d8 cis | d2. f8 d | 
  e2. d8 cis 
  
  \time 2/4
  d2
  
  \repeat volta 2 {
    r8 d'8 c bes | 
    \time 4/4
    c( bes16) a~ a4 a8 bes16 c~ c8 d
    g,2 r8 g8 a bes16 a~ | a2. r8 a8
    \time 2/4
    a8 bes c d | 
    \time 4/4
    g,2 g8 g f e 
    \time 2/4
    d2
  }
}

segnoToEnd = \relative c' {
  r8 f8 f g 
  \time 4/4
  a( bes16) g~ g2 f8 e 
  f a16 a~ a4. r16 g16~ g8 f16 e 
  \time 2/4
  d2
}

letra = \lyricmode {
  Vo -- cê com Cris -- to se -- rá mai -- or, se -- rá me -- lhor.  
  Não ha -- ve -- rá on -- da que_o a -- ba -- ta;  
  Não ha -- ve -- rá ven -- to que o do -- bre;  
  Não ha -- ve -- rá na -- da que_o a -- tin -- ja,  
  Só o_a -- mor, só o_a -- mor.
  Só o_a -- mor, só o_a -- mor.
  
  Vo -- cê com Cris -- to não é mais vo -- cê,  
  É_um ser -- vi -- dor que ser -- ve sem ces -- sar  
  Pra Deus al -- can -- çar.  
  
  Vo -- cê com Cris -- to não tem mais te -- mor,
  Não fica só.  
}

introToSegnoChords = \chordmode {
  f2 c1:7 d:m a:7
  f2 c1:7 d:m
  f2 c1:7 d:m
  f2 c1:7 d:m
  a:7 d:m a:7 d2:m
  \repeat volta 2 {
    bes f1 c:7 d:m
    f2 c1:7 d2:m
  }
}

segnoToEndChords = \chordmode {
  f2 c1:7  a:7 d2:m
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToEndChords
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        
        \mark \markup { \musicglyph #"scripts.segno" }
        \segnoToEnd
        \mark \markup { \left-align { "D.C. al" \musicglyph #"scripts.segno" }}
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
      \segnoToEndChords
      \introToSegnoChords
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        \segnoToEnd
        \introToSegno
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \midi {}
}

