\version "2.13"
currentMeter = #'(4 . 4)

% tryFetchCurrentMeter = \applyContext #(lambda (ct) (ly:context-property ct 'timeSignatureFraction))

repeatVoltaNoAlt = #(define-music-function (P L n music) (integer? ly:music?)
  ;	((ly:music-function-extract applyContext) P L (lambda (ct) (display ct) (define X (ly:context-property ct 'timeSignatureFraction))))
  ; 	(display (ly:context-property (ly:property-lookup-stats 'context) 'timeSignatureFraction))
  #{
    \repeat volta $n {
      $music
      \bar ""
      \once \override Score.TimeSignature #'stencil = ##f
      \time 1/32
      \once \override Score.RehearsalMark #'direction = #DOWN
      % 				\mark \markup{\concat{ $(markup (number->string n)) "×" } }
      % 				\once \override Score.SpacingSpanner #'shortest-duration = #(ly:make-moment 0 16)
      s32_\markup{\concat{ $(markup (number->string n)) "×" } }
      % 				-\tweak #'self-alignment-X #0
      % 				_\markup{\concat{ $(markup (number->string n)) "×" } }
      \once \override Score.TimeSignature #'stencil = ##f
      #(set-time-signature (car currentMeter) (cdr currentMeter))
    }
#})

% \displayMusic { R1*7^HH }

textInside = #(define-music-function (P L s) (string?)
  #{
    \textLengthOn
    \once\override MultiMeasureRestNumber #'stencil = ##f
    %\once\override MultiMeasureRestText #'extra-offset = #'(0 . -2)
    <>-\tweak #'self-alignment-Y #-2 ^\markup{\whiteout\pad-x #0.5 $(markup s)} R1*2
#})
textOver = #(define-music-function (P L s) (string?)
  #{
    \textLengthOn
    \once\override MultiMeasureRestNumber #'stencil = ##f
    %\once\override MultiMeasureRestText #'extra-offset = #'(0 . -2)
     <>^\markup{ $s } R1*2
#})

% \displayMusic { \textInside #"Hej Mor!!!!!!!" #3 }

compressRests = {
  \compressFullBarRests
  \override Staff.MultiMeasureRest #'expand-limit = #1
  \override Score.RehearsalMark #'break-align-symbols = #'(key-signature)
  \override Score.KeySignature #'break-align-anchor-alignment = #RIGHT
%   \set Staff.quotedEventTypes =
%       #'(note-event rest-event tie-event beam-event tuplet-span-event barline-event)
}

mySetup = \compressRests

bbInstr = \markup\concat{ "B" \raise #.5 \flat " instr." }

ebInstr = \markup\concat{ "E" \raise #.5 \flat " instr." }