\include "gottoget.ly"
\header {
	title = "I Got To Get You"
	instrument = "Bb blæs"
	meter = "98% Funk"
}
ten = \transpose bes es' { 
	\compressFullBarRests
	\override MultiMeasureRest #'expand-limit = #2
	\key a \major
	\Break \bb 
	\mark "1.Ref" R1*8 \bb \Break \bb \break
	\mark "1.Vers" R1*8 \bb \mark "2.Ref" R1*8  \Riff \break
	\mark "Interlude" R1* 8 \bb \mark "2.Vers" R1*8 \bb 
	\mark "3.Ref" R1* 8 \bar "" \break \Riff
	\mark "Interlude" R1* 8 \bb \mark "3.Vers" R1*8 \bb \break 
	\textInside "SOLO" \bb \mark "4.Ref" R1* 8 \Riff \break
	\mark "Interlude" R1*8 \mark "4.Vers" \VersFire
	\textInside "AD LIB." \bb \Break \bar "|."
}

{\ten}