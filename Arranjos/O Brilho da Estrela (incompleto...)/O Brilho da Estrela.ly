\version "2.16.2"

%\pointAndClickOff
date = #(strftime "%d-%m-%Y" (localtime (current-time)))

\header {
  title = "O Brilho da Estrela"
  composer = "Alexandre Lacerda"
  arranger = "arr.: André Miranda"
  subsubtitle = \date
}

global = {
  \clef "treble_8"
  \key g \major
  \time 4/4
  \tempo 4 = 120
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  
  g2 c | g d | g c | g d |
  e:m c | g d | c1 | d:7~ | d:7

  %r4|
  g2 c | g d | g2 c | g d | 
  g2 c | g d | g2 c | d1 | 
  e2:m c | g d | e2:m c | g d | 
  e2:m c | g d | c1 | d1:7 | d1:7 |
  
  g2 c | g d | g2 c | d1 | 
  e2:m c | g d | c1 | d:7 |
  g2 c | g d | g2 c | d1 | 
  e2:m c | g d | c d:7~ | r1 | 

  
}

vozum = \relative c' {
  b4.( c8~ c2 | d4. d8~ d2 |
  
  b4. c8~ c d~ d16 e8. | g4. fis8~ fis e d e~  |
  
  e1 | e4. d8~ d c b c~ |
  c4. c8~ c2 | d1 | d2.) r4 \bar "||"
  r1 | r | r | r | r | r | r | r2. r8 g,16 a | 
  b8 d~ d a~ a g g e'~ | e d b d~ d a~ a4 |
  r1 | r2. r8 b16 a |
                   % outra nota ao inv´es de mi€???
  g8 g g g~ g4~ g8 e'~ | e d b d~ d a r4 |
  r1 | c8 c c c~ c b g a~ | a2. r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~ | a2. r8 b16 a |
  g8 g g g~ g g~ g e'~ | e d b d~ d4 r16 a16 a b | c8 c c c~ c b c a~ | a2. r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d d~ | d2. r8 b16 a |
  g8 g g g~ g g~ g e'~ | e d b d~ d4 r4 | r1 \bar "||" |
  r1 | r \bar "||"
  
  g,8 g b, c~ c c e d~ | d2. r16 d e fis | g8 g~ g g~ g g a e~( | e d~) d2 r8 e16 fis |
  g8 g g g~ g g g b~ | b c d a( g4) r8 g16 a | b8 b b a~ a g e a~ | a2. r8 g16 a | 

  b8 d~ d a~ a g g e'~ | e d b d~ d a~ a8. a16  | b8 b b a~ a g g e16 g16~ | g8 g a a~ a4 r8 b16 a |
  g8 g g g~ g4~ g8 e'~ | e d b d~ d a r8 a16 b | c8 c c c~ c d e e~( | e d~) d2.~ | d2. r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~ | a2. r8 b16 a |
  g8 g g g~ g g~ g e'~ | e d b d~ d4 r16 a16 a b | c8 c c c~ c b c a~ | a2. r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~ | a2. r8 b16 a |
  g8 g g g~ g g~ g e'~ | e d b d~ d4 r16 a16 a b | c8 c e, a~ a g fis g~ | g2. r4 \bar "||"
  
  
  
 
}

vozumletra = \lyricmode {
  Ah
  Que a tem -- pes -- ta -- de não cai pa -- ra sem -- pre
    
  Há~u -- ma for -- ça mai -- or den -- tro da gen -- te
  le -- va a re -- co -- me -- çar
  
  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  E tu -- do~em vol -- ta se~i -- lu -- mi -- na -- rá
  
  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  
  
  di -- as a pres -- sa~é mai -- or.
  Ou a tris -- te -- za quer nos ven -- cer.
  Um pro -- ble -- ma bem sim -- ples pa -- re -- ce pi -- or
  É a ho -- ra~en -- tão de~a -- cre -- di -- tar

  Que a tem -- pes -- ta -- de não cai pa -- ra sem -- pre
  E de -- pois da noi -- te~um no -- vo di -- a vi -- rá
  
  Há~u -- ma for -- ça mai -- or den -- tro da gen -- te
  Que nos le -- va a re -- co -- me -- çar

  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  E tu -- do~em vol -- ta se~i -- lu -- mi -- na -- rá

  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  E tu -- do~em vol -- ta se~i -- lu -- mi -- na -- rá
  
}

melodia = \relative c' {
  g4.( g8~ g2 | a4. a8~ a2 |
  g4. g8~ g b~ b16 c8. | b4. a8~ a2 |
  g4. g8~ g2 | g4. a8~ a2 |
   
  b4. c8~ c2 | d1 | d2.) r16 d,16 e fis \bar "||"
  
  g8 g b, c~ c c e d~ | d2. r16 d e fis | g8 g~ g g~ g g a e~( | e d~) d2 r8 e16 fis |
  g8 g g g~ g g g b~ | b c d a( g4) r8 g16 a | b8 b b a~ a g e a~ | a2. r8 g16 a | 
                                                             % novo dia rapidinho? 
  b8 d~ d a~ a g g e'~ | e d b d~ d a~ a8. a16  | b8 b b a~ a g g e16 g16~ | g8 g a a~ a4 r8 b16 a |
  g8 g g g~ g4~ g8 e'~ | e d b d~ d a r8 a16 b | c8 c c c~ c d e e~( | e d~) d2.~ | d2. r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~ | a2. r8 b16 a |
  g8 g g g~ g g~ g e'~ | e d b d~ d4 r16 a16 a b | c8 c c c~ c b c a~ | a2. r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~ | a2. r8 b16 a |
  g8 g g g~ g g~ g e'~ | e d b d~ d4 r16 a16 a b | c8 c e, a~ a g fis g( <>^\markup { D.C. al " " \musicglyph #"scripts.segno" } | 
  
  
  r1) | r \bar "||"
  
  g8 g b, c~ c c e d~ | d2. r16 d e fis | g8 g~ g g~ g g a e~( | e d~) d2 r4 |
  
  
}

melodialetra = \lyricmode {
  Ah
  Em cer -- tos di -- as a pres -- sa~é mai -- or.
  Ou a tris -- te -- za quer nos ven -- cer.
  Um pro -- ble -- ma bem sim -- ples pa -- re -- ce pi -- or
  É a ho -- ra~en -- tão de~a -- cre -- di -- tar

  Que a tem -- pes -- ta -- de não cai pa -- ra sem -- pre
  % E depois ou Depois????
  E de -- pois da noi -- te~um no -- vo di -- a vi -- rá
  Há~u -- ma for -- ça mai -- or den -- tro da gen -- te
  Que nos le -- va a re -- co -- me -- çar

  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  E tu -- do~em vol -- ta se~i -- lu -- mi -- na -- rá

  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  E tu -- do~em vol -- ta se~i -- lu -- mi -- na -- rá
  
  di -- as a pres -- sa~é mai -- or.
  Ou a tris -- te -- za quer nos ven -- cer.
  
  
  

}

vozdois = \relative c {
   g4.( g8~ g2 | a4. a8~ a2 |
  
  g4. g8~ g a~ a16 b8. | b4. a8~ a2 |
  
  b4. c8~ c2 | d4. d8~ d2 |
  b4. c8~ c2 | d1 | d2.) r4 \bar "||"
  r1 | r | r | r | r | r | r | r2. r8 g16 a | 
  b8 d~ d a~ a g g e'~ | e d b d~ d a~ a4 |
  r1 | r2. r8 b16 a |
  g8 g g g~ g4~ g8 b~ | b a g a~ a fis r4 |
  r1 | c'8 c c c~ c b g a~( | a g~ g fis~ fis4) r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~( | a g~ g fis~ fis4) r8 b16 a |
  g8 g g g~ g g~ g b~ | b a g a~ a4 r16 a16 a b | c8 c c c~ c b c a~ | a2. r8 b16 c \bar "||"
  
  d8 d d g,~ g b~ b b~ | b a g a~ a4 r8 g16 a | b8 b b b~ b c d a~( | a g~ g fis~ fis4) r8 b16 a |
  g8 g g g~ g g~ g b~ | b a g a~ a4 r4 | r1 \bar "||"
  
  r1 | r \bar "||"
  
  g8 g b, c~ c c e d~ | d2. r16 d e fis | g8 g~ g g~ g g a e~( | e d~) d2 r4 |
  
  
 
}

vozdoisletra = \lyricmode {
  Ah
  Que a tem -- pes -- ta -- de não cai pa -- ra sem -- pre
    
  Há~u -- ma for -- ça mai -- or den -- tro da gen -- te
  le -- va a re -- co -- me -- çar
  
  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  E tu -- do~em vol -- ta se~i -- lu -- mi -- na -- rá
  
  Quan -- do~a vi -- da es -- cu -- re -- cer pa -- ra mim
  Sem o me -- do pro céu vou o -- lhar
  
  Pois o bri -- lho da~es -- tre -- la vai me gui -- ar
  
  di -- as a pres -- sa~é mai -- or.
  Ou a tris -- te -- za quer nos ven -- cer.
  
  
  
  

}


\score {
  \new ChoirStaff <<
    \new ChordNames {
      \harmonia
    }
 
   \new Staff <<
     \new Voice = "vozum" {
        \global
        \vozum
     }
     \lyricsto "vozum" \new Lyrics \vozumletra
     \set Staff.midiInstrument = #"acoustic grand"
   >>
   
   \new Staff <<
     \new Voice = "melodia" {
       \global
       \melodia
     }
     \lyricsto "melodia" \new Lyrics \melodialetra
     \set Staff.midiInstrument = #"acoustic grand"
   >>
   
   \new Staff <<
     \new Voice = "vozdois" {
       \global
       \vozdois
     }
     \lyricsto "vozdois" \new Lyrics \vozdoisletra
     \set Staff.midiInstrument = #"acoustic grand"
   >>
  >>
  
  \layout {}
  \midi {}
}