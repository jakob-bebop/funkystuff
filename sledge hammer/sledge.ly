\version "2.16"
\include "../../extractMusic.ly"
global = {
  \compressFullBarRests
  \override MultiMeasureRest #'expand-limit = #2
}
\header {
  title = "Sledgehammer"
  composer = "Peter Gabriel"
  tagline = "www.krimskrams.dk/noder"
}
intro = \relative c'' {
  \partial 2
  r8 g16 f es c8 bes16 
  \bar "||"
  c2~ c8 c d c~
  c r r4 r8 
  g'16 f es c8 bes16 c2~ c8 c d c
  r2 r8 g'16 f es c8 bes16 c2~ c8 c d es~
  es2~ es8 es f4 g1~ g2 r
}
vers = \relative c'' {
  R1*4
  \bar "||"
  R1*8^"Vers 1"
  \bar "||"
  a1~ a r1 r
  \bar "||"
  R1*8^"Vers 2"
}
omkv = \relative c' \repeat volta 2 \repeat unfold 2 {
  <e a c>4
  <f bes d>2.
  <f a c>4 r r2
} 
broEt = \relative c' { c1 c  c c2. r4 }
versTre = \relative c' \repeat volta 2 {
  e2-\tweak #'self-alignment-X 0^"Vers 3" f g1 e2 d c1
}
broTo = \relative c' { c1-\tweak #'self-alignment-X 3_"4×"~ c~ c2. r4 bes'4 a g r }
sidsteGangMarkup = \markup \text \normalsize {on cue}
outro = \relative c' {
  R1*7
  bes'4 a r8 g16 f es c8 bes16 
  \set Score . repeatCommands = #'(start-repeat)
  
  c2~ c8 c d c~
  c8 r8 r4 r8 g'16 f es c8 bes16 
  \set Score . repeatCommands = #'((volta "1, 2, ..."))
  c2~ c8 c d es~
  es2 r8 g16 f es c8 bes16
  \set Score . repeatCommands = #`((volta #f) end-repeat (volta ,sidsteGangMarkup))
  c2. r4
  bes' a g f 
  \set Score . repeatCommands = #'((volta #f))
  
  <c c'>-> 
  \bar "|."
}
theeScore =  {
  \key c \major
  \intro
  \bar "||"
  \vers
  \break
  \omkv
  \broEt
  \versTre
  \omkv
  \broTo
  \outro
}

%{
\book {
  \bookOutputSuffix "eb"  
  \header {
    subtitle = \markup \concat { "Altsax E" \raise #0.75 \small \flat }
  }
  \score {
    \new Staff {\global \theeScore}
  }
}
%}
oppe = \transpose bes es' \theeScore
nede = \transpose bes es \theeScore
\book {
  \bookOutputSuffix "bb"  
  \header {
    subtitle = \markup \concat { "Tenorsax B" \raise #0.75 \small \flat }
  }
  \score {
    \new Staff {
      \global
    \multiExtractMusic s1*0 {
     \oppe s2*41
      \nede s1*2
      \oppe 
    }
    }
  }
}
