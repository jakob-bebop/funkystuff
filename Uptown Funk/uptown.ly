\version "2.18"
\include "../tricks.ly"
\include "../extractMusic2014.ly"
\header {
  title = "Uptown Funk"
  composer = \markup \center-column { "Mark Ronson, Jeff Bhasker,"  "Bruno Mars, Philip Lawrence" }
  tagline = "Freezecool || krimskrams.dk"
}

omkvBlæsSyv = \relative c'' {
  r2. <b d f>16 q r8
  \bar "||"
  
  f'16 d c d r8 f16 d c d r8 f16 d c d
  
  r8 <b d f>8-^ r4 r f'16 e d c
  
  r1
  
  r2 r8 <b d f>16-> q-> q-> q-> q-> q-> 
  
  f'16 d c d r8 f16 d c d r8 f16 d c d
  
  r8 <b d f>8-^ r4 r f'16 e d c
  
  r1
  
  r2 r8 <b d f>16-> q-> q-> q-> q-> q-> 
  
  r2 r8 <b d f>16-> q-> q-> q-> q-> q-> 
  
  r2 r8 <b d f>16-> q-> q-> q-> q-> q-> 
  
  r2 r8 <b d f>16-> q-> q-> q-> q-> q-> 
  
}

omkvBlæs = {\omkvBlæsSyv r1}

omkvTilsidst = \relative c' { %3:53
  r2 r8 <f d'>16 q r4 
  r2 r4 f'16 e d c
  r8 d r4 r8 <d f,>16 q  r4
  r2 a16 c d <f d b>~ q8 <d c a>
  
  r8 d16 (c) r4 r8 <d f,>16 q r4 
  r2 r4 f16 e d c
  r2 r8 d16 ( c d8-. ) r8
  d8-. c-. b-. a-. f-. g-. r16 f8. ->
  
  % Round II
  \bar "||"
  r8 d' r4 r8 <d f,>16 q r4 
  r2 r4 f16 e d c
  r8 d r4 r8 <d f,>16 q  r4
  <d f>8-. q-. q-. q-. a16 c d <f d b>~ q8 <d c a>

  r8 d16 (c) r4 r8 <d f,>16 q r4 
  %   r8 d16 (c) r4 r8 <d f,>16 q r4 
  r2 r4 f16 e d c
  r4 r8. d16 f, g a8-. c-- d-. 
  <a c f>16 q q q r q8 q16 q q r8 <f' a d>4->

}

blæs =
{
  \compressRests
  \textLengthOn
  
  \key d \dorian
  
  <>_"Doh doh - intro"
  R1*8
  
  \repeat volta 2 {
  
    R1*8
    
    <>_"Too hot - hot damn!"
    R1*8 
    
    <>_"Girls hit your hallelujah - Ooh!"
    R1*7 %
    
    \omkvBlæs
    

  }
  <>_"Doh!"
  R1*12
  
  R1*7
  
  \omkvBlæsSyv
  
  d''4 d'' d'' d''
  
  \bar "||"
  
  \omkvTilsidst
  
  \bar "|."
  
} 

\book {
  \bookOutputSuffix "bb"
  \header {
    instrument = \markup\concat{ "B" \raise #.5 \flat " instr." }
  }
  \new Score {
    \transpose bes, c \blæs
  }
}

\book {
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "E" \raise #.5 \flat " instr." }
  }
  \new Score {
    \transpose es c \blæs
  }
}

