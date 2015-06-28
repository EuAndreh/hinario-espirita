\version "2.16.0"
\pointAndClickOff

\header {
  title = "Pensa em Deus"
  composer = "Marcus Vinícius Pereira"
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
  \key g \major
  \time 4/4
  \tempo 4 = 110
  \clef treble

  d4 g g4. d8 | c4 g'8 fis~ fis2 | r4 d8 fis g4. a8
  b4 c8 a8~ a2 | c4 e, a4. b8 a g fis g g4 r8 e16 fis |
  g8 g~ g g~ g fis e fis | e d~ d2.
  
  d4 g g4. d8 | c4 g'8 fis~ fis2 | r4 d8 fis g4. a8 
  b4 c8 a8~ a2 | c4 e, a4 a8 b a g fis g g4 r8 e16 fis |
  g4 g8 a g fis e fis | g1 | r1 \bar "||"
  
  d4 g g4. d8 | c4 g'8 fis8~ fis fis4. | r4 d8 fis g4. a8 
  b4 c8 b a2 | c4 e, a4. b8 a g fis g g4 r8 e16 fis |
  g8 g~ g g~ g fis e fis | e d~ d2. 
  
  d4 g g4. d8 | c4 g'8 fis~ fis2 | r4 d8 fis g4. a8
  b4 c8 a8~ a2 | c4 e, a4 a8 b a g fis g g4 r8 e16 fis |
  g4 g8 a g fis e fis | g1 | r1 \bar "||"
  
  d4 g g4. d8 | c4 g'8 fis~ fis2 | r4 d8 fis g4. a8 
  b4 c8 a8~ a2 | c4 e, a4. b8 a g fis g g4 r8 e16 fis |
  g8 g~ g g~ g fis e fis | d1
  
  d4 g g4. d8 | c4 g'8 fis~ fis2 | r4 d8 fis g4. a8
  b4 c8 a8~ a2 | c4 e, a4 a8 b a g fis g g4 r8 e16 fis |
  g4 g8 a g fis e fis | g1 \bar "||"
  
  c4 e, a4 a8 b 
  \override TextSpanner #'(bound-details left text) = "rit." 
  a g fis g c4\fermata  g8\startTextSpan a |
  b4 d,8 d c a' g fis | g1\stopTextSpan
  \bar "|."
}

letra = \lyricmode {
  Quan -- do_o céu se_i -- lu -- mi -- nar e_u -- ma_es -- tre -- la_a -- pa -- re -- cer  
  Pe -- nsa_em Deus e faz u -- ma_o -- ra -- ção, teu pe -- di -- do de fe -- li -- ci -- da -- de.   
    
  Mas se que -- res ser fe -- liz, ou -- ve_a dor do teu ir -- mão.  
  Na ver -- da -- de, só po -- de ser fe -- liz quem a -- pren -- de_a do -- ar o co -- ra -- ção.   
    
  Quan -- do_a chu -- va ben -- fa -- ze -- ja  or -- va -- lhar teu pei -- to,_a -- mi -- go,  
  Pen -- sa_em Deus e faz u -- ma_o -- ra -- ção pe -- lo_ir -- mão que so -- fre_ao de -- sa -- bri -- go   
    
  Mo -- vi -- men -- ta_o teu que -- rer, a -- fas -- tan -- do_a so -- li -- dão.  
  Na ver -- da -- de, só po -- de ser fe -- liz quem a -- pren -- de_a do -- ar o co -- ra -- ção.   
    
  Quan -- do_o_a -- mor que vem dos teus tu -- a vi -- da_i -- lu -- mi -- nar  
  Pen -- sa_em Deus e nu -- ma o -- ra -- ção com -- par -- ti -- lha com quem pre -- ci -- sar   
    
  Faz de ti o que pu -- der em fa -- vor do teu ir -- mão  
  Na ver -- da -- de, só po -- de ser fe -- liz quem a -- pren -- de_a do -- ar o co -- ra -- ção.   

  Na ver -- da -- de, só po -- de ser fe -- liz quem a -- pren -- de_a do -- ar o co -- ra -- ção.   
}

harmonia = \chordmode {
  g2 e:m a:m d:7 g e:m a:m d:7
  c1 b2:7 e:m a1:7 a2:m d:7
  
  g2 e:m a:m d:7 g e:m a:m d:7
  c1 b2:7 e:m a:m d:7 
  g e:m a:m d:7

  g2 e:m a:m d:7 g e:m a:m d:7
  c1 b2:7 e:m a1:7 a2:m d:7
  
  g2 e:m a:m d:7 g e:m a:m d:7
  c1 b2:7 e:m a:m d:7 
  g e:m a:m d:7

  g2 e:m a:m d:7 g e:m a:m d:7
  c1 b2:7 e:m a1:7 a2:m d:7
  
  g2 e:m a:m d:7 g e:m a:m d:7
  c1 b2:7 e:m a:m d:7 
  
  g g:7 c1 g2 c g d:7 g
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
