\version "2.16.0"
\pointAndClickOff

\header {
  title = "Encontro Marcado"
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
  \time 6/8
  \tempo 4. = 60
  \clef treble

  \partial 2 d8 d cis b |
  e2. r4 e8 e cis a | fis'2. r4 d8 d e fis |
  g a g fis4 e8~ e4 e8 e d cis | a'2. | r4 fis8 fis g a |
  b2. | r4 e,8 e fis g | a2. | r4 d,8 d e fis |
  g a g fis4 e8~ e4 e8 e d cis | d2.
  r4 d8 d cis b |
  
  \bar "||"
  e2. r4 e8 e cis a | fis'2. r4 d8 d e fis |
  g a g fis4 e8~ e4 e8 e d cis | a'2. | r4 fis8 fis g a |
  b4. b | r4 e,8 e fis g | a2. | r4 d,8 d e fis |
  g a g fis4 e8~ e4 e8 e d cis | d2. \bar "||"
  
  r4 d8 d cis b | a2 b8 cis | 
  d e4~ e fis8 | fis2 e8 fis | 
  e4 d8 d cis b | a2 b8 cis | 
  d e4~ e fis8 | fis2 e8 fis | 
  e4 fis8 fis e d |
  
  fis2 g8 a | b a g fis4. | r8 e8 d e4. | r4 fis8 fis e d |
  fis2 g8 a | b a g fis4 e8~ | e4 d8 e4. | r4 fis8 fis e d |
  
  cis2 d8 e | fis e2 d8 | cis2 d8 e | 
  fis4 fis8 fis e d |
  \repeat volta 2 {
    g a g fis4 e8~ e4 e8 e d cis | 
  }
  \alternative {
     { e d e d4. | r4 fis8 fis e d }
     { e d e d4.~ | d2. }
  }
   
}

letra = \lyricmode {
  Ao a -- noi -- te -- cer em Ca -- far -- na -- um,
  A ca -- sa de Pe -- dro, tão sim -- ples, ca -- si -- nha co -- mum,
  Se_en -- chi -- a de paz, re -- ple -- ta de luz,
  Ou -- vin -- do_as pa -- la -- vras e -- ter -- nas  do mes -- tre Je -- sus.

  Vou me_i -- ma -- gi -- nar sen -- ta -- do a -- li
  En -- tre Jo -- ão, Pe -- dro, Ti -- a -- go,  An -- dré e Le -- vi,
  À bei -- ra do la -- go  de Ge -- ne -- sa -- ré,
  Lan -- çan -- do na al -- ma, pra sem -- pre, se -- men -- tes de fé.

  E eu, tão cri -- an -- ça, a -- in -- da, na -- que -- le lu -- gar,
  Quem sa -- be Je -- sus me le -- vas -- se pa -- ra pas -- se -- ar
  No quin -- tal da ca -- sa de Pe -- dro à luz do lu -- ar,
  Sen -- tin -- do a bri -- sa da noi -- te_e_o per -- fu -- me do mar,
  Dis -- ses -- se pra mim:
  "\"Já" é ho -- ra de vo -- cê vol -- tar.
  A gen -- te se_en -- con -- tra de no -- vo
  No seu e -- van -- ge -- lho no "lar.\""

  A gen -- te se_en
  ge -- lho no "lar.\""
}

harmonia = \chordmode {
  s2
  e2.:m a:7 d b:m e:m a:7 d d:7 g a:7 d b:m e:m a:7 d r
  e2.:m a:7 d b:m e:m a:7 d d:7 g a:7 d b:m e:m a:7 \repeat percent 3 {d}
  b:m e:m a:7 d b:m e:m a:7 
  fis:m g \repeat percent 2 {a:7}
  fis:m g \repeat percent 2 {a:7}
  fis:m b:m fis:m b:m
  \repeat volta 2 { 
    g a:7
  }
  \alternative {
   { d b:m }
   { g d }
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