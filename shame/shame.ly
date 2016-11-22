\include "../tricks.ly"

forsp = \relative c'' \repeat volta 2 { f16 e8 d16 r4 r8 d16 d  f g8.|
r f16 e8 d f g f16 d8. | r2 r8 c cis16 d8. |
r4 r8 c cis16 d8. r4 }

omkEt = \relative c''' { <g d b>4 r r r8 <e c a>8 |
<g d b>4 r r8 e16 a~ a8 g
<fis d a>4 r r8 <e c g>16 q <fis d a>4 |
r2 r4 c16 d e fis |
<g d b>2 <b g e>8. <g e b>16 r8 <b g d> |
r2 r8. <b g d>16 q4 | r8. f16 e8 d f g r4 |
r8. f16 e8 d f g r16 d8.}

veEt = \relative c'' { <e cis ais>1~ q <dis b a>~ q |
  <d b gis>~ q <cis a g>~ q } 

omkTo = \relative c''' \repeat volta 2 {
  <g d b>4 <f d b> <d b g>2 r r4 <fis d a>8 q |
  q4 r r2 | r4 d16 fis g fis b8. b16 a4 |
}
veTo = \relative c'' {
    <e cis ais>8. q16 r8 q r2 | r1
    <dis b a>8. q16 r8 q r2 | r1
    <d b gis>8. q16 r8 q r2 | r1
    <cis a g>8. q16 r8 q r2 | r1
}
#(set-global-staff-size 17.82)
\header {
  title = "Shame, Shame, Shame..."
%   meter = " "
  instrument = "Eb blæs"
  tagline = ##f
}
\score {
\new Staff { \compressRests \key a \major 
  \mark Intro
  \forsp \break
  \mark "Vers1"
  R1*8 \bar "||"
  \mark "Omk1"
  \omkEt \bar "||" \break
  \mark "Vers2"
  \veEt \bar "||" \break 
  \mark "Omk2"
  \omkTo \break 
  \mark "Vers3"
  \veTo \bar "||" \break
  \mark "Omk3"
  \omkEt \bar "||" \break
  \mark "Vers4"
  \veEt %\bar "||" 
  \break
  \mark "Omk4"
  \omkTo
  \mark Solo
  R1*8 \break
  \mark "Omk5"
  \omkTo
  \mark "Omk6"
  \omkEt 
  \mark "Omk7"
  \omkTo
  }
}