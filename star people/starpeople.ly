\version "2.16"
\include "../tricks.ly"
\header {
  title = "Star People"
  composer = "George Michael"
  tagline = "Freezecool || krimskrams.dk"
}

intro = {
  R1*3
  ces'2.~_\< ces8\! r des4\bendAfter #-4 as8_"Tenor" fes r ges r des 
  r des as' fes r ges r4
  r8 des as' fes ges des r des
  r bes ces des r des r4
  << 
    {
      as'8_"Fuld blæs" ges fes-. ges-.  fes8. fes16~    fes8    fes8~ fes  es des4-. r8 des es des-.
      as'8 ges fes-. ges-.  fes8. fes16~    fes8    fes8~ fes  es des4-. des8 es des4-.
    }
    {
      ces'8  bes as bes as8. as16~ as8 as~ as ges fes4 r8 fes ges fes
      ces'8 bes as bes as8. as16~ as8 as~ as bes as4 fes8 ges fes4
    }
  >>
}

versH =  \relative c'' {
  <<
    {ces2.. des8~ des1 ces2.. des8~ des1 des2.. ces8~ ces1 des2.. ces8~ ces1 }
    {as2.. as8~ as1 as2.. as8~ as1 beses2.. as8~ as1 beses2.. as8~ as1 }
    {ges2.. ges8~ ges1 ges2.. ges8~ ges1 ges2.. ges8~ ges1 ges2.. ges8~ ges1 }
    {eses2.. fes8~ fes1 eses2.. fes8~ fes1 eses2.. fes8~ fes1 eses2.. fes8~ fes1 }
  >>
}

versCis = \relative c''' {
      r2 r8 << { bes (ces bes~ bes)} {ges as ges ~ ges } >> ges r ges r ges r ges
      r2 es16 fes es8~ es des16 es
      des8. des16~ des8 des r < des' bes fes>-> q4->
    }

omkvEt = {
    R1*2
    r4 as8 (des,) ges fes des4~ 
    des2.\< des'4->\! \bendAfter #-4
    R1*2
    as8 fes16 ges fes4~ fes8 fes16 es fes8 des16 es 
    des8. des16~ des8 des r < des' bes fes>-> q4->
}

% Tenor: Brug fem krydser i stedet for 7 b'er!
sharpen = #(define-music-function (p l m) (ly:music?) #{
                                 \transpose ges fis $m
                                 #})
% Altsax: 4 og 6 b'er
plain =  #(define-music-function (p l m) (ly:music?) #{
                                 $m
                                 #})
oktavop = #(define-music-function (p l m) (ly:music?) #{
                                 \transpose c c' $m
                                 #})
winds = #(define-music-function (p l doStuff) (ly:music-function?) #{
  \key des \minor
  \override Score.RehearsalMark #'self-alignment-X = #-1
  \relative c'' {
    \intro
    \bar "||"
    \break
    % 0:38 i live
    \omkvEt
    \bar "||"
    \mark  \markup\concat{\musicglyph #"scripts.segno" "Vers 1 + 2"}
    R1*8
 %   \bar "||"
    %R1*8
    $doStuff {
      %\key ces \minor
      \versH  
    }
    %\key des \minor
 %   \bar "||"
    \mark Omkvæd
    \repeat volta 2  << \omkvEt {s1*7 s8*5 s4._\markup{\italic "D.S. Vers 2"}} >>
    \mark "Vers 3"
    %\override MultiMeasureRestNumber . #'tencil = ##f
    R1*8
    \versCis
    \bar "||"
    \textInside "Omkvæd etc."
    \bar "||"
    \repeat  unfold 2 \versCis
    \bar "||"
%    \mark  "Vers 1 + 2"
  \textInside "Fri leg"
    %R1*8
    %\bar "||"
    \repeat volta 2 \omkvEt
  }
#})
%}
\book {
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "E" \raise #.5 \flat " instr." }
  }
  \score {
    \new Staff {
        \compressRests 
        \transpose es c
        \winds #plain
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
        \transpose bes c' \sharpen \winds #plain
    }
  }
}
\book {
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
