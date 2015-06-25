\version "2.16.0"
\pointAndClickOff

\header {
  title = "A Barca"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}
global = {
  \key d \major
  \time 6/8
  \tempo 4. = 60
  \clef treble
}

introToSegno = \relative c' {
  fis2. | r8 e8 fis g fis e | d4. d | r4. d4 d8 |
  g4. g | r4 g8 g fis g | e4. e | r4 a,8 d4 e8 |
  fis4. fis | r4 fis8 g4 e8 | d4. d 
}

segnoToCoda = \relative c' {
  r4. d4. | b'2. | r8 b8 cis d cis b | a4. a |
  r4. g4 fis8 | g2. | r8 g8 a b a g | fis4. fis |
  r4. d4 d8 | b'4. b | r8 b8 cis d cis b | a4. a |
  r4. g4 fis8 | g2. | r8 e8 fis g fis e | d2. | r2. 
}

estrofeDois = \relative c' {
  fis2. | r8 e8 fis g fis e | d4. d | r4. d4 d8 |
  g4. g | r4 g8 g fis g | e4. e | r4 a,8 d4 e8 |
  fis4. fis | r4 fis8 g4 e8 | d4. d 
}

estrofeTres = \relative c' {
  fis2. | r8 e8 fis g fis e | d4. d | r4. d4 d8 |
  g4. g | r4 g8 g fis g | e4. e | r4 a,8 d4 e8 |
  fis4. fis | r4 fis8 g4 e8 | d4. d 
}

letra = \lyricmode {
  Tu te_a -- bei -- ras -- te da pra -- ia.
  Não bus -- cas -- te nem sá -- bios, nem ri -- cos
  So -- men -- te que -- res  que eu te si -- ga.

  Se -- nhor, tu me_o -- lhas -- te nos o -- lhos,
  A sor -- rir,  pro -- nun -- cias -- te meu no -- me
  Lá na pra -- ia, eu lar -- guei o meu bar -- co
  Jun -- to_a ti,  bus -- ca -- rei ou -- tro mar...

  Tu sa -- bes bem que,_em meu bar -- co,
  Eu não te -- nho nem ou -- ro, nem_es -- pa -- das
  So -- men -- te_a re -- de e_o meu tra -- ba -- lho.

  Tu, pes -- ca -- dor de_ou -- tros la -- gos,
  Ân -- sia_e -- ter -- na de al -- mas que_es -- pe -- ram
  Bon -- do -- so_a -- mi -- go, que_as -- sim me cha -- mas.
}

introToSegnoChords = \chordmode {
  d2.: | a:7 | d | d:7 
  \repeat percent 2 {g} \repeat percent 2 {a:7}
  d | a:7 | d 
}

segnoToCodaChords = \chordmode {
  d:7  \repeat percent 2 {g} | d | b:m |
  e:m7 | a:7 | d | d:7 |
  \repeat percent 2 {g} | d | b:m |
  e:m7 | a:7 | d | a:7 |
}

estrofeDoisChords = \chordmode {
  d2.: | a:7 | d | d:7 
  \repeat percent 2 {g} \repeat percent 2 {a:7}
  d | a:7 | d
}

estrofeTresChords = \chordmode {
  d2.: | a:7 | d | d:7 
  \repeat percent 2 {g} \repeat percent 2 {a:7}
  d | a:7 | d 
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \estrofeDoisChords
      \estrofeTresChords
      d 
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        
        \mark \markup { \musicglyph #"scripts.segno" }
        \bar "."
        \segnoToCoda
        \bar "."
        \mark \markup { \musicglyph #"scripts.coda" }
        
        \estrofeDois
        \bar "."
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
        \estrofeTres
        \bar "."
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
        r
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
      \segnoToCodaChords
      \estrofeDoisChords
      \segnoToCodaChords
      \estrofeTresChords
      \segnoToCodaChords
      d
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        \introToSegno
        \segnoToCoda
        \estrofeDois
        \segnoToCoda
        \estrofeTres
        \segnoToCoda
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \midi {}
}
