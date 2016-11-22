\version "2.13.46"
\header {
  title = "I Wish"
  composer = "S.W."
  tagline = ""
}

\include "../tricks.ly"

form = \markup \column { \bold "Form:" "Intro - vers - vers - omkvæd" "Vers - vers - 2 × omkvæd" "Groove - outro" }

vers = \relative c' {
  R1*12
  \bar "||"
  \mark "Vers"
  R1*2
  r8 <d g b> r16 q8. <cis e a>4 r
  r8 <d g b> r16 q8 <e a cis>16 r2
  R1*2
  r8 <d g b> r16 q8. <cis e a>4 r
  r8 <d g b> r16 q8 <e a cis>16 r2
}

omkv = \transpose c es \relative c' {
  \repeat unfold 3 {
    r4 <b e gis> r <ais cis fis>
    r4 <b e gis> r8 ais'-> b-> bis->
  }
  r4 <b, e gis> r <ais cis fis>
  r4 <b e gis> r8 ais'-> b-> bis->%-\tweak #'X-offset #-20 _\markup \italic "(dobbelt omkvæd 2. gang!)"
}

bridgeTpt =  \relative c'' {
  %\override Score . RehearsalMark #'self-alignment-X = #LEFT
  %\mark "Vers slutning (2. & 4. gang)"
  %       dis8-. cis-. b4~ b8. cis16~ cis b8 a16~ 
  dis8-. cis-. b4~ b8 r16 cis16 r b[ r a16]~
  a4~ a8 b16 c!16~ c e8-> fis16->~ fis4 |
  dis8-. cis-. b4~ b8 r16 cis16 r b[ r a16]~
  a4 r4 r8 b16-> d->~ d4
}
bridgeSax =     \relative c' {
  fis2\< f e2.\! r4
  fis2\< f e\! g->
}

bridge = {
  <<
    \context Staff = top {
      %\key g \major
      \bridgeTpt
    }
    \new Staff = first {
      \key g \major
      \bridgeSax
    }
  >>
}

trumpetOut = \relative c''' {
  \repeat volta 2 {
    \mark "Outro"
    %   \key ges \major
    < b g >8. <a fis>16~ q8 <g e>~ q16 <a e>8. <g d>8. <e cis>16 |
    r b8. << r8  \\ {a8 b} >> cis4 cis |
    b8 r r b cis4 cis~ |
    cis8 b r4 r2-\tweak #'self-alignment-X #-1 _\markup \italic "ad lib."
  }
  < b' g >8. <a fis>16~ q8 <g e>~ q q16-^  q-^
  \bar "|."
}

% For Eb inst

musicId = #(define-music-function (P L m) (ly:music?) #{ $m #} )
octaveUp = #(define-music-function (P L m) (ly:music?) #{ \transpose c c' $m #} )

theScore = #(define-music-function (P L octavate) (ly:music-function?)
              #{
                \transpose e c <<
                  %{
                    \context ChordNames = cn \chordmode {
                    e2:m a:7
                    \repeat unfold 3 { e2:m a:7 }
                    }
                  %}
                  \compressRests

                  \new Staff = top {
                    \key g \major
                    \mark "Intro"
                    R1*8 _ "Bas + klaver"
                    \mark "Vers"
                    \repeat volta 2 {
                      \vers
                      \break
                      \bridgeTpt
                      \break
                      \override Score . RehearsalMark #'self-alignment-X = #-1
                      \bar "||"
                      \mark "Omkv."
                      \omkv
                    }
                    \repeat volta 2 {
                      \once \override MultiMeasureRestNumber #'stencil = ##f
                      R1*4 ^ \markup \italic "ad lib."
                    }
                    %    \bar "||"
                    \break

                    \trumpetOut
                  }
                  %\overrideProperty #"Score.NonMusicalPaperColumn"
                  %          #'line-break-system-details #'((Y-offset . 70))
                  %  \new ChordNames = cn \chordmode {
                  %    b2:7 cis:7 fis:m7 a:m13
                  %    b2:7 cis:7 fis:m7 b:7aug9+
                  %  }
                  \new Staff = bund {
                    \key g \major
                    s1*8
                    s1*12
                    s1*8
                    $octavate \bridgeSax
                  }
                  %{
                    <<
                    \context ChordNames = cn \chordmode {
                    e2:m a:7
                    \repeat unfold 3 { e2:m a:7 }
                    }
                    \context Staff = first {
                    \ottava #1
                    \repeat volta 2 \trumpetOut
                    }
                    >>
                  %}
                >>
              #})

\book {
  \bookOutputSuffix "eb"
  \header {
    instrument = \markup\concat{ "Blæs E" \raise #0.5 \small \flat }
  }
  \score{
    \transpose es, c \theScore #musicId
    \layout {
      \context {
        \Staff
        \RemoveEmptyStaves
        \override VerticalAxisGroup #'remove-first = ##t
      }
    }
  }
  \form
}

%{
  theScore = {
  \bridge
  \break
  \overrideProperty #"Score.NonMusicalPaperColumn"
  #'line-break-system-details #'((Y-offset . 70))
  <<
  \context ChordNames = cn \chordmode {
  e2:m a:7
  \repeat unfold 3 { e2:m a:7 }
  }
  \context Staff = first {
  \repeat volta 2 \trumpetOut
  }
  >>
  }
%}

\book {
  \bookOutputSuffix "bb"
  \header {
    instrument = \markup\concat{ "Blæs B" \raise #0.5 \small \flat }
  }
  \score{
    \transpose bes, c \theScore #octaveUp
    \layout {
      \context {
        \Staff
        \RemoveEmptyStaves
        \override VerticalAxisGroup #'remove-first = ##t
      }
    }
  }
  \form
}

