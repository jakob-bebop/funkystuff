\version "2.13"

vers = \relative c' \repeat volta 2 { \mark "Intro/Vers"
	r4. c8 e-> a c4-.
	r2 r4 r8 b |
	a f c4-. r2 |
	r2 r4 r8 d | 
	fis-> a d4-. r2 r1|
	r4 r8 e c-> a e4-. |
	\override TextSpanner #'(bound-details left text) = "(Kun 2. gang)"
	\textSpannerDown
	r8 d'\startTextSpan b-> g d4-.\stopTextSpan r 
}

omk = \relative c'' \repeat volta 2 { \mark Omkvæd <e c a>1 <d b fis> <c a fis>4 <c a fis>8-- <c a fis>-. r2 r1}

riffA = \relative c''{
	\mark Riff
	\set Score . tupletSpannerDuration = #(ly:make-moment 1 4)
	a4 \times 2/3 { r8 g a } 
	c4 \times 2/3 { r8 a c | d e d c a g } 
	a4 \times 2/3 { r8 e g }
	a4 \times 2/3 { r8 g a } 
	c4 \times 2/3 { r8 a c | d e d c a c } 
	e4 }
riffB = \relative c'' {
	\times 2/3 { r8 d e }
	g4 \times 2/3 { r8 e g } 
	a4 \times 2/3 { r8 e g | c a g e g a } 
	c4 \times 2/3 { r8 g a | c a g a g e g e d e d c | e d c d c a c a g a } }
riffC = \relative c' {
	e8*2/3 g8*2/3
	\time 2/4 a4 r \bar "||" \time 4/4 
}

%---------------------------------------


\score {
	\new Staff {
		\transpose bes es' { \key a \minor \vers \omk \break \riffA \transpose c' c \riffB \riffC }
	}

	\header {
	title = "Master Blaster"
	composer = "Stevie Wonder"
		instrument = "Bb blæs"
	}
}
\score {
	\new Staff {
		\vers \omk \break \riffA \riffB \riffC 
	}
	\header {
	instrument = "Eb blæs"
	}
}
\paper{
	print-all-headers = ##t
}
