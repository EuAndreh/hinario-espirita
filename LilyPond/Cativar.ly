\version "2.16.0"
%\pointAndClickOff

\header {
  title = "Cativar"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

melodia = \relative c' {
  \key d \major
  \time 6/8
  \tempo 8 = 160
  \clef treble

  % 1
  d8 d d d cis d | b b b b cis d | e e e e fis e | a,4.~ a4 a8 |
  d d d d cis d | b b b b cis d | e e e e fis g | e2. |
  
  d8 d d d cis d | b b b b cis d | e e e e fis e | a,4.~ a4 a8 |
  d d d d cis d | b b b b cis d | e e e e fis g | e4. r8 fis8 g \bar "||"
  
  a4.~ a8 fis e | d4.~ d8 g a | b4.~ b8 g fis | e4.~ e8 fis g |
  a4.~ a8 fis e | d4.~ d8 g a | b4.~ b8 g fis | e4.~ e8 fis e |
  d4.~ d8 fis e | d4.~ d8 fis e | d4.~ d8 g fis | e4.~ e8 fis e |
  d4.~ d8 fis e | d4.~ d8 fis e | d2. | fis4. e | d2. \bar "||"
}

letra = \lyricmode {
  Quan -- do_um ir -- mão nos pro -- cu -- ra em bus -- ca de_a -- po -- io con -- for -- to e luz  
  É nos -- so de -- ver pros -- se -- guir na se -- a -- ra de_a -- mor em no -- me de Je -- sus.  
  Ou -- tro nos che -- ga con -- tan -- do as di -- fi -- cul -- da -- des e do -- res do lar  
  É nos -- so de -- ver pros -- se -- guir na se -- a -- ra de_a -- mor e tam -- bém ca -- ti -- var  
    
  Ca -- ti -- var é a -- mar  
  É tam -- bém car -- re -- gar  
  Um pou -- qui -- nho da dor  
  Que_al -- guém tem que le -- var.  
    
  Ca -- ti -- vou, dis -- se_al -- guém, la -- ços for -- tes cri -- ou.  
  Res -- pon -- sá -- vel_é vo -- cê pe -- lo que ca -- ti -- vou  
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  d2. b:m7 e:m7 a:7
  d2. b:m7 e:m7 a:7
  d2. b:m7 e:m7 a:7
  d2. b:m7 e:m7 a:7
  
  d2. b:m7 e:m7 a:7
  d2. b:m7 e:m7 a:7
  d2. b:m7 e:m7 a:7
  d2. b:m7 e:m7 a:7
  d
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
