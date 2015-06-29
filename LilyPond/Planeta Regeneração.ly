\version "2.16.0"
\pointAndClickOff

\header {
  title = "Planeta Regeneração"
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
  \key g \major
  \time 4/4
  \tempo 4 = 120
  \clef treble

  b4 a8 b~ b a~ a b~ | b4. b b8 b | b a~ a g a4 b8 a~ | a4. a4. r8 a8 |
  a g~ g fis g4 fis8 g~ | g4. g4. g8 g | g fis~ fis e fis4 g8 fis~ | fis2. r8 a |
  
  b4 a8 b~ b a~ a b~ | b4. b b8 b | b a~ a g a4 b8 a~ | a4. a4. a8 a |
  a4 b8 g~ g fis~ fis e~ | e4. e4. g8 g | g fis~ fis e fis4 g8 fis~ | fis4. fis4 r8 g8 fis |
  
  g4. fis8 g4 fis8 g~ | g2 r4 g8 fis | g8 g~ g fis g4 fis8 g~ | g2 r4 g8 g |
  a4. a8 a4 g | fis4. fis a8 a | a8 g~ g g~ g a~ a g~ | g1 \bar "||"
  
  
  r1 r r r r r r2 r8 a8 b a |

  b4 a8 b~ b a~ a b~ | b2. b8 b | b a~ a a~ a b~ b a~ | a2. r8 a8 |
  a8 b~ b g~ g fis~ fis e~ | e4. e4. g8 g | g fis~ fis fis~ fis g~ g fis~ | fis2. r8 a8
  \times 2/3 {b4 b a} \times 2/3 {b b a} | b4 b r4 b8 b |
  b4 a8 a~ a b~ b a~ | a2 r8 a8 a a | a b~ b g~ g fis~ fis e~ | e4. e r8 g8 | g fis~ fis e fis4 g8 fis~ | fis2. r8 fis8 |
  g8 g~ g fis g4 fis8 g~ | g4. g g8 g | a4. g8~ g2 | r4 g8 g a4 g | g1 \bar "|."
  
  

}

letra = \lyricmode {
  Ou -- ça meu a -- mi -- go, as trom -- be -- tas a -- nun -- ci -- an -- do,  
  Os tem -- pos es -- tão mu -- dan -- do, é a no -- va si -- tu -- a -- ção.  
  Os ven -- tos so -- pram for -- tes, ma -- re -- mo -- tos e ter -- re -- mo -- tos,  
  So -- fri -- men -- to_em de -- ma -- si -- a, re -- ve -- la -- do no di -- a_a di -- a.  
  Mas o mes -- tre_a -- nun -- ci -- ou, en -- vi -- ou o Con -- so -- la -- dor,  
  Am -- pa -- ran -- do os a -- fli -- tos, nos pro -- van -- do_o seu a -- mor.  
    
  En -- tão dei -- xe -- mos flo -- res -- cer a se -- men -- te que é luz,  
  A -- man -- do e ser -- vin -- do a dou -- tri -- na de Je -- sus.  
  Dei -- xe -- mos a pá -- tria so -- fri -- da ser o ber -- ço do per -- dão  
  E che -- ga -- re -- mos, com cer -- te -- za, a -- lém da_i -- ma -- gi -- na -- ção,  
  U -- ni -- dos, fra -- ter -- nal -- men -- te, no pla -- ne -- ta re -- ge -- ne -- ra -- ção.  
}

harmonia = \chordmode {
  g\breve d e:m d g d e:m d
  c e:m d c1 
  g\breve d e:m d g d e:m d
  g d e:m d
  e:m c g1
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
