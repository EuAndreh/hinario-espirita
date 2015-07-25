\version "2.16.0"
\pointAndClickOff

\header {
  title = "É Preciso"
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

melodia = \relative c'' {
  \key c \major
  \time 4/4
  \tempo 4 = 120
  \clef treble

  g8 g g g~ g a g g~ | g g~ g g g f e d | 
  d c c c~ c a c e~ | e2 e4( d) |
  c8 c c c~ c d e d~ | d d e d~ d c b c~ |
  c c c e~ e d c c~ | c2. r8 g |
  
  g'8 g g g~ g a g g~ | g g~ g g g f e d~ | 
  d c c c~ c a c e~ | e2 e4( d8) d |
  c8 c c c~ c d e d~ | d d e d~ d c b c~ |
  c c c e~ e d c c~ | c1 | r2. r8 c8 |
  
  c' c c c~ c c, c c | b' b b b~ b2 |
  a8 a~ a g~ g f~ f e~ | e e f g~ g4. c,8
  c' c c c~ c c, c c | b' b b b~ b2 |
  a8 a b c~ c b a g~ | g g a g~ g2 |
  
  \repeat volta 2 {
    a8 a a g~ g f~ f e~ | 
    \time 2/4
    e f~ f d~ | 
    \time 4/4
    d1
  }
}

letra = \lyricmode {
  To -- do tra -- ba -- lho_é bem- -- vin -- do  
  Pras mãos que não se can -- sam de re -- co -- me -- çar.  
  Ah
  To -- do es -- for -- ço_é pre -- ci -- so,_É_im -- por -- tan -- te
  sa -- ber -- mos o tem -- po_o -- cu -- par.  
    
  A vi -- da não é brin -- ca -- dei -- ra,  
  Quem sa -- be_es -- ta chan -- ce de -- mo -- ra_a vol -- tar.  
  Ah
  Se tem que ser fei -- to_é a -- go -- ra,_é pra já, sem de -- mo -- ra,_Es -- te_é_o tem -- po_e_o lu -- gar.   
    
  Pre -- ci -- so se faz vi -- ver o bem e a paz,  
  E_es -- pa -- lhar o_a -- mor na can -- ção.  
  Er -- ga -- mos a voz, tu -- do de -- pen -- de de nós,  
  Da nos -- sa for -- ça e dis -- po -- si -- ção.  
  É só a -- brir o co -- ra -- ção.
}

harmonia = \chordmode {
  c1 g f c2 g/b a:m a:m/g d1/fis f2 g:7 c1
  c1 g f c2 g/b a:m a:m/g d1/fis f2 g:7 c1
  c:7 f e:m d2:m g:7 c c:7
  f1 e:m d:7 g1:7
  \repeat volta 2 {
    f2 e:m d2:m g1:7
  }
}

musica = <<
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
