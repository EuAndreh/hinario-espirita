\version "2.16.2"
\pointAndClickOff

\header {
  title = "Quanta Paz"
  composer = "Marcus Vinícius Pereira"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }

}

harmonia = \chordmode {
  r4.
  e2 cis:m e cis:m fis:m b:7 e b:7
  e2 cis:m e cis:m fis:m b:7 e b:7

  e2 cis:m e cis:m fis:m b:7 e b:7
  e2 cis:m e cis:m fis:m b:7 e e:7

  \repeat percent 2 {a1} \repeat percent 2 {gis:m}
  fis:m a2 b:7 e1 e:7

  \repeat percent 2 {a1} \repeat percent 2 {gis:m}
  fis:m a2 b:7 e2 b:7 e b:7

  e2 cis:m e cis:m fis:m b:7 e b:7
  e2 cis:m e cis:m fis:m b:7 e1
}

letra = \lyricmode {
  Oh, meu Je -- sus,
  Quan -- do to -- cas a mi -- nh'al -- ma
  Com Teu a -- mor que me re -- vi -- go -- ra~e traz
  O teu sem -- blan -- te que tu -- do~em mim a -- cal -- ma
  Oh, meu Se -- nhor,
  Nes -- sas ho -- ras quan -- ta paz!

  É bom sen -- tir,
  Quan -- do~es -- tou jun -- to con -- ti -- go,
  Que~a Tu -- a luz me re -- no -- va~o co -- ra -- ção.
  E to -- da pro -- va que sur -- ge, meu a -- mi -- go,
  Se tor -- na bên -- ção, tra -- ba -- lho~e o -- ra -- ção.

  Oh, meu Je -- sus
  Se -- ja sem -- pre~o meu a -- pre -- ço,
  O de -- mons -- trar da mi -- nha gra -- ti -- dão,
  Por re -- ce -- ber mui -- to mais do que me -- re -- ço,
  Por tan -- tas bên -- çãos que vêm das Tu -- as mãos.

  Oh, meu Je -- sus
  Se -- ja sem -- pre~o meu ca -- mi -- nho,
  O~e -- xem -- plo vi -- vo do Teu i -- men -- so~a -- mor,
  Da Tu -- a luz, des -- sa paz, des -- se ca -- ri -- nho,
  Por tu -- do,~en -- fim, que vêm de Ti, Se -- nhor.

  Oh, meu Je -- sus,
  Quan -- do to -- cas a mi -- nh'al -- ma
  Com Teu a -- mor que me re -- vi -- go -- ra~e traz
  O teu sem -- blan -- te que tu -- do~em mim a -- cal -- ma
  Oh, meu Se -- nhor,
  Nes -- sas ho -- ras quan -- ta paz!
}

melodia = \relative c' {
  \clef treble
  \key e \major
  \time 4/4
  \tempo 4 = 100

   \partial 4. b8 e fis |
   gis4 gis8 gis gis fis e fis | gis4 e4 r8 e8 a gis | cis,4 cis8 e dis dis gis fis | b,2 r8 b8 e fis |
   gis4 gis8 gis gis fis e fis | gis4 e r8 e a gis | cis,4 cis8 e dis dis gis fis | e2 r8 b8 e fis |

   gis4 gis8 gis gis fis e fis | gis4 e r8 e8 a gis | cis,4 cis8 e dis dis gis fis | b,2 r8 b e fis |
   gis4 gis8 gis gis fis e fis | gis( b) gis4 r8 e8 a gis | cis,4 cis8 e dis dis gis fis | e2 r8 e8 a b \bar "||"

   cis4 cis8 cis cis b a b | cis4 cis4 r8 a8 a cis | b4. cis8 b a gis a | b2 r8 e,8 e b' |
   a4 a8 a a gis fis gis | a4 fis4 r8 b,8 b a' | gis4 gis8 fis gis fis gis a | b2 r8 a8 a b |

   cis4 cis8 cis cis b a b | cis4 cis r8 cis8 e cis | dis4 b8 cis b a gis a | b2 r8 e,8 e b' |
   a4 a8 a a gis fis gis | a4 fis r8 b,8 b a' | gis4. a8 fis e dis fis | e2 r8 b8 e fis \bar "||"

   gis4 gis8 gis gis fis e fis | gis4 e4 r8 e8 a gis | cis,4 cis8 e dis dis gis fis | b,2 r8 b8 e fis |
   gis4 gis8 gis gis fis e fis | gis( b) e,4 r8 e a gis | cis,4 cis8 e dis dis gis fis | e1 \bar "|."
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
