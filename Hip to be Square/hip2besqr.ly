\include "../tricks.ly"

\header {
  title = "Hip to be square"
}

flydI = \transpose g e \relative c'' {
  \mark 2
  <c e>2.. <bes d>8~ q1
  <c e>2 <d fis>4. <g, b>8~ q1 

}

flydII = \transpose g e \relative c'' {
    <a c>1 <b d> <c f> <b g'>4-> r4 r2
}

blæsI = \relative c'' {

r8 b cis e~ e4 cis
r8 b cis e~ e4 \appoggiatura f16 fis4
r8 b, cis e~ e4 cis8 e
g ( e fis cis ) e4 cis

r8 b cis e~ e4 cis
r8 b cis e~ e4 \appoggiatura f16 fis4
r8 <b, e> <cis fis> <d g>~ <d g> <d g> <cis a'> <d b'>~ 
<d b'>4 <cis a'>8 b g' fis e4


}

blæsII = \relative c'' {

r8 <e gis d'> r16 q r8 q r r8 cis~
cis e fis cis e4 g
r8 <e gis d'> r16 q r8 q r r8 e
a g fis e~ e8 d4 e8

\break
<<
  {
   \voiceOne 
    e1~ 
    e ~  e 
    g4-> g-> fis-> e-> 
}
\new Voice {
  \voiceTwo
  r2 <gis, b> <a cis>1 <b d>
  q4 q <a cis> <a b>
  
}
>>
\oneVoice
<gis b e>_solo r r2 R1*7

\bar "||"

R1*8 _Vers


\mark 2

R1*9

\flydII
\bar "||"

R1*8 _omkvæd

\bar "||"

\textOver "hip hip & everywhere"



}


blæsIII = \relative c'' {
r8 b cis e~ e2~ e1
r8 g fis e~ e2~ e1
}

blæsBas = \relative c' {
e4 r8 gis r4 r8 gis a gis a4 r8 d, r dis
e4 r8 gis r4 r8 gis a gis a4 b d
}

song = {
  \set Score.markFormatter = #format-mark-circle-letters
  \new Staff {
      \compressRests

      \key e \major
      \textInside "Intro"
      \repeat volta 2 {
        R1*8_Vers
        \flydI\flydII
        \bar "||"
        R1*4 _ Omkv
      }
      \blæsI
      \break
      \blæsII
      \break
      \repeat volta 2
      <<
        {
          \voiceOne
          \blæsIII
        }
        \new Voice {
          \voiceTwo
          \blæsBas
        }
      >>
  }
}

\book {
  \bookOutputSuffix "es"
  \header {
    subtitle = \markup \concat { "E" \raise #0.75 \small \flat " blæs" }
  }
\score {
  \transpose es c \song
}

}

\book {
  \bookOutputSuffix "bb"
  \header {
    subtitle = \markup \concat { "B" \raise #0.75 \small \flat " blæs" }
  }
\score {
  \transpose bes c' \song
}

}