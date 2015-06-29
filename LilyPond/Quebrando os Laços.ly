\version "2.16.0"
\pointAndClickOff

\header {
  title = "Quebrando os Laços"
  poet = "Auta de Souza"
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
  \key c \major
  \time 4/4
  \tempo 4 = 110
  \clef treble
  
  r4. e8 e4 f8 e~ | e e d c~ c g~ g4 | r4. e'8 e4 f8 e8~ | e e d c~ c2 |
  r4. f8 f4 g8 f~ f f e d~ d c~ c c | e f d2. | r1
  
  r4. e8 e e~ e f8 | e4 d8 c~ c g~ g4 | r4. e'8 e e~ e f8 | e4 d8 c~ c2 |
  r4. f8 f4 g8 f~ f f e d~ d c~ c c | e f d2. | r1
  
  r4. e8 e e~ e f8 | e4 d8 c~ c g~ g4 | r4. e'8 e4 f8 e~ | e e d c~ c2 |
  r4. f8 f4 g8 f~ f f e d~ d c~ c c | e f d2. | r1
  
  \key d \major
  r4. fis8 fis4 g8 fis~ | fis fis e8 d~ d a~ a4 | r4. fis'8 fis4 g8 fis~ | fis fis e8 d~ d d4. |
  r4. g8 g4 a8 g~ g g fis e~ e d~ d d | fis g fis4 e2 | r1
  
  r4. fis8 fis fis~ fis g8 | fis4 e8 d~ d a~ a4 | r4. fis'8 fis fis~ fis g8 | fis4 e8 d~ d d4. |
  r4. g8 g g4 a8 g4 fis8 e~ e d~ d d | fis g fis4 e2 | r1
  
  \key e \major
  \repeat volta 2 {
    r4. gis8 gis gis~ gis a8 | gis4 fis8 e~ e b~ b4 | r4. gis'8 gis4 a8 gis~ | gis gis fis e~ e e4. |
    r4. a8 a a4 b8 a4 gis8 fis~ fis e~ e e | gis a gis4 fis2 | r1
  }
}

letra = \lyricmode {
  Fu -- gir à má -- goa ter -- re -- na  
  E_ao so -- nho, que faz so -- frer,  
  Dei -- xar o mun -- do sem pe -- na se -- rá mor -- rer?  
  
  Fu -- gir nes -- te_an -- se -- io_in -- fin -- do  
  À tre -- va do_a -- noi -- te -- cer,  
  Bus -- car a_au -- ro -- ra sor -- rin -- do se -- rá mor -- rer?  
  
  E_ao gri -- to que_a dor ar -- ran -- ca  
  E_o co -- ra -- ção faz tre -- mer,  
  Vo -- ar u -- ma pom -- ba bran -- ca se -- rá mor -- rer?  
  
  Lá vai a pom -- ba vo -- an -- do  
  Li -- vre,_a -- tra -- vés dos es -- pa -- ços...  
  Sa -- co -- de_as a -- sas can -- tan -- do: “que -- brei meus la -- ços!”  
  
  A -- qui, n'am -- pli -- dão li -- ber -- ta,  
  Quem po -- de de -- ter- -- me_os pas -- sos?  
  Dei -- xei a pri -- são de -- ser -- ta, “que -- brei meus la -- ços!”  
  
  Je -- sus, es -- te vôo in -- fin -- do  
  Há de_am -- pa -- rar- -- me nos bra -- ços,  
  En -- quan -- to_eu di -- rei sor -- rin -- do: “que -- brei meus la -- ços!”  
}

harmonia = \chordmode {
  c\longa f\breve g:7
  c\longa f\breve g:7
  c\longa f\breve g:7
  
  d\longa g\breve a:7
  d\longa g\breve a:7
  
  \repeat volta 2 {
    e\longa a\breve b:7
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
  