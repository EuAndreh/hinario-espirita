\version "2.16.0"
\pointAndClickOff

\header {
  title = "Jesus Está Contigo"
  composer = "Rinaldo Giatti"
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

global = {
  \key e \major
  \time 4/4
  \tempo 4 = 100
  \clef treble
}

introToSegno = \relative c' {
  \partial 16 b16 |
  gis'8 b gis fis gis8. fis16~ fis8 e | cis fis fis e gis8. fis16~ fis8. b,16 |
  a' a8 a16~ a b8  gis16~ gis8 fis e fis | gis4~( gis16 fis e fis~ fis2) |
  gis8 b gis fis gis8. fis16~ fis8 e | cis fis fis e gis8. fis16~ fis8. b,16 |
  a' a8 a16~ a b8  gis16~ gis8 fis e fis16 fis(
  e2)  r2
}

segnoToCoda = \relative c' {
  r4 cis'4 b8.fis16~ fis8 a | gis4.( fis8 gis2) |
  a16 a8 a16~ a a8 b16~ b8 b b a | gis2 r2 |
  r4 cis8 cis b8.fis16~ fis8 a | gis4.( fis8 e4.) r16 cis16 |
  fis16 fis8 fis16~ fis gis8 a16~ a a8 gis16~ gis fis8 fis16~(  |
}

segundaEstrofe = \relative c' {
  fis16 e~~ e4.) r4.. b16 |
  gis'8 b gis fis gis8. fis16~ fis8 e | cis fis fis e gis8. fis16~ fis4 |
  a16 a8 a16~ a b8  gis16~ gis8 fis e fis | gis4~( gis16 fis e fis~ fis4.) r16 b,16 |
  gis'8 b gis fis gis8. fis16~ fis8 e | cis fis fis e gis8. fis16~ fis4 |
  a16 a8 a16 a8 b16 gis16~ gis8 fis e fis16 fis( 
  \break
  fis16 e~ e4.) r2_(
}

codaToEnd = \relative c' {
  fis16 e~ e4.) r4.. b16 |
  gis'8 b gis fis gis2 |
  fis2. r8. b,16 | a' a8 a16~ a b8  gis16~ gis8 fis e fis16 gis~ | 
  gis1 | a16 a8 a16 a8 b16 gis16~ gis8 fis e fis16 fis( 
  e1)~ e
}

letra = \lyricmode {
  Não dei -- xe que se_a -- pa -- gue o bri -- lho dos seus o -- lhos,  
  Não dei -- xe a tris -- te -- za te le -- var.   
  Po -- nha um sor -- ri -- so bo -- ni -- to no seu ros -- to,  
  As -- sim é bem mais fá -- cil ca -- mi -- nhar.   
    
  O Sol vai bri -- lhar,   
  Dei -- xe_o_a -- mor do Cris -- to te_a -- que -- cer.   
  De -- sis -- tir, nem pen -- sar,   
  'cê sa -- be_a vi -- da_é fei -- ta pra vi -- ver.  
    
  Es -- que -- ça_os seus pro -- ble -- mas, cul -- ti -- ve_a a -- le -- gri -- a,  
  A -- bra_o co -- ra -- ção pro_a -- mor en -- trar.   
  Je -- sus es -- tá con -- ti -- go e, com su -- a pre -- sen -- ça,  
  Na -- da se -- rá ca -- paz de te_a -- ba -- lar.   
    
  Je -- sus es -- tá con -- ti -- go, as -- sim é bem mais fá -- cil ca -- mi -- nhar.   
  Na -- da se -- rá ca -- paz de te_a -- ba -- lar.    
    
    
  
}

introToSegnoChords = \chordmode {
  s16
  e1 fis:m a2 b:7 e b:7
  e1 fis:m a2 b:7 e e:7
}
  
segnoToCodaChords = \chordmode {
  a b:7 e cis:m fis:m b:7 e e:7
  a b:7 e cis:m fis:m b:7 
 
}

segundaEstrofeChords = \chordmode {
  e b:7
  e1 fis:m a2 b:7 e b:7
  e1 fis:m a2 b:7 e e:7
}

codaToEndChords = \chordmode {
  e2 b:7 
  e1 fis:m a2 b:7 e cis:m fis:m b:7 a a:m e
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \segundaEstrofeChords
      \codaToEndChords
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
        
        \segundaEstrofe
        
        \bar "."
        \mark \markup { \center-align { \musicglyph #"scripts.segno" "al" \musicglyph #"scripts.coda" }}
        \codaToEnd
        \bar "|."
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \layout {}
}

\score {
  <<
    \new ChordNames { 
      \introToSegnoChords
      \segnoToCodaChords
      \segundaEstrofeChords
      \segnoToCodaChords
      \codaToEndChords
    }
    \new Staff <<
      \new Voice = "melodia" { 
        \global
        
        \introToSegno
        \segnoToCoda
        \segundaEstrofe
        \segnoToCoda
        \codaToEnd
      }
      \lyricsto "melodia" \new Lyrics \letra
      \set Staff.midiInstrument = #"acoustic grand"
    >>
  >>
  \midi {}
}