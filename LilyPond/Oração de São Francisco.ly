\version "2.16.0"
\pointAndClickOff

\header {
  title = "Oração de São Francisco"
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
  \key a \minor
  \time 4/4
  \tempo 4 = 80
  \clef treble

  \partial 4 a4 |
  e'2. r8 e8 | g4 g8 g e4 e8 e | \time 2/4 d4 d | \time 4/4 a2 r8 a8 a a | 
  d4 d8 d f4 d8 f | a4. r8 a,8 a a a | 
  d4 d8 d f4 d8 f | a4. r8 a8 a a g |
  e4 e8 e g4 e8 d | c2 r8 a'8 a g |
  e8 e e e d4 d | a2 r8 a8 a a |
  
  d4 d8 d f4 d8 f | a4 a,8 a a4 a8 a |
  d4 d8 d f4 d8 f | a4 a a8 a a g | 
  e4 e8 e g4 e8 d | c4 c r8 a'8 a g | 
  e4 e8 e d4 d | a2 r4 a4 |
  
  e'2 e4 r8 e8 | g4 g8 g e4 e | 
  d2 r4 c8 d | e4. e8 d4 c8 b | 
  a4 a r8 c8 d e | f4. f8 e4 d8 c | 
  b4 b r4 d4 | g2 r8 f8 e d | 
  c4 c r4 c8 d | e4 e r8 d8 c b |
  a4 a r8 c8 d e | f8 f f f e4 d8 c |
  b4 b r8 d8 e f | g4 g f f | 
  e e e a | e d c( e) | a,1
  \bar "|."
}

letra = \lyricmode {
  Se -- nhor, fa -- zei- me_ins -- tru -- men -- to de Vos -- sa paz.  
  On -- de_hou -- ver ó -- dio, que_eu le -- ve_o a -- mor;  
  On -- de_hou -- ver o -- fen -- sa, que_eu le -- ve_o per -- dão;  
  On -- de_hou -- ver dis -- cór -- dia, que_eu le -- ve_a_u -- ni -- ão;  
  On -- de_hou -- ver dú -- vi -- da, que_eu le -- ve_a fé;  
  On -- de_hou -- ver er -- ro, que_eu le -- ve_a ver -- da -- de;_On -- de_hou -- ver de -- ses -- pe -- ro, que_eu le -- ve_a_es -- pe -- ran -- ça;  
  On -- de_hou -- ver tris -- te -- za, que_eu le -- ve_a_a -- le -- gri -- a;  
  On -- de_hou -- ver tre -- vas, que_eu le -- ve_a luz.  
    
  Oh, Mes -- tre, fa -- zei que_eu pro -- cu -- re mais  
  Con -- so -- lar, que ser con -- so -- la -- do;  
  Com -- pre -- en -- der, que ser com -- preen -- di -- do;  
  A -- mar, que ser a -- ma -- do.  
  Pois é dan -- do que se re -- ce -- be,  
  É per -- do -- an -- do que se é per -- do -- a -- do,  
  E é mor -- ren -- do que se vi -- ve pa -- ra_a vi -- da_e -- ter -- na.
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  s4 a1:m c2 a:m e a1:m d2:m f a1:m d2:m f a1:m c a:m c2 e a1:m
  d2:m f a1:m  d2:m f a1:m c a:m c2 e \repeat percent 4 {a2:m}
  c a:m d1:m a2:m e a1:m d:m g:7 c2 e a1:m e a:m d:m g:7 c2 e a1:m e a:m
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
