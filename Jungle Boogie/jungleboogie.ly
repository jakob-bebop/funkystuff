\version "2.18"
\include "../tricks.ly"
\include "../../extractMusic2014.ly"
\header {
  title = "Jungle Boogie"
  composer = "***"
  tagline = "Freezecool || krimskrams.dk"
}

omkvæd =   \relative c'' \repeat volta 2 {
      r2^"Jungle boogie" 
      \times 2/3 { c16 (des c) } bes g
      \times 2/3 { c16 (des c) } bes g
      r1 r << r {s2 s_"4×"}>>
    }
riff = \relative c'' {
      g8 g16 bes~ bes bes f8 ~ f16 g8.
      bes8. c16~ c8 cis~ cis16 d8. f4 fis4
      
      bes8 bes16 g~ g g a8 ~ a16 bes8.
      g8. ges16~ ges8 f~ f16 d8. des4 c4

}
blæs = {
  \relative c'' {
    \repeat volta 2 {
      r2^"Get down" g'4 g
      r2 bes,16 a g8 bes16 a g f->
      r8 g-> r4 g'4 g
      r2 bes,16 a g8 bes16 a g \parenthesize f
    }
    {
   \mark "Riff"
      R1*4
      \riff
    }

   \omkvæd
   \break
   \mark "Riff"
    r1 <d' f g bes>1~ \< q~ q \! 
    \riff
    
    \omkvæd
    \break
      r1^"Get down" 
      r2 g4 g
    
    \repeat volta 2 {
      r2
      bes,16 a g8 bes16 a g f->
      r8 g-> r4 g'4 g
     % g'4 g
      %r2 bes,16 a g8 bes16 a g \parenthesize f
    }
   \mark "Riff"
    \riff
    R1*16_"groove+growl"
  }
}

blæsned = \transpose c' c \blæs

\book {
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "E" \raise #.5 \flat " instr." }
  }
  \score {
    \new Staff {
        \compressRests 
        \transpose es c' \multiExtractMusic s1*0 {
          \blæs s1*4
          \blæsned s1*8
          \blæs s1*4
          \blæsned s1*8
          \blæs s1*8
          \blæsned s1*32
        }
        %\winds #plain
    }
  }
}


\book {
  \bookOutputSuffix "bb"
  \header {
    instrument = \markup\concat{ "B" \raise #.5 \flat " instr." }
  }
  \score {
    \new Staff {
        \compressRests
        \transpose bes c' \blæs
    }
  }
}

%{\book {
  \bookOutputSuffix "bb-dyb"
  \header {
    instrument = \markup\concat{ "B" \raise #.5 \flat " instr." }
  }
  \score {
    \new Staff {
        \compressRests
        \transpose bes c \sharpen \winds #oktavop
    }
  }
}
%}