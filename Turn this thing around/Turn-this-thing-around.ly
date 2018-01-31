\version "2.18.2"

\header {
  title = "Turn this thing around"
  composer = "Dumpstaphunk"
}


intro = \relative c'' {
  R1*4
  r4 e16 fis8 g16~ g2~
  g8. fis16 g fis e c d d c8 r b32 (c b a) 
  dis16 e r8 r2 r8 \tuplet 3/2 { g16 (fis e) }
  fis16 g r8 r2.
  r2. r16 g fis8
  e-. fis-. e16 fis r8 r2
  d16 c a c~ c8 d e a16 <e gis>~ <e gis>4
  r16 a,-. c-. d-. es-. d-. c a d des c8-^ r4
}

versEt = {\mark "Verse" R1*8}

versToA = \relative c''' {  
  r2 r8 d16 c r4
  r16 e r8 r16 es r8 d-. c-. b16 <a c> r8
}

versToB = \relative c'' {
  a2 c4~ c16 a c8 
  es16 e  r8 b4 g e
}


versToC = \relative c'' {
  r1 |
  g'16 fis cis e~ e8 fis-. r fis e16 fis r8
}

versToD = \relative c'' {
  r1
  \override TextSpanner.bound-details.left.text = "2nd time only"
  %\textSpannerDown
  g'16\startTextSpan fis cis e~ e8 fis-. r4 r16 <a, fis'> <bes g'> <b gis'> 
  
  \mark "Bridge"
  \bar "||"
  <c a'>8.-- q16 \stopTextSpan r2.
  r8 e16 es d fis c a
  d c as f! b fis8 r16
  %c gis f! d b' fis r8
  c'4\bendAfter #-4 b\bendAfter #-4 a\bendAfter #-4 fis\bendAfter #-4
  r16 d'-> cis-> c-> r c-> cis-> d-> r d-> es-> e-> r4
}


omkv = <<
\relative c''' {
  \mark Chorus
  \bar "||"
  r8 a16 g~ g2.~
  g4~ g8 fis-. g-. fis-. g4-. 
  r1
  r16 e r8 r16 es r8 r16 d r8 r16 c r8 
  r8 a'16 g~ g2.~
  g4~ g8 fis-. g-. fis-. g4-. 
  r1
}
{
s2 s2\< s4 s4\! s2 s1*2
s2 s2\< s4 s4\! s2 s1
}
>>

omkvSlut = \relative c''' {
  r2 d16 gis, e c <a e''>4-.
}

omkvVolte = \relative c'' {
  r16 e r8 r16 es r8 d16 c a8 e'4-^
}

solo = \repeat volta 4 \relative c'' { 
  \mark  "Solo" 
  \repeat unfold 2 {
    << {
    < bes e g c >4 r2. R1*3  }
       \new Voice \with {
         \consists "Bend_engraver" 
       } {
         \once \hide NoteHead
         \once \hide Stem
         c'4\bendAfter #-4
         
       }
    >>
  }
}

bridgeTo = \relative c'' {
  \mark Break
  r4 r8. g'16~ g8 a g a
  r8. g16~ g8 a g a r8. c16~
  c8 d c d r16 des8. es8 r16 d16~
  d8 e r16 des r es r c d c g8
  \tuplet 3/2 { r8 g16~  g [a8] c [d e] }
  g16 e fis d c a g c a d c (des32 c) a16 g
  r8. des'16 r ges, r bes r des, r as' r des, r as'
  d,8 as' es as d, as'16 des,~des as' d,8 r2.
  \bar "||"
}

versTre = \relative c''' {
  \mark "Verse 3"
  R1*3
  g16 fis32 (e) cis16 <e b g>~q8 <fis cis a> <e b g> <fis cis a> <e b g>16 <fis cis a> r8
  <<
    \versToA
    \\
    \versToB
  >>
  r1
  <g e cis>16 <fis c? a> <cis a e> <e b g>~ <e b g>8 <fis cis! a>-. r4 r16 <a, fis'> <bes g'> <b gis'>
}

lastBridge = \relative c''  {
  \mark Bridge
  <c a'>8.-- q16 r2.
  r8 e16 es d fis c a d c as f! b fis8 r16
  <c' a'>8.-- q16 r2.
  r16 d-> cis-> c-> r c-> cis-> d-> r d-> es-> e-> r4  
}

form = 
#(define-music-function (P L c) (ly:pitch?) 
#{
  \compressFullBarRests
  \time 4/4
  \key a \minor
  \intro
  \break
  \repeat volta 2 {
    \versEt
    <<
      \versToA
      \\
      \versToB
    >>
    \versToC
    <<
      \versToA
      \\
      \versToB
    >>
    \versToD
    \break
  
    \omkv
  }
  \alternative {
    \transpose c #c \omkvSlut
    \omkvVolte  
  }
  \break
  \solo 
  \pageBreak
  \transpose c #c \bridgeTo
  \versTre
  \break
  \repeat volta 2 \lastBridge
#})

\book {
  \header {
    subtitle = "Bb sax"
  }
  #(define output-suffix "bb")
  \score {
    \new Staff \transpose bes c'  \form c,
  }
}

\book {
  \header {
    subtitle = "Eb sax"
  }
  #(define output-suffix "eb")
  \score {
    \new Staff \transpose es c  \form c
  }
}
