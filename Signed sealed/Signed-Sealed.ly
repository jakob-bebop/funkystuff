\header {
  title    = "Signed Sealed"
  subtitle = "Eb alt sax"
  composer = "Stevie Wonder (eller var det Lis og Per)"
}

intro = \relative c'' {
  \mark Intro
  r4 <e gis>2. \pp \< ~ q2.. <dis, dis'>8 -- \!
}

introAlt = \relative c'' {
  r4 <e gis>2. \pp \< ~ << q1 { s2.. s8 \! } >>
}

vers = \relative c'' {
  %\mark Vers
  \mark Vers
  e4 -^ r r2 | r r4. d8 -- | e4 -^ r r2 |
  r8 gis, -^ r a -^ r b -^ r e~ | e2 cis 4. b8 -> ~ |
  b2 r | < e gis > -> r8 q4. -> r8 q -> ~ q16 q8. ->  q8 -. r q4 -^ 
}

versTre = \relative c'' {
  \mark "Vers 3"
  r1 r4 g-^ g8 e cis e'~ e1 ~ e 
  R1*2
  e4 -> d -> cis -> b8 -- a -^ 
  r8 a -^ \acciaccatura g8 ~ gis 4 e2 ->
}

omkvæd =  \relative c'' {
  \mark Chorus
  r4 b8 d ~ d b d e \< -> ~ << e1 { s4 s4 \! \> s4 s4 \! } >>
  r4 b8 d ~ d b d e \< -> ~ << e1 { s4 s4 \! \> s4 s4 \! } >>
}

ending =  \relative c' {
  e4 r8 g gis b cis b e2 ^\fermata
}

koda = {\mark \markup { \musicglyph #"scripts.coda" } \repeat volta 2 \omkvæd \ending}

identity =  #(define-music-function (p l m) (ly:music?) #{
                                 $m
                                 #})
oktavop = #(define-music-function (p l m) (ly:music?) #{
                                 \transpose c c' $m
                                 #})

orig = #(define-music-function (p l transform) (ly:music-function?) 
#{
  \transpose e f {
    \key e \major
    \time 4/4
    \repeat volta 2 \intro
    \tweak #'self-alignment-X #-0.8
    \mark \markup { \musicglyph #"scripts.segno" Vers}
        
        
    \repeat volta 2 \vers   \break
    \repeat volta 2 \omkvæd \break
    \mark Intro

    R1*2 \introAlt
    \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
    \bar "||"
    \tweak #'self-alignment-X #-0.8
    \mark \markup { \musicglyph #"scripts.coda" "Vers 3"}
    
    
    $transform \versTre

    \bar "||"

    \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
    \mark \markup { \musicglyph #"scripts.segno" }
    \cadenzaOn
      \stopStaff

        \repeat unfold 1 {
          s1
          \bar ""
        }
        \once \override TextScript.extra-offset = #'( 0 . -3.0 )
        \once \override TextScript.word-space = #1.5
        <>^\markup { \center-column { "D.S. al Coda" \line { \musicglyph #"scripts.coda" \musicglyph #"scripts.tenuto" \musicglyph #"scripts.coda"} } }

        % Increasing the unfold counter will expand the staff-free space
        \repeat unfold 3 {
          s1
          \bar ""
        }
        % Resume bar count and show staff lines again
     \startStaff
   \cadenzaOff
   \break

   \once \override Staff.KeySignature.break-visibility = #end-of-line-invisible
   \once \override Staff.Clef.break-visibility = #end-of-line-invisible
   \once \override Score.RehearsalMark.extra-offset = #'( -4.5 . 0 )
   \once \override Score.RehearsalMark.font-size = #5
   \mark \markup { \musicglyph #"scripts.coda" }
   \koda
  }
#})
  
\score {
  \new Staff \transpose es c \orig #oktavop
}

\book {
  \bookOutputSuffix "bb"
  \header {
    subtitle = \markup \concat { "B" \raise #0.75 \small \flat " blæs" }
  }
  \score {
    \transpose bes c' \orig #identity
  }
}