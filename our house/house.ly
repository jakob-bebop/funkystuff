\include "deutsch.ly"
\include "../tricks.ly"

\header {
  title = "Our House"
  composer = "Madness"
  tagline = "www.krimskrams.dk/noder —  www.LilyPond.org"
}

introA = \relative c'''{ r1 g16 g r8 fis16 fis r8 e16 e r8 fis16 fis r8 |
  d1 f16 f r8 e16 e r8 d16 d r8 e16 e r8 |
  e1 g16 g r8 a16 a r8 h16 h r8 cis16 cis r8 |
  h2. r4 f g a h8 r8 }

introB = \relative c'' { r1 e16 e r8 d16 d r8 cis16 cis r8 d16 d r8 |
  h1 d16 d r8 cis16 cis r8 h16 h r8 cis16 cis r8 |
  cis1 e16 e r8 fis16 fis r8 g!16 g r8 a16 a r8 |
  fis2. r4 d e f! g!8 r8 }

versA = \relative c'''{ r1 g16 g r8 fis16 fis r8 e16 e r8 r8 fis8 |
  d1 f16 f r8 e16 e r8 d16 d r8 r8 e8 |
  e1 g16 g r8 fis16 fis r8 g16 g r8 r8 g8 |
  fis2. r4 f8. f16 g8. g16 a8. a16 h8. h16 }

versB = \relative c'' { r1 e16 e r8 d16 d r8 cis16 cis r8 r8 d8 |
  h1 d16 d r8 cis16 cis r8 h16 h r8 r8 cis8 |
  cis1 e16 e r8 d16 d r8 e16 e r8 r8 e8 |
  d2. r4 d8. d16 e8. e16 f!8. f16 g!8. g16 }

tredjeA = \relative c'''{ r1 g16 g r8 fis16 fis r8 e16 e r8 fis16 fis r8 |
  d1 f16 f r8 e16 e r8 d16 d r8 e16 e r8 |}

tredjeB = \relative c'' { r1 e16 e r8 d16 d r8 cis16 cis r8 d16 d r8 |
  h1 d16 d r8 cis16 cis r8 h16 h r8 cis16 cis r8 |}

solo = \relative c''' { r1 a4. g8~ g4 fis d2. r4|
  f4. e8~ e4 d e2. r4 | a4. g8~ g4 fis d2. r4|
  f4. e8~ e4 d |}

rapA = \relative c'''{ r1 g16 g r8 fis16 fis r8 e16 e r8 r8 g8 |
  fis1 f16 f r8 e16 e r8 d16 d r8 r8 e8 |
  e1 g16 g r8 fis16 fis r8 g16 g r8 r8 g8 |
  fis2. r4 f8. f16 g8. g16 a8. a16 h8. h16 }

rapB = \relative c'' { r1 e16 e r8 d16 d r8 cis16 cis r8 r8 e8 |
  d1 d16 d r8 cis16 cis r8 h16 h r8 r8 cis8 |
  cis1 e16 e r8 d16 d r8 e16 e r8 r8 e8 |
  d2. r4 d8. d16 e8. e16 f!8. f16 g!8. g16 }

omkA = \relative c'' { dis4 r8 h cis r8 r4 | r8 fis, r4 r2 }
omkB = \relative c'' { h4 r8 h cis r8 r4 | r8 fis, r4 r2 }
omk = {
  \set Staff . aDueText = ##f
  \repeat unfold 2 \partcombine \omkA \omkB
}

% {
form = #(define-music-function (P L) () #{ 
  \compressRests
  \override Score.RehearsalMark #'break-align-symbols = #'(key-signature)
  \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \key a \major 
  \mark Intro
  R1*4
  << \introA \introB >> 
  \bar "||" \mark "V1"
  \break
  R1*8
  \bar "||" \mark "O1"
  R1*4 
  \bar "||" \mark "V2"
  << \versA \versB >> 
  \bar "||" \mark "O2"
  R1*8
  \break
  \bar "||" \mark "V3"
  R1*4 << \tredjeA \tredjeB >> 
  \override TextSpanner #'(bound-details left text) = "growl"
  \override TextSpanner #'(bound-details left-broken) = #'((text . " ") (end-on-note . #t))
  \override TextSpanner #'direction = #DOWN
  h''1~\startTextSpan h''~ h''~ h''2. 
  \stopTextSpan 
  r4
  \bar "||" \mark "Solo"
  \solo
  \bar "||" \mark "O3"
  \omk
%   \bar "||" 
  \mark "Rap/V4"
  \repeat volta 2 << \rapA \rapB >>
%   \bar "||" \mark "V4"
%   << \rapA \rapB >>
%   \bar "||" 
  \mark "O4"
  \omk
  \bar "||"
  \transpose c a, \omk
  \bar "||"
  \transpose d c \omk
  \bar "||"
  \omk
  \bar "||"  
#})
%}
%{
  form = { 
  \compressRests
  \key a \major 
  \mark Intro
  R1*4
  << \introA \introB >> 
  \bar "||" \mark "V1"
  \break
  R1*8
  \bar "||" \mark "O1"
  R1*4 
  \bar "||" \mark "V2"
  << \versA \versB >> 
  \bar "||" \mark "O2"
  R1*8
  \break
  \bar "||" \mark "V3"
  R1*4 << \tredjeA \tredjeB >> b''1-\markup\italic{growl}~ b''~ b''~ b''2. r4 
  \bar "||" \mark "Solo"
  \solo
  \bar "||" \mark "O3"
  \omk
  \bar "||" \mark "Rap"
  << \rapA \rapB >>
  \bar "||" \mark "V4"
  << \rapA \rapB >>
  \bar "||" \mark "O4"
  \omk
  \bar "||"
  \transpose c a, \omk
  \bar "||"
  \transpose d c \omk
  \bar "||"
  \omk
  \bar "||"  
}
%}
\book {
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "Blæs E" \raise #0.5 \flat }
  }
\transpose c f \form
}
% omkA = \relative c'' { dis4 r8 h cis r8 r4 | r8 fis r4 r2 }
% omkB = \relative c'' { h4 r8 h cis r8 r4 | r8 fis r4 r2 }
% omk = {
%   \set Staff . aDueText = ##f
%   \repeat unfold 2 \partcombine \omkA \omkB
% }
% omk = \transpose c c' \omk

\book {
  \bookOutputSuffix "bb"
  \header {
    instrument = \markup\concat{ "Blæs B" \raise #0.5 \flat }
  }
  \score {
    \transpose c f, \transpose b es' \form
    \midi{
      \context {
        \Score
        tempoWholesPerMinute = #(ly:make-moment 72 2)
      }
    }
    \layout{}
  }
}