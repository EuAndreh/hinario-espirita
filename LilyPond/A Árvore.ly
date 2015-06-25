\version "2.16.0"
\pointAndClickOff

\header {
  title = "A Árvore"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

melodia = \relative c' {
  \key d \major
  \time 3/4
  \tempo 4 = 90
  \clef treble

  % 1
  \partial 4 fis8 e |
  d4 d fis8 g | a 4 a fis8 e | d4 b d8 e | fis4 fis g8 fis |
  g4 g fis8 e | fis4 fis e8 d | e4 e e8 fis | e4 e fis8 e \bar "||"
  
  d4 d fis8 g | a 4 a fis8 e | d4 b d8 e | fis2 g8 fis |
  g4 g fis8 e | fis4 fis e8 d | e4 e e8 fis | e2 fis8 e \bar "||"
  
  d4 d fis8 g | a 4 a fis8 e | d4 b d8 e | fis2 g8 fis |
  g4 g fis8 e | fis4 fis e8 d | e4 e e8 fis | e2 a8 a |
  
  \repeat volta 2 {
  b4 b a8 g | a4 a d,8 d | b'4 b a8 g | a2 g8 fis |
  g4 g fis8 e | fis4 fis e8 d |  }
  \alternative {
    { e4 e e8 fis | e2 a8 a | }
    { e4 e d8 cis | d2. }
  }
  \bar "|."
}

letra = \lyricmode {
  Sou a ár -- vo -- re fron -- do -- sa,  
  Sem -- pre ver -- de, sem -- pre_a -- mi -- ga.  
  Sou o pou -- so dos can -- sa -- dos  
  Que os pás -- sa -- ros a -- bri -- ga.  
            
  Em meus ra -- mos fa -- zem ni -- nhos  
  A -- ve -- zi -- nhas do Se -- nhor.  
  Es -- tou sem -- pre cal -- ma_e pron -- ta  
  Pa -- ra con -- ce -- der a -- mor.  
    
  Se me fe -- rem eu per -- dô -- o,  
  Não pa -- ro pra me vin -- gar,  
  Des -- se mo -- do mos -- tro_aos ho -- mens  
  U -- ma ma -- nei -- ra de_a -- mar.  
    
  Meu me -- 
  \repeat volta 2 {
  ni -- no, não se zan -- gue  
  Com al -- guém que_o mal -- tra -- tar  
  Se vo -- cê qui -- ser ser gran -- de  
  De -- ve }
  \alternative {
    { sa -- ber per -- do -- ar.  Meu me -- }
    { sa -- ber per -- do -- ar. }
  }
  
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  r4 | d2. | a  b:m fis:m g d \repeat percent 2 {a:7}
  b:m fis:m g fis:m g d \repeat percent 2 {a:7}
  b:m fis:m g fis:m g d \repeat percent 2 {a:7}
  \repeat volta 2 {
    b:m fis:m g fis:m g d 
  }
  \alternative {
    { \repeat percent 2 {a:7} }
    { a:7 d }
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