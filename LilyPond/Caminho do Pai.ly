\version "2.16.0"
%\pointAndClickOff

\header {
  title = "Caminho do Pai"
  subsubtitle = #(strftime "%d-%m-%Y" (localtime (current-time)))
  tagline =  \markup {
    \with-url #"http://hinarioespirita.com.br"
    \line { "hinarioespirita.com.br" }
  }
}

melodia = \relative c' {
  \key e \major
  \time 6/8
  \tempo 4. = 60
  \clef treble

  % 1
  b4. b8 cis dis | e4. e8 fis gis | a4 a8 a gis fis | dis4. cis4 cis8 |
  b4. b8 cis dis | e4. e8 fis gis | a4. a8 gis fis | dis4. dis8 e fis |
  gis4. gis8 a gis | gis4. gis8 a gis | fis4. e | fis dis8 e fis |
  gis4. gis8 a gis | gis4. gis8 a gis | fis4. e | fis dis | 
  e4. r4. | r2. | r | r | 
  
  \bar "||"
  b4. b8 cis dis | e4. e8 fis gis | a4. a8 gis fis | dis4. cis4 cis8 |
  b4. b8 cis dis | e4. e8 fis gis | a4. a8 gis fis | dis4. dis8 e fis |
  gis4. gis8 a gis | gis4. gis8 a gis | fis4. e | fis dis8 e fis |
  gis4. gis8 a gis | gis4. gis8 a gis | fis4. e | fis dis | 
  e4. r4. | r2. | r | r | 
  
  \bar "||"
  b4. b8 cis dis | e4. e8 fis gis | a4 a8 a gis fis | dis4. cis4 cis8 |
  b4. b8 cis dis | e4. e8 fis gis | a4. a8 gis fis | dis4. dis8 e fis |
  gis4. gis8 a gis | gis4. gis8 a gis | fis4. e | fis dis8 e fis |
  gis4. gis8 a gis | gis gis4 gis8 a gis | fis4. e | fis dis | 
  e4. r4. | r2. | r | r | 
  
  \bar "||"
  b4. b8 cis dis | e e4 e8 fis gis | a4 a8 a gis fis | dis4. cis4 cis8 |
  b4. b8 cis dis | e4. e8 fis gis | a4. gis4 fis8 | dis4. dis8 e fis |
  gis4. gis8 a gis | gis4. gis8 a gis | fis4. e | fis dis8 e fis |
  gis4. gis8 a gis | gis4. gis8 a gis | fis4. e | fis dis | 
  e4. r4. | r2. | r | r | r \bar "|."
}

letra = \lyricmode {
  Vem e_eu mos -- tra -- rei que_o meu ca -- mi -- nho te le -- va_ao Pai.  
  Gui -- a -- rei os pas -- sos teus e jun -- to_a ti hei de se -- guir.  
  Sim, eu i -- rei e sa -- be -- rei co -- mo che -- gar ao fim.  
  De on -- de vim, a -- on -- de vou, por on -- de_i -- rás, i -- rei tam -- bém.  
    
  Vem e_eu te di -- rei o que es -- tás a pro -- cu -- rar.  
  A ver -- da -- de_é co -- mo_um sol, que_in -- va -- di -- rá teu co -- ra -- ção.  
  Sim, eu i -- rei e_a -- pren -- de -- rei mi -- nha ra -- zão de ser.  
  Eu cre -- io_em Ti, que crês em mim, na Tu -- a luz ve -- rei a luz  
    
  Vem, e_eu te fa -- rei da mi -- nha vi -- da par -- ti -- ci -- par,  
  Vi -- ve -- rás em mim a -- qui, vi -- ver em mim é_o bem mai -- or.  
  Sim, eu i -- rei e vi -- ve -- rei a vi -- da_in -- tei -- ra_as -- sim.  
  E -- ter -- ni -- da -- de_é, na ver -- da -- de, o_a -- mor vi -- ven -- do sem -- pre_em nós.  
    
  Vem, que_a Ter -- ra_es -- pe -- ra quem pos -- sa_e quei -- ra re -- a -- li -- zar,  
  Com a -- mor, a cons -- tru -- ção de_um mun -- do mui -- to me -- lhor.  
  Sim, eu i -- rei e le -- va -- rei Teu no -- me_aos meus ir -- mãos  
  I -- re -- mos nós e_o Teu a -- mor vai cons -- tru -- ir en -- fim a paz.  
}

harmonia = \chordmode {
  \set majorSevenSymbol = \markup { 7M }
  e2. | cis:min7 | a | b4.:7 a | 
  e2. | cis:min7 | a | b:7 | 
  e | gis:min7 | a | b:7 |
  e | gis:min7 | a | b:7 |
  e | cis:min7 | a | b4.:7 a |

  e2. | cis:min7 | a | b4.:7 a | 
  e2. | cis:min7 | a | b:7 | 
  e | gis:min7 | a | b:7 |
  e | gis:min7 | a | b:7 |
  e | cis:min7 | a | b4.:7 a |
  
  e2. | cis:min7 | a | b4.:7 a | 
  e2. | cis:min7 | a | b:7 | 
  e | gis:min7 | a | b:7 |
  e | gis:min7 | a | b:7 |
  e | cis:min7 | a | b4.:7 a |
  
  e2. | cis:min7 | a | b4.:7 a | 
  e2. | cis:min7 | a | b:7 | 
  e | gis:min7 | a | b:7 |
  e | gis:min7 | a | b:7 |
  e | cis:min7 | a | b4.:7 a |
  e
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
