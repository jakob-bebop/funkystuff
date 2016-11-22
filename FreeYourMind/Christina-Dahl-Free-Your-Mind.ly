\include "../tricks.ly"

\header {
  title = "Free Your Mind"
  composer = "Christina Dahl"
}


ChantI = \lyricmode {
  Hap -- pi -- ness and love you'll meet
  List -- en to your heart -- beat
}

ChantII = \lyricmode {
  Loo -- sen up and feel ~ free
  Let your heart -- beat touch me
}

Chant = {
 % \context Voice = "Chant"
  \repeat volta 2 \relative c'' {
    r4 f8 des bes4 g8 (f) bes8 bes8 des4 r2
    r4 f8 des bes4 g8 (f) bes4 g r2
  }
}



RiffI = \relative c'' {
  %\context Voice = "Deafult"
  \repeat volta 2 {
    r16 bes r8 bes16 bes r des~ des g, bes8 r bes16 bes
    g'8 f des8 bes16 c bes bes d8 r4
    r16 bes r8 bes16 bes r des~ des g, bes8 r bes16 bes
    g'8 f des8 bes16 c bes bes r8 r4
  }
}

RiffII = \relative c'' \repeat volta 2 {
  <c f as>4 <bes es g>8. <as d f>16 r <d, f bes> r8 r4
  <bes' f' as>8 <as es' g> <as des f>16 <bes es g>8 <as des f>16 r2
  <c f as>4 <bes es g>8. <as d f>16 r <d, f bes> r8 r4
} \alternative {
  {
    <f bes des>8 <es a c> <d g bes>16 <es a c>8 <f bes d>16 r2
  }
  {
    <f bes des>8 <es a c> <d g bes>16 <es a c>8 <d g bes>16 r2
  }
}

BackI = \relative c'' \repeat volta 2 {
  r4 bes16 bes r des~ des g, bes8 r4
  des8 c bes16 c8 d16 r2
  r4 bes16 bes r des~ des g, bes8 r4
} \alternative {
  {
    des8 c bes16 c8 bes16 r2
  }{
    des8 c bes16 c8 bes16 r4
  }
}

BackIIa = \relative c'' {
  \times 2/3 {e8 dis cis}
  \repeat volta 2 {
    fis4 g8 gis e16 cis8.~ cis8 gis'
    \times 2/3 {b4 c cis} a2
    r1 r2.. gis,8

    \times 2/3 {e'4 dis d} cis8 gis~ gis e
  }
  \alternative {
    {
      \times 4/6 {fis16 (g fis g fis e)} fis8 e16 gis~ gis2
      r1 r2.   \times 2/3 {e'8 dis cis}
    }
    {
      \times 4/6 {fis,16 (g fis g fis e)} fis8 e16 cis~ cis2
    }
  }

}

BackIIb = \relative c' {
  \times 2/3 {b'8 ais gis}
  cis4 dis8 e  b16 gis8.~ gis8 e'
  \times 2/3 {gis4 ais b} fis2

}
BackIIbb = \relative c'' {
  r1 r2.. dis,8
  \times 2/3 {b'4 ais a } gis8 e~ e b
  cis b cis b16 dis~ dis2
  r1 r2. \times 2/3 {b'8 ais gis}
  cis, b cis b16 gis~ gis2


}

BackIIc = \relative c' {
  \times 2/3 {gis'8 fis e}
  ais4 c8 cis  gis16 e8.~ e8 b'
  \times 2/3 {e4 eis fis} dis2
  r1 r2.. b8
  \times 2/3 {gis'4 fis f} e8 b~ b gis
  ais gis ais gis16 b~ b2
  r1 r2. \times 2/3 {gis8 fis e}
  ais gis ais gis16 e~ e2
}

BackIII = \relative c' {
  <dis gis cis>4
  \bar "||"
  <gis cis fis>2. <ais dis gis>4
  <fis b e>8 <dis gis cis>~ q2 <fis b e>4
  <gis cis fis>8 <fis b e> <gis cis fis> <fis b e>
  <gis cis fis>4 <cis fis b>8 <ais dis gis>~
  q2 r8 <dis, gis cis>4 <fis b e>8
  <gis cis fis>2. <ais dis gis>4
  <fis b e>8 <dis gis cis>~ q4
  r8 <ais dis gis> <cis fis b>4
  <dis gis cis>8 <cis fis b> <dis gis cis> <cis fis b>
  <fis b e>4. <dis gis cis>8~ q1
}

song = #(define-music-function
         (P L mapping)
         (ly:music-function?)
         #{
           <<
             \new Staff {
              \compressRests
              \new Voice = "Horns" 
              \new Voice = "Chant"
              
              \context Voice = "Chant"
              {
                 \key bes \major
                 \Chant
                  \break
               }
               \context Voice = "Horns"
               {
                 \RiffI
                 \RiffII

                 \bar "||"
                 \break
                 \textOver "saxsolo"
                 \BackI
                 \break
                 <<
                   {
                     \key e \major
                     \BackIIa
                   }
                   \new Staff {
                     \key e \major
                     \BackIIb $mapping \BackIIbb
                   }
                   \new Staff {
                     \key e \major
                     \BackIIc
                   }
                 >>
                 \break
                 R1*2
                 \bar "||"
                 \textOver "trompetsolo"
                 r2.
                 \BackIII

                 \bar "||"
                 \key bes \major
                 R1*4
               }
               \context Voice = "Chant"
               {
                 \break
                 \Chant
               }
               \context Voice = "Horns"
               {
                 \break
                 \RiffII
                 \bar "|."
               }
             }
             \new Lyrics \lyricsto "Chant"  {\ChantI \ChantI }
             \new Lyrics \lyricsto "Chant" {\ChantII \ChantII}
           >>
         #})

identity = #(define-music-function
             (P L m) (ly:music?)
             #{ #m #})
moveUp = #(define-music-function
           (P L m) (ly:music?)
           #{ \transpose c c' #m #})
\book {
  \bookOutputSuffix "es"
  \header {
    subtitle = \ebInstr
  }
  \transpose es c \song #moveUp
}

\book {
  \bookOutputSuffix "bb"
  \header {
    subtitle = \bbInstr
  }
  \transpose bes c' \song #identity
}