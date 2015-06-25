\version "2.16.2"

%\pointAndClickOff
% first, define a variable to hold the formatted date:
date = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = "O Fim da Estrada"
  composer = "Alexandre Paredes"
  arranger = "arr.: André Miranda"
  subsubtitle = \date
}

global = {
  \clef "treble_8"
  \key g \major
  \time 4/4
  \tempo 4 = 140
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  
  % Primeira estrofe
  g1:6 e:m7 b:m7 c:maj7
  g1:6 e:m7 b:m7 c:maj7  \repeat percent 2 {c:m6}
  b:m7 c:maj7 b:m7 c:maj7 \repeat percent 2 {d:7}
  
  % Segunda estrofe
  g1:6 e:m7 b:m7 c:maj7
  g1:6 e:m7 b:m7 c:maj7 \repeat percent 2 {c:m6}
  
  % Refrão 1
  g:6 e:m7 c:6 d:7.9
  g:6 e:m7 c:6 d:7.9 g:6
  e:m7 c:maj7 d:7.9 g:6
  e:m7 c:maj7 \repeat percent 2 {d:7.9}
  
  % Interlúdio 1
  c:maj7 b:m7 c:maj7 b:m7
  c:maj7 b:m7 c:maj7.9 \repeat percent 2 {c:m6}
  
  % Interlúdio 2
  \repeat percent 2 {a:m7} \repeat percent 2 {b:m7} \repeat percent 2 {c:6} \repeat percent 2 {d:7.9}
  
  % Refrão 2
  g:6 e:m7 c:6 d:7.9
  g:6 e:m7 c:6 d:7.9 g:6 e:m7 c:6 d:7.9 g:6
}

melodia = \relative c' {
  
  
  % Primeira estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis1 |
  g8 g4 g4. e4 | 
  
  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g4 g8 g~ g4 fis | ees'1~ | ees2. g,8 g |
  
  b4 b8 b~ b4 c | a4. g8 r4 g8 g | b4. b c4 | a2 a4 g4 | d'1~ | d \bar "||"
  
  % Segunda estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g g4 g4. e4 | 
  
  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g4 g8 g~ g4 fis | ees'1~ | ees \bar "||"
  
  % Refrão 1
  r4 \repeat volta 2 { b8 a4 b4. | r4 b8 a4 b4. | r4 e8 e e e4 fis8 | d2 d4 b | 
  b4 b8 a4 b4. | r4 b8 a4 b4. | r4 e8 e e e4 fis8 | d4. c4 d b8 | 
  b4~ }  \mark \markup { \musicglyph #"scripts.segno" }
  b2.~ | b1 |
    
  \compressFullBarRests  
  R1*7
    
  % Interlúdio, parte 1
  b1( | a | b | a | b | a | d | ees~ | ees2.) g,8 g \bar "||"
  
  % Interlúdio, parte 2
  g4 g8 g4 fis g8~ | g4( e8 d~ d4.) c'8 | d4 d8 d4 e d8~ | d2. d8 d | e4 e8 e4 d e8~ |
  e2. e8 e | g4 fis8 fis4 e fis8~ | fis1 \bar "||"
    
  % Refrão 2
  b,4~ \repeat volta 2 { b2.~ | b1 | \times 2/3 { e4 e e } e8 e4 fis8 | d4. c4 d b8 | 
  b1~ | b | r4 e8 e e e4 fis8 | d4. c4 d b8 | 
  <>^\markup { D.S. al fine }
  b4~ } \repeat volta 2 { b2.~ |
    b1 | r4 e8 e e e4 fis8 | d4. c4 d b8 | b4~ } b2. |
  \bar "||"
}

melodialetra = \lyricmode {
  Se vo -- cê quer a -- cre -- di -- tar nu -- ma luz que há
Den -- tro de ca -- da um de nós bas -- ta ver em ca -- da~o lhar
Que há sem -- pre uma~es -- pe -- ran -- ça,
E uma no -- va cri -- an -- ça~a nas -- cer.
Se~o teu ca -- mi -- nho~es -- cu -- re -- cer, nun -- ca pa -- re de can -- tar
Que sem -- pre há de~a -- ma -- nhe -- cer e a luz te vol -- ta -- rá.

É noi -- te,  é di -- a,  sem -- pre~há tem -- po pra re -- co -- me -- çar.
De noi -- te,  de di -- a,  sei que~e -- xis -- te~u -- ma~es -- tre -- la~a nos gui -- ar.

Uh __
Quan -- to tem -- po vou vi -- ver a -- té te en -- con -- trar?
Só o tem -- po vai di -- zer
E~es -- se di -- a vai che -- gar

Ah __  vai a -- cen -- der a~es -- pe -- ran -- ça de che -- gar.
que~é um no -- vo co -- me -- ço que vi -- rá.

que~é um no -- vo co -- me -- ço que vi -- rá.

}

vozeum = \relative c' {
  
  % checar necessidade das pausas
  
  % Primeira estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis1 |
  g8 g4 g4. e4 | 
  
  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g4 g8 g~ g4 fis | a1~ | a2. g8 g |
  
  b4 b8 b~ b4 c | a4. g8 r4 g8 g | b4. b c4 | a2 a4 g4 | a1~ | a \bar "||"
  
  % Segunda estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g g4 g4. e4 | 
  
  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g4 g8 g~ g4 fis | a1~ | a \bar "||"
  
  % Refrão 1
  r4 \repeat volta 2 { b8 a4 b4. | r4 b8 a4 b4. | r4 c8 c c c4 d8 | b2 b4 g | 
  g4 b8 a4 b4. | r4 b8 a4 b4. | r4 c8 c c c4 d8 | b4. a4 b g8 | 
  g4~ } g2.~ | g1 |
  
  \compressFullBarRests
  R1*7
    
  % Interlúdio, parte 1
  r4 g8 g g g4 a8 | fis4. d8~ d4 d | e4 e8 e e4( c8) d8~ | d1 |
  r4 g8 g g g4 a8 | fis4. d d4 | g2. fis4 | a1~ | a2. g8 g \bar "||"
  
  % Interlúdio, parte 2
  g4 g8 g4 fis g8~ | g4( e8 d~ d4.) a'8 | b4 b8 b4 c b8~ | b2. b8 b | c4 c8 c4 b c8~ |
  c2. c8 c | e4 d8 d4 c d8~ | d1 \bar "||"
    
  % Refrão 2
  r4 \repeat volta 2 { b8 a4 b4. | r4 b8 a4 b4. | \times 2/3 { c4 c c } c8 c4 d8 | b4. a4 b g8 | 
  g4 b8 a4( b4.) | r8 b4 a b4. | r4 c8 c c c4 d8 | b4. a4 b g8 | 
  g4~ } \repeat volta 2 { g2.~ |
  g1 |
  r4 c8 c c c4 d8 | b4. a4 b g8 | g4~ } g2.
  \bar "||"

}

vozeumletra = \lyricmode {
  Se vo -- cê quer a -- cre -- di -- tar nu -- ma luz que há
Den -- tro de ca -- da um de nós bas -- ta ver em ca -- da~o lhar
Que há sem -- pre uma~es -- pe -- ran -- ça,
E uma no -- va cri -- an -- ça~a nas -- cer.
Se~o teu ca -- mi -- nho~es -- cu -- re -- cer, nun -- ca pa -- re de can -- tar
Que sem -- pre há de~a -- ma -- nhe -- cer e a luz te vol -- ta -- rá.

É noi -- te,  é di -- a,  sem -- pre~há tem -- po pra re -- co -- me -- çar.
De noi -- te,  de di -- a,  sei que~e -- xis -- te~u -- ma~es -- tre -- la~a nos gui -- ar.

Sem -- pre vou te se -- guin -- do, mi -- nha~es -- tre -- la gui -- a
Nes -- se lon -- go ca -- mi -- nho que não tem fim.
Quan -- to tem -- po vou vi -- ver a -- té te en -- con -- trar?
Só o tem -- po vai di -- zer
E~es -- se di -- a vai che -- gar

A -- mi -- go,  co -- mi -- go vai a -- cen -- der a~es -- pe -- ran -- ça de che -- gar.
É~o fim da~es -- tra -- da,  que~é um no -- vo co -- me -- ço que vi -- rá.

que~é um no -- vo co -- me -- ço que vi -- rá.

}

vozedois = \relative c' {
  
  % checar necessidade das pausas
  
  % Primeira estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis1 |
  g8 g4 g4. e4 | 
  
  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g4 g8 g~ g4 fis | g1~ | g2. g8 g |
  
  b4 b8 b~ b4 c | a4. g8 r4 g8 g | b4. b c4 | a2 a4 g4 | fis1~ | fis \bar "||"
  
  % Segunda estrofe
  r4 b8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g g4 g4. e4 | 
  
  d4 b'8 a4 b g8~ | g4 b8 a4 b fis8~ | fis2. e8 fis | 
  g4 g8 g~ g4 fis | g1~ | g \bar "||"
  
  % Refrão 1
  r4 \repeat volta 2 { b8 a4 b4. | r4 b8 a4 b4. | r4 g8 g g g4 a8 | fis2 fis4 d | 
  d4 b'8 a4 b4. | r4 b8 a4 b4. | r4 g8 g g g4 a8 | fis4. e4 fis d8 | 
  d4~ } d2.~ | d1 |
  
  \compressFullBarRests
  R1*7
    
  % Interlúdio, parte 1
  e1( | fis | g | fis | e | fis | g | g~ | g2.) g8 g \bar "||"
  
  % Interlúdio, parte 2
  g4 g8 g4 fis g8~ | g4( e8 d~ d4.) e8 | fis4 fis8 fis4 g fis8~ | fis2. fis8 fis | g4 g8 g4 fis g8~ |
  g2. g8 g | b4 a8 a4 g a8~ | a1 \bar "||"
    
  % Refrão 2
  d,4~ \repeat volta 2 { d2.~ | d1 | \times 2/3 { g4 g g } g8 g4 a8 | fis4. e4 fis d8 | 
  d1~ | d | r4 g8 g g g4 a8 | fis4. e4 fis d8 | 
  d4~ } \repeat volta 2 { d2.~ 
  d1 |
  r4 g8 g g g4 a8 | fis4. e4 fis d8 | d4~ } d2. |
  \bar "||"

}

vozedoisletra = \lyricmode {
  Se vo -- cê quer a -- cre -- di -- tar nu -- ma luz que há
Den -- tro de ca -- da um de nós bas -- ta ver em ca -- da~o lhar
Que há sem -- pre uma~es -- pe -- ran -- ça,
E uma no -- va cri -- an -- ça~a nas -- cer.
Se~o teu ca -- mi -- nho~es -- cu -- re -- cer, nun -- ca pa -- re de can -- tar
Que sem -- pre há de~a -- ma -- nhe -- cer e a luz te vol -- ta -- rá.

É noi -- te,  é di -- a,  sem -- pre~há tem -- po pra re -- co -- me -- çar.
De noi -- te,  de di -- a,  sei que~e -- xis -- te~u -- ma~es -- tre -- la~a nos gui -- ar.

Uh __
Quan -- to tem -- po vou vi -- ver a -- té te en -- con -- trar?
Só o tem -- po vai di -- zer
E~es -- se di -- a vai che -- gar

Ah __ vai a -- cen -- der a~es -- pe -- ran -- ça de che -- gar.
que~é um no -- vo co -- me -- ço que vi -- rá.

que~é um no -- vo co -- me -- ço que vi -- rá.

}

\score {
  \new ChoirStaff <<
    \new ChordNames {
      \harmonia
    }
      
    \new Staff <<
      \new Voice = "melodia" <<
        \global
        \melodia
      >>
      \lyricsto "melodia" \new Lyrics \melodialetra
 
      \set Staff.midiInstrument = #"acoustic grand"
      \set Staff.instrumentName = #"MJP"
    >>

    \new Staff <<
      \new Voice = "vozeum" <<
        \global
        \vozeum
      >>
      \lyricsto "vozeum" \new Lyrics \vozeumletra
      \set Staff.midiInstrument = #"acoustic grand"
      \set Staff.instrumentName = #"A. McK."
    >>
    
    \new Staff <<
      \new Voice = "vozedois" <<
        \global
        \vozedois
      >>
      \lyricsto "vozedois" \new Lyrics \vozedoisletra
      \set Staff.midiInstrument = #"acoustic grand"
      \set Staff.instrumentName = #"p"
    >>
    
  >>
  \layout {}
  \midi {}
}