\include "../tricks.ly"
% \language german

altAi = \relative c' {
  \transposition es
  f16 a e' d r8
  c16 g b a r8
  g'16 c, d 
  < f c a >~ \noBreak q8
  < d b g >16 r16
  < c a f >[ < d b g >]
  r16
  < f c a >~ q8
  < d b g >16 r16
  < c a f >[ < d b g >]
  r8
}

altAii = \relative c'' {
  \transposition es
  f16 c e d r8
  f16 d g f r8
  g16 c, d 
  < f c a >~ q8
  < d b g >16 r16
  < c a f >[ < d b g >]
  r16
  < f c a >~ q8
  < d b g >16 r16
  < c a f >[ < d b g >]
  r8
}

altB = \relative c''' {
  \transposition es
  \textSpannerDown
  \override TextSpanner #'(bound-details left text) = #"gentages ×3 sidste gang"
  g16\startTextSpan f g f d8
  g16 f g f c8 r4
  g'16 f g f d8
  g16 f g f c8 r4\stopTextSpan
  g'16 f g f d8
  g16 f g f a8 r4
  g16 f g f d8
  g16 f g f c8 
  < c' a g e >4~
}

altSolo = \relative c'' {
  g16 g r8 r4 r4 
  < b' g d >8-. < bes fis cis >-. < a f! c! >16 q
  r8 r4 r2
}

song = {
  \compressRests
  \key d \minor
  \mark Intro
  R1*12
  \break
  \mark A
  \repeat volta 2 {
    \altAi R1*2 \break
    \altAi R1*2 
    \altAii R1*2 R1*2_"(Kun første 2×)"
  }
  \break
  \mark B
  \altB
  \once \override TextScript #'self-alignment-X = #0
  < c''' a'' g'' e'' >1\laissezVibrer_"(Anden gang: 4 takter!)" \bar "||"
  R1*2 \bar "||"
  \break
  \textInside "A-STK. (uden ekstra pause)" 
  \bar "||"
  \textInside "B-STK. (med lang tone til sidst)" 
  \bar "||"
  \break
  \mark Solo
  R1*4_"ad lib."
  \break
  \repeat volta 2 \repeat percent 2 { \altSolo \noBreak }
  R1*4_"(solo...)"
  \bar "||"
  \break
  \textInside "A-STK. (uden ekstra pause)" 
  \bar "||"
  \textInside "B-STK. (2 første takter ×3 & lang tone til sidst)" 
  \bar "||"
  \mark Slutning
  \altAi
  \bar "|."
}
  
\addQuote "alto" \song
\header {
  title = "Pick up the Pieces"
  composer = "Average White Band"
  tagline = "www.krimskrams.dk/noder  —  www.LilyPond.org"
}
\paper {
  ragged-last = ##t
}

\book {
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "Blæs E" \raise #0.5 \small \flat }
  }
  \score{
    \new Staff \song 
    \midi{
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 64 2)
      }
    }
    \layout{
    }
  }
}

\book {  
  \bookOutputSuffix "bb"
  \header {
    instrument = \markup\concat{ "Blæs B" \raise #0.5 \small \flat }
  }
  \score{
    \new Staff \transpose bes es' \song
    \layout{
    }
  }
}

