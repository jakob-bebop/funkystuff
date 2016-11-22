\include "../tricks.ly"
\include "../../extractMusic.ly"

\header {
  title = "Dancing in the Streets"
  composer = \markup\column\right-align{ "Marvin Gaye, William \"Mickey\" Stevenson " " and Ivy Jo Hunter"}
  tagline = "Freezecool || krimskrams.dk"
}

% Bowie / Jagger versionen...

topRiff = {
  % ~0:20
  r8 b-. b-. a16 cis b8 fis~ fis4~ 
  fis2._\< r4\!
  
  r8 b-. b-. a16 cis b8 fis'~ fis4~ 
  fis2._\< r4\!
  
}
topRiffStacc = {
  % ~0:20
  r8 b-. b-. a16 cis b8 fis-. r4 
  r1
  
  r8 b-. b-. a16 cis b8 fis'-. r4 
  r1
  
}

aah = {
  <<
    {g'1~  g   gis~ gis f1~  f    fis~ fis}
    {dis1~ dis dis~ dis cis1~ cis cis~ cis}
    {s1*2_"Aaah..."       b1~ b   s1*2      ais1~ ais}
  >>
}
blowws = \relative c'' {
      \time 4/4
     \compressRests
    \key b \mixolydian
  \topRiff
  \bar "||"
  R1*13
  r2. r8 dis, (e^^)_"Music, sweet music..." r8 r2.
  r2. r8 dis (e^^) r8 r2.
  %\bar "||"
  <<
    {a1~ a2      a8 gis4 fis8~   fis1~   fis2  r }
    {fis1~ fis2 fis8 e4 dis8~ dis1~ dis2 r }
    {dis1~ dis2 dis8 cis4 b8~ b1~ b2 r}
    {s2_\> s2_\< s4 s4\!}
  >>
  %\bar "||"
  \break
  \aah
  \bar "||"
  R1*13_"eller deromkring..."
  \bar "||" \break
  <<
  \repeat unfold 2 \topRiffStacc
  s1_"Til sidst danser alle"
  >>
}

blowUp = \transpose c c' \blowws

\book {
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "E" \raise #.5 \flat " instr." }
  }
  \score {
    \new Staff {
        \compressRests
        \transpose dis c' \multiExtractMusic {}{\blowws R1*47 \blowUp R1*20 }
    }
  }
}

\book {
  \bookOutputSuffix "bb"
  \header {
    instrument = \markup\concat{ "B" \raise #.5 \flat " instr." }
  }
  \score {
    \new Staff {
        \compressRests
        \transpose bes c' \multiExtractMusic {}{\blowws R1*21 \blowUp R1*50 }
    }
  }
}