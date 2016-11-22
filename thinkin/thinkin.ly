\include "../pop-chords.ly"
\language deutsch
\version "2.13.44"
\header {
  title = "Thinking"
  composer = "The Meters"
}
fret = #(define-music-function (P L n) (integer?) #{\set TabStaff . minimumFret = $n #})
firstTime = \markup{ \text \italic { Drum break 2nd time } }
vers = \repeat volta 2 \relative c' {
%   \set TabStaff . minimumFret = #1
  b16 as b, b r8 \fret #1 c16 d g,8 [r16 g] <g'' d b>4-.
  \fret #0
  b,16 as b, b r8 d-. es-. r16 <g' es> ( <f des>8 ) r8 |
  b,16 as b, b r8 c16 d g,16 g r8 
%   \bar ""
  \set Score.repeatCommands = #(list (list 'volta firstTime))
  \set TabStaff . minimumFret = #5
  \times 2/3 {c'16[( 
    \set TabStaff . minimumFret = #0
    b g]} \stemUp b16 ) r |
  \stemNeutral
%   \set TabStaff . minimumFret = #1  
  b16 as b, b r8 d-. es-. r16 <g' es> ( <f des>8 )
  \set Score . repeatCommands = #'((volta #f))
  r8
}

omkv = \repeat volta 2 \relative c' {
%   \set TabStaff . minimumFret = #5
  d16 c a 
%   \set TabStaff . minimumFret = #0
  d,
%   \set TabStaff . minimumFret = #3
  < e' c g>8. < d h g >16~ q4 r |
%   \set TabStaff . minimumFret = #5
  d16 c a 
%   \set TabStaff . minimumFret = #0
  d,
%   \set TabStaff . minimumFret = #3
  < e' c g >16 [q r 
  \fret #3
  \grace d16(
  e~]) e g d8 r4
}

solo = \repeat volta 2 \relative c' {
  \fret #6
  < f d as >8. q16 r8 \grace f (g8~) g b f16 f f d |
  b,8  q16 q r8 \grace f'' (g8~) g b f16 f f d
  b,8  q16 q r8 \grace f'' (g8~) g b f16 f f d
  b,8  q16 q r8 \grace f'' (g8~) g b f16 f f d
}

akkorder = \chordmode {
  \semiGermanChords
  \repeat unfold 2 { b2 g:m b es:7 }
        f4 
        \once \override ParenthesesItem #'font-size = #0
        \parenthesize c8. g8. s4.
        f4 c8. g8. s4.
        b1*3:7 cis2:9 h2:11
}
\score{
  <<
    \new ChordNames \with {
      midiInstrument = "electric piano 1"
    } \akkorder
    \new Staff \with {
      midiInstrument = "electric guitar (clean)"
    }{
      \clef "treble_8"
      \mark \default
      \vers
      \break
      \mark \default
      << \omkv { s1 s2.... s32_\markup{ "4×" }} >>
      \break
      \mark \markup\bold "S"
      \solo
    }
    \new TabStaff {
      \time 4/4 
      \vers 
      \omkv
      \solo
    }
  >>
  \midi{
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 50 2)
    }
    \context {
      \TabStaff
      \remove Staff_performer
    }
  }
  \layout {
    
  }
}

\paper {
  system-system-spacing #'basic-distance = #16
}
