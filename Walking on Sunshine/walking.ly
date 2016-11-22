\version "2.18"
\include "../tricks.ly"
\header {
  title = "Walking on Sunshine"
  arranger = "Vries/Kohl"
  tagline = "Freezcool || krimskrams.dk"
}

mode = {
  \key bes \major
  \time 4/4
}

intro = \relative c'' \repeat volta 2 {
  r2
  bes4-> r
  << 
    {  
      r g8 g g g r a-^
      r a-^ r a a4 (as8 g-.)
      r1
     }
     {
       r4 es8 es es es r f
       r f r f f4 fes8 es
       r1
     }
  >>
}

omkvædsIntro = \relative c'' \repeat volta 2 {
  r2
  bes4-> r
  << 
    {  
      r g8 g g g r a-^
      r a-^ r a a4 (as8 g-.)
      r1
     }
     {
       r4 es8 es es es r f
       r f r f f4 fes8 es
       r1
     }
     {
       r4 bes'8 bes bes bes r c
       r c r c c4 ces8 bes
       r1
     }
  >>
}

versFlyd = \relative c'' \repeat volta 2 {
  <<
    {d1 \< ( es c es ) d1  ( es c es \! )}
    {bes ( g  a  g ) bes ( g  a  g )}
  >>
}

omkvædsFlyd = \relative c'' \repeat percent 3 {
  < d a > 1~ q < c g >~ q
}
versGuitar = \relative c'' {
  R1*4
  <<
    {
      bes4 bes bes r8 bes 
      r bes r bes bes4 bes8 r
      c4 c c r8 bes 
      r bes r bes bes4 bes8 r

    }
    {
      f4 f f r8 g 
      r g r g g4 g8 r
      a4 a a r8 g 
      r g r g g4 g8 r

    }
  >>
  R1*4
  <<
    {
      bes4 bes bes r8 es 
      r es r es es4 es8 r
      c4 c c r8 es 
      r es r es es4 es8 r
    }
    {
      f,4 f f r8 g 
      r g r g g4 g8 r
      a4 a a r8 g 
      r g r g g4 g8 r
    }
  >>
}

\book{
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "E" \raise #.5 \flat " instr." }
  }
\score {
  \new Staff \transpose g e \transpose es c' {
      \compressRests 
      \mode
      R1*8
      \mark Intro
      \intro
      \break
      \mark "Vers 1"
      R1*16
      \transpose c c, \versFlyd
      \mark Omkvæd
      R1*12
      R1*8
      \bar "||" \break
      \mark "Vers 2"   
      R1*16
      \versGuitar
      \bar "||" \break
      \mark Omkvæd
      \omkvædsFlyd
      \omkvædsIntro
  }
}
}
\book{
  \bookOutputSuffix "bb"
  \header {
    instrument = \markup\concat{ "B" \raise #.5 \flat " instr." }
  }
\score {
  \new Staff \transpose g e \transpose bes c' {
      \compressRests 
      \mode
      R1*8
      \mark Intro
      \transpose c c' \intro
      \mark "Vers 1"
      \break
      R1*16
      \versFlyd
      \mark Omkvæd
      R1*12
      R1*8
      \bar "||" \break
      \mark "Vers 2"   
      R1*16
      \versGuitar
      \bar "||" \break
      \mark Omkvæd
      \omkvædsFlyd
      \transpose c c' \omkvædsIntro
  }
}
}
