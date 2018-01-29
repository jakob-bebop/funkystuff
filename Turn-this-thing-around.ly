\version "2.18.2"

\header {
  title = "Turn this thing around"
}


intro = \relative c'' {
R1*4
r4 e16 fis8 g16~ g2~
g8. fis16 g fis e c d d c8 r b32 (c b a) 
dis16 e r8 r2 r8 \tuplet 3/2 { g16 (fis e) }
fis16 g r8 r4 r2
r2 r4 r16 g fis8
e-. fis-. e16 fis r8 r2
d16 c a c~ c8 d e a16 <e gis>~ <e gis>4
r16 a,-. c-. d-. es-. d-. c a d des c8-^ r4
}

versEt = {\mark "Verse" R1*8}
versToA = \relative c'' {
\voiceOne
r2 r8 d16 c r4
r16 e r8 r16 es r8 d-. c-. b16 <a c> r8
r1 |
g'16 fis cis e~ e8 fis-. r fis e16 fis r8
r2 r8 d16 c r4
r16 e r8 r16 es r8 d-. c-. b16 <a c> r8
r1
\override TextSpanner.bound-details.left.text = "skip this first time"
\textSpannerDown
g'16\startTextSpan fis cis e~ e8 fis-. r4 r16 <a, fis'> <ais g'> <b gis'> 

\mark "Bridge"
\bar "||"
  <c a'>8.-- q16 \stopTextSpan r4 r2
  r8 e16 es d fis c a
  d c gis f! b fis8 r16
  %c gis f! d b' fis r8
  c'4\bendAfter #-4 b\bendAfter #-4 a\bendAfter #-4 fis\bendAfter #-4
  r16 d'-> cis-> c-> r c-> cis-> d-> r d-> dis-> e-> r4
}

versToB = \relative c' {
  \voiceTwo
a2 c4~ c16 a c8 
es16 e  r8 b4 g e
s1*2
a2 c4~ c16 a c8 
es16 e r8 b4 g e
s1*2
}

omkv = \relative c''' {
  \mark Chorus
  \bar "||"
r8 a16 g~ g2.~
g4~ g8 fis-. g-. fis-. g4-. 
r1
r16 e r8 r16 es r8 r16 d r8 r16 c r8 
r8 a'16 g~ g2.~
g4~ g8 fis-. g-. fis-. g4-. 
r1
r2 d16 gis, e c <a e''>4-.
}

solo = \repeat volta 4 \relative c'' { < bes e g c >4 r2. R1*3 }

bridgeTo = \relative c'' {

r4 r8. g16~ g8 a g a
r8. g16~ g8 a g a r8. c16~
c8 d c d r16 c8.  d8 r16 es16~
es8 f
}
\score {
\new Staff {
  \compressFullBarRests
  \time 4/4
  \intro
  \repeat volta 2 {
  \versEt
  <<
  \versToA
  \\
  \versToB
  >>
  %\break

  \omkv

  }
  \solo 
  \bridgeTo
}


}