\version "2.13"
\include "deutsch.ly"
\include "../tricks.ly"
%%%%%%%%%%%
% Music
%
chord = \chordmode { c1*10:m7 s32 g2:7 gis:7 g:7 fis:13.11 f1:13.11 g:7 c1*4:m7 }
riff = \relative c'' { \repeatVoltaNoAlt #4 { r8 c r16 c r8 es,16 f g b \prall (b) g c c |
    r8 c b16 c8 g16 g'8-> es-> c-> r 
  }
}

chorusa = \relative c''' {  
  \mark "Omkvæd" g2 as! g fis | f1 | g2 \prall r }
chorusb = \relative c'' { h2 c h b  | < a c >1 | h2 \prall r }

postchorus = \relative c'' { c1 b4 a g a8 c,-> (c2) r | r1}

syg = { \repeatVoltaNoAlt #4 { r4 \repeat unfold 8 {b'16 es'8--} c''8-> c''-> r1 r
  } 
}

brk = \relative c' { \repeat volta 2 {es16-> f g b-> (b8) es,16-> f g b8.-> f8-> es | b'16-> g f es-> (es8) b'16-> g f es8.-> f8-> es} } 


%%%%%%%%%%%
% The score
%

\header {
  tagline = "Live on Sesame street [http://www.youtube.com/watch?v=_ul7X5js1vE]"
}

\score {
  \new Staff {\set Staff.instrumentName = "Tenor"
    \compressFullBarRests
    \override MultiMeasureRest #'expand-limit = #2
    \transpose es as {\key c \minor
      \mark "Vers"
      R1*8 \riff 
      \chorusb \postchorus \bar "||"
      R1*16 
      \mark "`Party' Riff"
      \syg \break
      \mark "Outro"
      \brk c'1 \fermata
    } \bar "|."
  }
  \header {
    title = "Superstition"
    composer = "Stevie Wonder"
    instrument = "Bb blæs"
  }
}
\score {
  <<
%{  \new ChordNames {
    \override ChordName #'font-name = #'"vera bold"
    \override ChordName #'font-series = #'bold
    \germanChords
    \chord 
  }%}
  \new Staff {
    \compressFullBarRests
    \override MultiMeasureRest #'expand-limit = #2
    \set Staff.instrumentName = "Alt"
    \key c \minor
    \mark "Vers"
    R1*8
    \riff \break  << \chorusa \chorusb >> \bar "||" 
    \transpose c' c'' \postchorus \bar "||" \break R1*16 
    \mark "`Party' riff" \transpose c c' { \syg \break
      \mark "Outro" \brk c''1 \fermata } \bar "|."
  }
>>
  \header {
    instrument = "Eb blæs"
  }
  %{	\midi{}
    \layout{clip-regions = #(list
  (cons
   (make-rhythmic-location 9 0 1)
   (make-rhythmic-location 11 1 1)))
    }%}
}
\paper {
%   system-system-spacing #'space = #14
  print-all-headers = ##t
}