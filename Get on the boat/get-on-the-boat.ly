\include "../tricks.ly"

\header {
  title = "Get On The Boat"
  subtitle = "Eb alt sax"
  composer = "Prince and the Revolution"
}

intro = \relative c'' {
  \mark Intro
  <c f d'>2. ~ q8 <a c a'> <c f d'>8 <a c a'>16 <as bes as'> 
  r <a c a'> r8 r2
  <c f d'>2. ~ q8 <a c a'> <c f d'>8 <a c a'>16 <as bes as'> 
  r <a c a'> r <d, a' f'> r2
}

versEt = \relative c''' {
  \mark Vers
  r2 r8 <a, f' d'>-- <g e' c'>-^ r 
  r2 r8 <e' c' g'>-- <d a' f'>-^ r 
  r2 r8 <a f' d'>-- <g e' c'>-^ r 
  r2 r8 <a' f' d'>-^ r4
}

fallThree = #(define-music-function
     (parser location low mid high)
     (ly:pitch? ly:pitch? ly:pitch?) (_i "ff")
   #{
  <<
    { $low 4 \bendAfter # -4 }
    \\
    { \voiceOne $mid \bendAfter # -4  }
    \\
    { $high \bendAfter # -4 }
   >>
   #}
   )

broF = \relative c'' {
  \mark Bridge 
  r16 <d bes'> r q r q r <f a> r <e g> <d f>8 ~ q r
  r8 <cis g'> r16 q r <d f a> r2
  r16 <d bes'> r q r q r <f a> r <e g> <d f>8 ~ q r
  << <des g f'>1 {s2. \< s4 \! } >>
}
broR = \relative c'' {
  %\override Score.SpacingSpanner.shortest-duration-space = #8.0
  \repeat unfold 3 { \fallThree a f' d' r4 r2 }
  \fallThree a, f' d' r4 \fallThree a, f' d' r4 
}

bro = {\broF \broR}

orig = {
    \key f \major
    \time 4/4
    \repeat volta 2 \intro \break
    \repeat volta 2 \versEt \break
    \repeat volta 2 \intro \break
    \tweak #'self-alignment-X #-0.8
    \mark \markup { \musicglyph #"scripts.segno" Bro}
    \bro 
    \repeat volta 2 \versEt \break
    \compressRests
    \mark "Solo"
    \repeat volta 2 R1*4_"(D.S. on cue)"
    \break
    \mark Chorus
    \repeat volta 2 \versEt \break
    \broF \repeat volta 2 \broR \break
    \repeat volta 2 \intro \break
  }


\score {
  \new Staff \transpose es bes, \orig
}

\book {
  \bookOutputSuffix "bb"
  \header {
    subtitle = \markup \concat { "B" \raise #0.75 \small \flat " blæs" }
  }
  \score {
    \orig
  }

}